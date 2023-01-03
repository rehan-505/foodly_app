import 'package:foodly_app/app/app.router.dart';
import 'package:foodly_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:places_service/places_service.dart' as ps;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {

  final _authService = locator<AuthService>();
  final _navigateService = locator<NavigationService>();

  final _placesService = locator<ps.PlacesService>();

  Future runStartupLogic() async{
      if (_authService.isCurrentUserLogin()) {
        _placesService.initialize(
          apiKey: dotenv.env['GOOGLE_API_KEY']!,
        );


        _navigateService.replaceWith(Routes.selectLocationView);
      } else {
        _navigateService.replaceWith(Routes.onboardingView);
      }
  }
}
