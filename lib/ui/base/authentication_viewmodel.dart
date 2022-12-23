import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationViewModel extends FormViewModel {

  final navigationService = locator<NavigationService>();
  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    try {
      print('into save data');
      await runBusyFuture(runAuthentication(), throwException: true,);

      // await _handleAuthenticationResponse(result);
    }
    on FirebaseAuthException catch(e){

      setValidationMessage(e.message);
    }
    catch ( e) {
      setValidationMessage(e.toString());
    }
  }

  Future runAuthentication();
}
