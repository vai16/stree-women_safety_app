import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color textColor;
  final Color buttonColor;
  final String text;
  final bool autoSize;
  final void Function() onPressed;
  const CustomButton(
      {@required this.text,
      this.buttonColor,
      this.onPressed,
      this.textColor,
      Key key,
      this.autoSize = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: autoSize ? null : 300,
        height: autoSize ? null : 40,
        child: ElevatedButton(
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              primary: Colors.red[400],
              onPrimary: Colors.white,
              onSurface: Colors.grey,
              textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: textColor ?? Colors.white),
            ),
            onPressed: onPressed ??
                () {
                  print('Key');
                }));
  }
}
