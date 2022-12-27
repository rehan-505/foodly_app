import 'package:flutter/cupertino.dart';
import 'package:foodly_app/ui/base/authentication_viewmodel.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../app/app.router.dart';
import '../../common/global_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthViewModel extends AuthenticationViewModel {
  FocusNode focusNode = FocusNode();
  TextEditingController smsCodeController = TextEditingController();
  String? verificationId;
  GlobalKey<FormState> globalKeyOtpForm = GlobalKey<FormState>();

  Country selectedCountry =   const Country(
    name: "Pakistan",
    flag: "🇵🇰",
    code: "PK",
    dialCode: "92",
    minLength: 10,
    maxLength: 10,
  );

  String? phoneErrorText;
  String? phone ;
  bool codeSent = false;


  @override
  Future runAuthentication() async{
    if(!codeSent){
      if (phone == null) {
        phoneErrorText = "Phone is required";
        notifyListeners();
      }

      if (phone == null || phoneErrorText != null) {
        return false;
      }

        setBusy(true);
        await authService.verifyPhone(
          phone: phone!,
          onVerificationCompleted: onVerificationCompleted,
          onVerificationFailed: (FirebaseAuthException e) {
            setValidationMessage(e.message.toString());
            notifyListeners();
          },
          onCodeSent: onCodeSent,
          onAutoRetrievalTimeout: onAutoRetrievalTimeout);

    }
  }

  void navigateBack(){
    navigationService.back();
  }


  void onVerificationCompleted (PhoneAuthCredential credential) async {
    codeSent = true;
    smsCodeController.text = credential.smsCode ?? "";
    setBusy(false);

    if(FirebaseAuth.instance.currentUser!=null){
      navigationService.navigateTo(Routes.homeView);
    }

    return;
  }


  void validatePhone(PhoneNumber? value){
    phoneErrorText = phoneValidation(value?.number,selectedCountry);
    notifyListeners();

    phone = value?.completeNumber;

  }

  void onAutoRetrievalTimeout (String verificationId) {
    // Auto-resolution timed out...
  }

  void onCodeSent(String verificationId, int? resendToken) async {
    codeSent = true;
    this.verificationId = verificationId;
    setBusy(false);
    // notifyListeners();
  }

  void verifySmsCode() async{
    setBusy(true);
    if(globalKeyOtpForm.currentState?.validate() ?? false){
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCodeController.text);
      try{
        if (await authService.signInWithPhoneCredential(credential)) {
          navigationService.navigateTo(
            Routes.homeView,
          );
        }
      }
      on FirebaseAuthException catch (e){
        setValidationMessage(e.message.toString());
      }
      catch (e){
        setValidationMessage(e.toString());
      }
    }
    setBusy(false);

  }

}
