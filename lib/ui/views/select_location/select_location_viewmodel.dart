import 'package:flutter/material.dart';
import 'package:foodly_app/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:places_service/places_service.dart';
import 'package:geocoding/geocoding.dart';

import '../../../app/app.locator.dart';

class SelectLocationViewModel extends BaseViewModel {
  final TextEditingController addressFieldController =  TextEditingController();

  String? errorText;

  final PlacesService _placesService = locator<PlacesService>();
  final LocationService _locationService = locator<LocationService>();
  List<PlacesAutoCompleteResult> placesAutoCompleteResultList = [];
  FocusNode focusNode = FocusNode();

  showPlaces() async{
    if(addressFieldController.text.isNotEmpty){
      placesAutoCompleteResultList =
          await _placesService.getAutoComplete(addressFieldController.text);
    }
    else{
      placesAutoCompleteResultList.clear();
    }
    notifyListeners();

  }

  closeIconPressed(){
    placesAutoCompleteResultList.clear();
    addressFieldController.clear();
    notifyListeners();
  }

  clearList(){
    placesAutoCompleteResultList.clear();
    notifyListeners();
  }

  changeLocationButtonVisibility(){
    notifyListeners();
  }

  singleTileClicked(PlacesAutoCompleteResult placesAutoCompleteResult){
    placesAutoCompleteResultList.clear();
    addressFieldController.text = placesAutoCompleteResult.mainText ?? "";
    clearList();
  }

  getCurrentLocation(BuildContext context) async{
    List<Placemark>? placeMarks = await runBusyFuture(_locationService.onLocationPressed());
    if(placeMarks==null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_locationService.getErrorMsg ?? "")));
    }
    else{
      addressFieldController.text = "${placeMarks.first.country}, ${placeMarks.first.administrativeArea} ${placeMarks.first.locality} ${placeMarks.first.subLocality} ";
    }
  }

  onContinuePressed(){
    if(addressFieldController.text.trim().isEmpty){
      errorText = "Address is Required";
    }
    else{
    }
  }

}
