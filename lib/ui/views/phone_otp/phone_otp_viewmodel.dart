import 'package:foodly_app/ui/base/authentication_viewmodel.dart';

import '../../../app/app.router.dart';

class PhoneOtpViewModel extends AuthenticationViewModel {




  void navigateBack(){
    navigationService.back();
  }




  @override
  Future runAuthentication() {
    // TODO: implement runAuthentication
    throw UnimplementedError();
  }
}
