import 'package:flutter/cupertino.dart';
import 'package:foodly_app/ui/base/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PhoneAuthViewModel extends AuthenticationViewModel {
  FocusNode focusNode = FocusNode();

  @override
  Future runAuthentication() {
    // TODO: implement runAuthentication
    throw UnimplementedError();
  }

  void navigateBack(){
    navigationService.back();
  }





}
