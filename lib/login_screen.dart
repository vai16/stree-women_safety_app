import 'package:flutter/material.dart';
import 'package:stree/otp_confirmation.dart';
import 'package:stree/widgets/custom_button.dart';
import 'package:stree/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phoneNo;
  FocusNode _blankFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightPiece = MediaQuery.of(context).size.height / 10;
    var widthPiece = MediaQuery.of(context).size.height / 10;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.red[200],
            body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(_blankFocusNode);
                },
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                          "ENTER OTP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'OpenSans-Bold'),
                        )),
                        SizedBox(
                          height: 200,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthPiece),
                            child: buildCustomTextFieldForMobileNo()),
                        SizedBox(height: 20),
                        Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthPiece),
                            child: buildCustomButtonForSendOtpButton(context)),
                      ],
                    )))));
  }

  CustomButton buildCustomButtonForSendOtpButton(BuildContext context) {
    return CustomButton(
        text: 'Send OTP',
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    OTPConfirmationPage(phoneNo: phoneNo)));
          }
        });
  }

  CustomTextField buildCustomTextFieldForMobileNo() {
    return CustomTextField(
        maxLength: 10,
        hintText: 'Enter 10 digit mobile no.',
        inputType: TextInputType.phone,
        onSaved: ((value) {
          phoneNo = '+91$value';
        }),
        validator: (value) {
          if (value.length < 10 || value.length > 10) {
            return "Invalid";
          } else {
            print(value.length);
            _formKey.currentState.save();
            return null;
          }
        });
  }
}
