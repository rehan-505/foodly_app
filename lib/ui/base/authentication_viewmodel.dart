import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
abstract class AuthenticationViewModel extends FormViewModel {

  final navigationService = locator<NavigationService>();
  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    try {
      await runBusyFuture(runAuthentication(), throwException: true,);

      // await _handleAuthenticationResponse(result);
    }  catch (e) {
      setValidationMessage(e.toString());
    }
  }

  Future runAuthentication();
}
