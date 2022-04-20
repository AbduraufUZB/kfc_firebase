import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/provider/set_state_provider.dart';
import 'package:provider/provider.dart';

class FirebaseAuthService {
  static final auth = FirebaseAuth.instance;
  static String verificationID = "";

  static loginWithPhone(String phoneNumber) async {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              print("User already logged in");
            }
          });
        },
        verificationFailed: (FirebaseException e) {
          debugPrint(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  //todo Verify OTP
  static Future<bool> verifyOTP(String sentCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: sentCode);
      await auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      debugPrint(Exception(e).toString());
      return false;
    }
  }

  static logAut(BuildContext context) async {
    //await FirebaseAuthService.auth.currentUser!.delete();
    Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false);
    context.read<SetStateProvider>().mySetState();
  }
}
