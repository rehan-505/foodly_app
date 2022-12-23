import 'package:foodly_app/ui/common/global_functions.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';
import '../../base/authentication_viewmodel.dart';

class LoginViewModel extends AuthenticationViewModel{
  LoginViewModel() : super(successRoute: Routes.loginView);
  final AuthService authService = locator<AuthService>();


  bool passVisible = true;
  String? emailErrorText;
  String? passErrorText;
  String? email ;
  String? passValue;



  eyePressed(){
    passVisible = !passVisible;
    notifyListeners();
  }


  @override
  Future<bool> runAuthentication() async{

    if(email==null ) {
      emailErrorText = "Email is required";
      notifyListeners();
    }
    if (passValue == null ){
      passErrorText = "Password is required";
      notifyListeners();
    }

    if(email==null|| passValue == null || passErrorText !=null || emailErrorText!=null){
      return false;
    }



    // TODO: implement runAuthentication
    return (await authService.signInWithEmailAndPass(email!, passValue!));

  }

  void navigateToSignUp() =>
      navigationService.replaceWith(Routes.signupView);

  void navigateToForgotPass() =>
      navigationService.navigateTo(Routes.forgotPassView);


  void validateEmail(String? x){
    emailErrorText = emailValidation(x);
      notifyListeners();

      email = x!;


  }

  void validatePass(String? x){

   passErrorText = passwordValidation(x);
      notifyListeners();


      passValue = x!;


  }


}

