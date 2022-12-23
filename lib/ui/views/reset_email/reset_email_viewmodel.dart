import 'package:foodly_app/ui/base/authentication_viewmodel.dart';

class ResetEmailViewModel extends AuthenticationViewModel {
  ResetEmailViewModel({required this.email}) : super();

  final String email;

  void navigateBack(){
    navigationService.back();
  }

  @override
  Future runAuthentication() async {
    return await authService.sendResetEmail(email);
  }

}
