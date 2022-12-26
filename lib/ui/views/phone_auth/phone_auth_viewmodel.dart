import 'package:flutter/cupertino.dart';
import 'package:foodly_app/ui/base/authentication_viewmodel.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../app/app.router.dart';
import '../../common/global_functions.dart';

class PhoneAuthViewModel extends AuthenticationViewModel {
  FocusNode focusNode = FocusNode();
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


  @override
  Future runAuthentication() async{

    if(phone==null ) {
      phoneErrorText = "Phone is required";
      notifyListeners();
    }

    if(phone==null|| phoneErrorText!=null){
      return false;
    }

    navigateToOTPScreen();

  }

  void navigateBack(){
    navigationService.back();
  }


  navigateToOTPScreen(){
    navigationService.navigateTo(Routes.phoneOtpView, arguments: PhoneOtpViewArguments(phoneNo: phone!));
  }

  void validatePhone(PhoneNumber? value){
    phoneErrorText = phoneValidation(value?.number,selectedCountry);
    notifyListeners();

    phone = value?.completeNumber;

  }


}
