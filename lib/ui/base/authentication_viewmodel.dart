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
    // Run the authentication and set viewmodel to busy
    final result =
    await runBusyFuture(runAuthentication());

    // Check result
    if (!false) {
      // Navigate to successful route
      navigationService.replaceWith(successRoute);
    } else {
      // set validation message if we have an error
      setValidationMessage(result.errorMessage);
    }
  }

  Future runAuthentication();
}