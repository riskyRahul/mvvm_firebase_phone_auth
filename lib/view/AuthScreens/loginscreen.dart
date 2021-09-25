import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/utils/string.dart';
import 'package:test/view/AuthScreens/verify_screen.dart';
import 'package:test/viewmodels/view_model_provider.dart';
import 'package:provider/provider.dart';
import 'package:test/widgets/rounded_button.dart';
import 'package:test/widgets/user_text_field.dart';

class AuthScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  String selectedCountryCode = '';

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
            child: Text('OK!'),
          )
        ],
      ),
    );
  }

  verifyPhone(BuildContext context) {
    try {
      print(selectedCountryCode + controller.text.toString());
      Provider.of<AuthProvider>(context, listen: false)
          .verifyPhone(selectedCountryCode,
              selectedCountryCode + controller.text.toString())
          .then((value) {
        Navigator.of(context).pushNamed(VerifyScreen.routeArgs);
      }).catchError((e) {
        String errorMsg = error_msg;
        if (e.toString().contains(
            try_again_later)) {
          errorMsg = please_wait;
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  void _onCountryChange(CountryCode countryCode) {
    selectedCountryCode = countryCode.toString();
    print(country_selected + countryCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        login_title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        login_desc,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CountryCodePicker(
                    initialSelection: selectedCountryCode,
                    onChanged: _onCountryChange,
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                UserTextField(
                  titleLabel: enter_nub_txt_fild_lable,
                  maxLength: 10,
                  icon: Icons.smartphone,
                  controller: controller,
                  inputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 48,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedButton(
                    title: send_otp,
                    onpressed: () {
                      verifyPhone(context);
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
