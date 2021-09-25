import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Services/webservice.dart';
import 'package:test/models/dose_model.dart';

class AuthProvider with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _firebaseAuth = FirebaseAuth.instance;
  String? verificationId;

  // fatch api data form web URL service
  Future<AssociatedDrug> provideDoseData() async {
    var data = await WebService().fetchDoseData();
    notifyListeners();
    return data;
  }

  //Starts the phone number verification process for the given phone number.
  Future<void> verifyPhone(String countryCode, String mobile) async {
    var mobileToSend = mobile;
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      this.verificationId = verId;
    };
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: mobileToSend,
          codeAutoRetrievalTimeout: (String verId) {
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(
            seconds: 120,
          ),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (exceptio) {
            throw exceptio;
          });
    } catch (e) {
      throw e;
    }
  }

  // verify the OTP
  Future<void> verifyOTP(String otp) async {
    final SharedPreferences prefs = await _prefs;
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      final UserCredential user =
          await _firebaseAuth.signInWithCredential(credential);
      final User currentUser = _firebaseAuth.currentUser!;
      print(user);

      if (currentUser.uid != "") {
        print(currentUser.uid);
        prefs.setString("uid", currentUser.uid.toString());
        prefs.setString("phoneNumber", currentUser.phoneNumber.toString());
      }
    } catch (e) {
      throw e;
    }
  }

  showError(error) {
    throw error.toString();
  }
}
