import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_app/ui/common/ui_helpers.dart';
import 'package:foodly_app/ui/shared_widgets/custom_text.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.nonReactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) => Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: model.modifyIndex,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,index){

                  return _buildLayout(context, index, titleText: model.titlesList[index], subtitle: model.subtitles[index], imgPath: model.images[index]);
                }),

            Positioned(
              bottom: 60,
              left: 0,
              right: 0,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ThreeDots(),
                    SizedBox(height: resHeight(context, 60),),


                    GestureDetector(
                      onTap: model.navigateToLogin,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kcPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: resHeight(context, 80),)

          ],
        ),
      ),
    );
  }

  _buildLayout(BuildContext context,int index,
      {required String titleText, required String subtitle, required String imgPath}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(flex:2,child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(imgPath),
              index!=0?SizedBox(height: 48,):SizedBox(height: 20,)
            ],
          )),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText.headline(titleText),
                SizedBox(height: resHeight(context, 20),),
                CustomText.body(
                  subtitle,
                  color: kcSubtitleGreyColor,
                  align: TextAlign.center,
                ),
                SizedBox(height: 120,)
              ],
            ),
          ),

        ],
      ),
    );
  }

}

class ThreeDots extends ViewModelWidget<OnboardingViewModel> {
  const ThreeDots({Key? key}) : super(key: key,reactive: true);

  @override
  Widget build(BuildContext context, OnboardingViewModel viewModel) {
    return SizedBox(
      height: 5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context,i){
            return  Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildDot(active: i==viewModel.currentIndex?true:false),
            );}),
    );
  }

  Widget _buildDot({bool active = false}){
    return Container(
      height: 5,
      width: 8,
      decoration: BoxDecoration(
          color: active ? kcPrimaryColor : kcSubtitleGreyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)
      ),
    );
  }

}



