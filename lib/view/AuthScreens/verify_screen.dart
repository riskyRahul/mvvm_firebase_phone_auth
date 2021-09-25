import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/utils/string.dart';
import 'package:test/view/HomeScreens/CardScreen.dart';
import 'package:test/viewmodels/view_model_provider.dart';
import 'package:test/widgets/rounded_button.dart';
import 'package:test/widgets/user_text_field.dart';

import 'package:provider/provider.dart';

class VerifyScreen extends StatelessWidget {
  static const routeArgs = '/verify-screen';
  final controller = TextEditingController();

  showSnackBar(msg, color, context) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: new Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 3.0,
        backgroundColor: color,
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(error_occured),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(ok),
          )
        ],
      ),
    );
  }

  verifyOTP(BuildContext context) {
    try {
      Provider.of<AuthProvider>(context, listen: false)
          .verifyOTP(controller.text.toString())
          .then((_) {
        print("Success fully login");
        // Navigator.of(context).pushReplacementNamed(CardScreen.routeArgs);
        Navigator.pop(context);
      }).catchError((e) {
        String errorMsg = error_msg;
        if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
          errorMsg = sesson_exp;
        } else if (e.toString().contains("ERROR_INVALID_VERIFICATION_CODE")) {
          errorMsg = wrong_otp;
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        otp_title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      otp_desc,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                UserTextField(
                  titleLabel: otp_txt_field_lable,
                  maxLength: 6,
                  icon: Icons.dialpad,
                  controller: controller,
                  inputType: TextInputType.phone,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedButton(
                    title: otp_btn_lable,
                    onpressed: () {
                      verifyOTP(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
