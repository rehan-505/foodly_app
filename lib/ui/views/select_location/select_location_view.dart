import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:places_service/places_service.dart';
import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import '../../common/decorations.dart';
import '../../common/ui_helpers.dart';
import '../../shared_widgets/custom_text.dart';
import 'select_location_viewmodel.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectLocationViewModel>.reactive(
      viewModelBuilder: () => SelectLocationViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              verticalSpaceMedium,
              SizedBox(
                height: resHeight(context, 30),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(onTap: () {}, child: const Icon(Icons.close)),
              ),
              SizedBox(
                height: resHeight(context, 34),
              ),
              const CustomText.headingThree("Find restaurants near you "),
              verticalSpaceSmall,
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText.body(
                  "Please enter your location or allow access to your location to find restaurants near you.",
                  color: kcSubtitleGreyColor,
                  align: TextAlign.center,
                ),
              ),
              verticalSpaceRegular,
              verticalSpaceRegular,
              !(model.focusNode.hasFocus) ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(!model.isBusy) {
                        model.getCurrentLocation(context);
                      }
                      },
                    child: Container(
                      width: double.infinity,
                      height: resHeight(context, 50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: kcPrimaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: model.isBusy
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.green),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/green_place.svg"),
                                SizedBox(
                                  width: resWidth(context, 10),
                                ),
                                const Text(
                                  "Use current location",
                                  style: TextStyle(
                                      color: kcPrimaryColor,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(
                    height: resHeight(context, 20),
                  )
                ],
              )
                  : const SizedBox(),
              TextFormField(
                enabled: !model.isBusy,
                focusNode: model.focusNode,
                onFieldSubmitted: (v){
                  model.changeLocationButtonVisibility();
                },

                onTap: (){
                  model.changeLocationButtonVisibility();

                },
                decoration: _buildAddressTextFieldDecoration(context,model),
                controller: model.addressFieldController,
                onChanged: (v) {
                  model.showPlaces();
                },
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: model.placesAutoCompleteResultList.length,
                      itemBuilder: (context, index) {
                        return _buildSingleResultTile(
                            context, model.placesAutoCompleteResultList[index],model);
                      }))
            ],
          ),
        ),
        bottomNavigationBar:                   Padding(
          padding:  EdgeInsets.symmetric(horizontal: resWidth(context, 25),vertical: resHeight(context, 20)),
          child: InkWell(
            onTap: (){
              model.onContinuePressed();
            },
            child: Container(
              width: double.infinity,
              height: resHeight(context, 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // border: Border.all(color: kcPrimaryColor),
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 14),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleResultTile(
      BuildContext context, PlacesAutoCompleteResult placesAutocompleteResult,SelectLocationViewModel model) {
    return InkWell(
      onTap: (){
        model.singleTileClicked(placesAutocompleteResult);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: resWidth(
            context,
            16.0,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
              bottom: resHeight(
                context,
                8.0,
              ),
              top: resHeight(
                context,
                8.0,
              )),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: kcGrey2.withOpacity(0.2)))),
          child: Row(
            children: [
              SizedBox(
                width: resWidth(context, 4),
              ),
              SvgPicture.asset("assets/images/place.svg"),
              SizedBox(
                width: resWidth(context, 15),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText.body(
                      placesAutocompleteResult.mainText ?? "null",
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: resHeight(context, 8),
                    ),
                    Text(
                      placesAutocompleteResult.description ?? "des null",
                      style: subtitleStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildAddressTextFieldDecoration(BuildContext context, SelectLocationViewModel model) {
    return InputDecoration(
      errorText: model.errorText,
      filled: true,
      fillColor: kcSubtitleGreyColor.withOpacity(0.01),
      hintText: 'Enter new Address',
      focusedBorder: outlineInputBorderKcLightGrey,
      enabledBorder: outlineInputBorderKcLightGrey,
      errorBorder: outlineInputBorderKcLightGrey,
      prefixIcon: Padding(
        padding: EdgeInsets.only(
            right: resWidth(context, 15), left: resWidth(context, 15)),
        child: Icon(
          Icons.location_on_rounded,
          size: resHeight(context, 16),
          color: kcSubtitleGreyColor,
        ),
      ),
      suffix: InkWell(
        onTap: model.closeIconPressed,
        child: Container(
            height: resHeight(context, 16),
            width: resHeight(context, 16),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: kcGrey3,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              size: 8,
            )),
      ),
    );
  }
}
