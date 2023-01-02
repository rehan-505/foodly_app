import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int currentCarouselIndex = 2;
  List<int> currentAllRestaurantsIndex = [2,2,2];


  List<String> images = [
    "assets/images/img.png",
    "assets/images/img.png",
    "assets/images/img.png",
  ];

  void modifyIndex(int index){
    currentCarouselIndex = index;
    notifyListeners();
  }

  void modifyAllRestaurantsIndex(int listIndex, int index){
    currentAllRestaurantsIndex[listIndex] = index;
    notifyListeners();
  }



}
