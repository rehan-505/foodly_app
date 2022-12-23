import 'package:foodly_app/app/app.locator.dart';
import 'package:foodly_app/services/auth_service.dart';
import 'package:foodly_app/ui/views/signup/signup_view.form.dart';

import '../../../app/app.router.dart';
import '../../base/authentication_viewmodel.dart';

class SignUpViewModel extends AuthenticationViewModel{
  SignUpViewModel() : super(successRoute: Routes.loginView);
  final AuthService authService = locator<AuthService>();

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
    await authService.signUpWithEmailAndPass(emailValue, passwordValue!);
    return;
  }

  void navigateToLogin(){
    navigationService.replaceWith(Routes.loginView);
  }

  void navigateBack() =>
      navigationService.back();

}