import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stree/homescreen.dart';
import 'package:stree/main.dart';

class PhoneAuth {
  final String phoneNo;
  String verificationId;
  String errorMessage = '';
  final auth = FirebaseAuth.instance;

  PhoneAuth({@required this.phoneNo});

  Future<void> verifyPhone(BuildContext context) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      final res = await auth.signInWithCredential(phoneAuthCredential);
      HomePage();
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Auth Exception is ${authException.message}');
    };
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print('Verification Id is $verificationId');
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    await auth.verifyPhoneNumber(
      phoneNumber: '+91' + phoneNo,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  signIn(context, {@required String smsOTP}) {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      auth.signInWithCredential(credential);
    } catch (e) {
      print("Error");
    }
  }

  void signout() {
    auth.signOut();
  }
}
