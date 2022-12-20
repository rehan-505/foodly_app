import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  int currentIndex = 0;

  modifyIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

  List<String> titlesList = [
    "All your favourites",
    'Free delivery offers',
    'Choose your food'
  ];

  List<String> subtitles = [
    "Order from the best local restaurants with easy, on-demand delivery.",
    "Free delivery for new customers via Apple Pay and others payment methods.",
    "Easily find your type of food craving and you’ll get delivery in wide range.",
  ];

  List<String> images = [
    "assets/images/plate.svg",
    "assets/images/vehicle.svg",
    "assets/images/pizza.svg"
  ];

  void navigateToLogin(){
    _navigationService.replaceWith(Routes.loginView);
  }


}
