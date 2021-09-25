import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final title;
  final VoidCallback? onpressed;

  RoundedButton({@required this.title, @required this.onpressed});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: width,
        height: 48.0,
        child: RaisedButton(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onpressed,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white, fontSize: 14),
          ),
          color: Theme.of(context).primaryColor,
          splashColor: Colors.green,
        ),
      ),
    );
  }
}
