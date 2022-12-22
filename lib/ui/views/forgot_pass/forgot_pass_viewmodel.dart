
import '../../../app/app.router.dart';
import '../../base/authentication_viewmodel.dart';

class ForgotPassViewModel extends AuthenticationViewModel{
  ForgotPassViewModel() : super(successRoute: Routes.loginView);

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

  void navigateToSignUp() =>
      navigationService.replaceWith(Routes.signupView);


  void navigateBack(){
    navigationService.back();
  }

}