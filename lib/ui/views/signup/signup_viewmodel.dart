import '../../../app/app.router.dart';
import '../../base/authentication_viewmodel.dart';
import '../../common/global_functions.dart';

class SignUpViewModel extends AuthenticationViewModel{
  SignUpViewModel() : super();

  bool passVisible = true;
  String? emailErrorText;
  String? passErrorText;
  String? nameErrorText;
  String? email;
  String? passValue;
  String? nameValue;

  eyePressed(){
    passVisible = !passVisible;
    notifyListeners();
  }

  @override
  Future runAuthentication() async{

    print('into sign up run auth');

    if(email==null ) {
      emailErrorText = "Email is required";
      notifyListeners();
    }
    if (passValue == null ){
      passErrorText = "Password is required";
      notifyListeners();
    }
    if (nameValue == null ){
      nameErrorText = "Name is required";
      notifyListeners();
    }


    if(email==null|| passValue == null ||  nameValue==null || passErrorText !=null || emailErrorText!=null || nameErrorText != null){
      return false;
    }


    final bool result = await authService.signUpWithEmailAndPass(email, passValue!,name: nameValue);
    if(result){
      navigationService.navigateTo(Routes.homeView);
    }
    return;
  }

  void navigateToLogin(){
    navigationService.replaceWith(Routes.loginView);
  }

  void navigateBack() =>
      navigationService.back();

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

  void validateName(String? x){

    nameErrorText = generalValidation(x);
    notifyListeners();


    nameValue = x!;


  }

}