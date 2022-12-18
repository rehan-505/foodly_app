import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../base/authentication_viewmodel.dart';

class LoginViewModel extends AuthenticationViewModel{
  LoginViewModel() : super(successRoute: Routes.loginView);

  bool passVisible = true;

  eyePressed(){
    passVisible = !passVisible;
    notifyListeners();
  }

  Future saveData() async{

  }

  @override
  Future runAuthentication() async{
    // TODO: implement runAuthentication
    await Future.delayed(Duration(seconds: 3));
    return;
  }

  void navigateToCreateAccount() =>
      navigationService.navigateTo(Routes.loginView);


}