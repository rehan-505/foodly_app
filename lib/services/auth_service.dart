import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  ///returns success status
  Future<bool> signInWithEmailAndPass(String email,String pass) async{

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);

    return FirebaseAuth.instance.currentUser!=null;

  }


  Future<bool> signUpWithEmailAndPass(var email,String pass, {String? name}) async{

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass).then((value) => value.user?.updateDisplayName(name));
    return FirebaseAuth.instance.currentUser!=null;

  }

  Future<bool> sendResetEmail(String email) async{

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    return true;

  }

  Future verifyPhone({
    required String phone,
    required void Function(PhoneAuthCredential) onVerificationCompleted,
    required void Function(FirebaseAuthException) onVerificationFailed,
    required void Function(String, int?) onCodeSent,
    required void Function(String) onAutoRetrievalTimeout,
  }) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout:  onAutoRetrievalTimeout,
    );

  }

  Future<bool> signInWithPhoneCredential(PhoneAuthCredential phoneAuthCredential) async{
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    return FirebaseAuth.instance.currentUser!=null;
  }




}
