import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

abstract class AuthenticationViewModel extends FormViewModel {

  final AuthService authService = locator<AuthService>();

  final navigationService = locator<NavigationService>();
  AuthenticationViewModel();

  @override
  void setFormStatus() {}

  Future saveData() async {
    try {
      print('into save data');
      await runBusyFuture(runAuthentication(), throwException: true,);
      print('save data completed');


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
