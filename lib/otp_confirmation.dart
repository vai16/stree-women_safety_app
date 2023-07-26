import 'package:flutter/material.dart';
import 'package:stree/homescreen.dart';
import 'package:stree/widgets/custom_button.dart';
import 'package:stree/widgets/custom_text_field.dart';
import 'package:stree/services/phone_auth.dart';

class OTPConfirmationPage extends StatefulWidget {
  final String phoneNo;

  OTPConfirmationPage({Key key, this.phoneNo}) : super(key: key);

  @override
  _OTPConfirmationPageState createState() => _OTPConfirmationPageState();
}

class _OTPConfirmationPageState extends State<OTPConfirmationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _blankFocusNode = FocusNode();
  String phoneNo;
  PhoneAuth phoneAuth;
  String _otp;

  @override
  void initState() {
    super.initState();
    phoneNo = widget.phoneNo;
    phoneAuth = PhoneAuth(phoneNo: widget.phoneNo);
    phoneAuth.verifyPhone(context);
  }

  String numberCountValidator(value, int requiredCount) {
    if (value.length < requiredCount || value.length > requiredCount) {
      return "Invalid";
    } else {
      _formKey.currentState.save();
      return null;
    }
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
          child: Padding(
            padding: EdgeInsets.all(widthPiece / 2),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(top: heightPiece),
                  child: buildOTPsentText()),
              Padding(
                  padding: EdgeInsets.only(top: heightPiece),
                  child: buildEnterOTPText()),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: otpInputFieldConfig()),
              Padding(
                  padding: EdgeInsets.only(top: heightPiece),
                  child: CustomButton(
                      text: 'Proceed',
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          phoneAuth.signIn(context, smsOTP: _otp);
                          //HomeScreen();
                        }
                      })),
            ]),
          ),
        ),
      ),
    ));
  }

  CustomTextField otpInputFieldConfig() {
    return CustomTextField(
        hintText: 'Enter OTP Here',
        inputType: TextInputType.number,
        onSaved: ((value) {
          _otp = value;
        }),
        validator: (value) => numberCountValidator(value, 6));
  }

  CustomButton proceedButton() {
    return CustomButton(
        text: 'Proceed',
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            phoneAuth.signIn(context, smsOTP: _otp);
          }
        });
  }

  buildOTPsentText() {
    return Text(
      'OTP SENT',
      style:
          TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Open_Sans'),
    );
  }

  showRegisteredMobileNumber() {
    return Text(widget.phoneNo,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
  }

  buildEnterOTPText() {
    return Text(
      "Enter OTP",
      style:
          TextStyle(fontSize: 0, color: Colors.white, fontFamily: 'Open_Sans'),
    );
  }
}
