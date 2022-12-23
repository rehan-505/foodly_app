
import '../../../app/app.router.dart';
import '../../base/authentication_viewmodel.dart';
import '../../common/global_functions.dart';

class ForgotPassViewModel extends AuthenticationViewModel{
  ForgotPassViewModel() : super();

  String? emailErrorText;
  String? email ;


  bool passVisible = true;

  eyePressed(){
    passVisible = !passVisible;
    notifyListeners();
  }


  @override
  Future runAuthentication() async{

    if(email==null ) {
      emailErrorText = "Email is required";
      notifyListeners();
    }

    if(email==null || emailErrorText!=null){
      return false;
    }


    if(await authService.sendResetEmail(email!)){
      navigationService.navigateTo(Routes.resetEmailView,arguments: ResetEmailViewArguments(email: email!));
    }

  }


  void navigateBack(){
    navigationService.back();
  }

  void validateEmail(String? x){
    emailErrorText = emailValidation(x);
    notifyListeners();

    email = x!;


  }


}