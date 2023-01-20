import 'package:foodly_app/services/auth_service.dart';
import 'package:foodly_app/services/location_service.dart';
import 'package:foodly_app/ui/views/forgot_pass/forgot_pass_view.dart';
import 'package:foodly_app/ui/views/login/login_view.dart';
import 'package:foodly_app/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:foodly_app/ui/views/onboarding/onboarding_view.dart';
import 'package:foodly_app/ui/views/home/home_view.dart';
import 'package:foodly_app/ui/views/reset_email/reset_email_view.dart';
import 'package:foodly_app/ui/views/phone_auth/phone_auth_view.dart';
import 'package:foodly_app/ui/views/select_location/select_location_view.dart';
import 'package:foodly_app/ui/views/startup/startup_view.dart';
import 'package:places_service/places_service.dart';

// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignupView, ),
  MaterialRoute(page: ForgotPassView),
  MaterialRoute(page: OnboardingView,),
MaterialRoute(page: HomeView),
MaterialRoute(page: ResetEmailView),
MaterialRoute(page: PhoneAuthView),
MaterialRoute(page: SelectLocationView),
MaterialRoute(page: StartUpView,initial: true),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthService),

  LazySingleton(classType: PlacesService),
  LazySingleton(classType: LocationService),


  // LazySingleton(classType: PlacesService)
  // LazySingleton(classType: DialogService),
  // LazySingleton(classType: BottomSheetService),
  // @stacked-service
])
class App {}

