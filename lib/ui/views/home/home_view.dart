
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_app/ui/common/app_colors.dart';
import 'package:foodly_app/ui/common/ui_helpers.dart';
import 'package:foodly_app/ui/shared_widgets/custom_text.dart';
import 'package:foodly_app/ui/shared_widgets/food_widget.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_styles.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
          children: [
            SizedBox(height: resHeight(context, 20),),
             Padding(
               padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
               child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: resWidth(context, 10)),
                    child: const Text('DELIVERY TO', style: primaryColor12Style,),
                  )),
             ),
            SizedBox(height: resHeight(context, 5),),
            Padding(
              padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Filter", style: TextStyle(color: Colors.transparent),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("San Francisco", style: headingStyle22,),
                      SizedBox(width: resWidth(context, 7.5),),
                      Padding(
                        padding:  EdgeInsets.only(top: resHeight(context, 6)),
                        child: SvgPicture.asset("assets/images/dropdown.svg"),
                      ),
                    ],
                  ),
                  const Text("Filter", style: bodyDefaultStyle16,),
                ],
              ),
            ),
            SizedBox(height: resHeight(context, 12),),
            Container(
              width: double.infinity,
              height: 1,
              color: kcVeryLightestGrey.withOpacity(0.1),
            ),

            SizedBox(height: resHeight(context, 24),),

            SizedBox(
              height: resHeight(context, 185),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: PageController(initialPage: 2),
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return _buildCarouselImageWidget(context);
                      },
                    onPageChanged: model.modifyIndex,),
                  Positioned(
                    right: resWidth(context, 40),
                      bottom: resHeight(context, 16),
                      child:  VariableDots(model.currentCarouselIndex)),

                ],
              ),
            ),
            SizedBox(height: resHeight(context, 34),),
            Padding(
              padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText.headingThree("Featured Partners"),
                  Text("See all", style: bodyStylePrimaryColor16,),
                ],
              ),
            ),
            SizedBox(height: resHeight(context, 24),),
            _buildRestaurantsHorizontalList(context),
            SizedBox(height: resHeight(context, 34),),
            Padding(

              padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
              child: SvgPicture.asset("assets/images/ad.svg", fit: BoxFit.cover,),
            ),
            SizedBox(height: resHeight(context, 34),),
            Padding(
              padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText.headingThree("Best Picks\nRestaurants by team"),
                  Text("See all", style: bodyStylePrimaryColor16,),
                ],
              ),
            ),
            SizedBox(height: resHeight(context, 24),),
            _buildRestaurantsHorizontalList(context, bestPicks: true),
            SizedBox(height: resHeight(context, 34),),
            Padding(
              padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText.headingThree("All Restaurants"),
                  Text("See all", style: bodyStylePrimaryColor16,),
                ],
              ),
            ),
            SizedBox(height: resHeight(context, 24),),
            _buildRestaurantCarouselWidget(context, model,0),
            SizedBox(height: resHeight(context, 24),),
            _buildRestaurantCarouselWidget(context, model,1),
            SizedBox(height: resHeight(context, 24),),
            _buildRestaurantCarouselWidget(context, model, 2),
            SizedBox(height: resHeight(context, 24),),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantsHorizontalList(BuildContext context, {bool bestPicks = false}){
    return             SizedBox(
      height: resHeight(context, 260),
      child: Padding(
        padding:  EdgeInsets.only(left: resWidth(context, 20)),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index){
              return  FoodWidget(imgPath: bestPicks ? "assets/images/fries.png" : null,);
            }),
      ),
    );
  }

  Widget _buildCarouselImageWidget(BuildContext context, {bool otherOne = false}){
    return Padding(
      padding:  EdgeInsets.only(right: resWidth(context, 20.0),left: resWidth(context, 20.0)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(otherOne ? 'assets/images/food.png' : 'assets/images/img.png', fit: BoxFit.cover,)),
    );
  }

  Widget _buildRestaurantCarouselWidget(BuildContext context,HomeViewModel model,int listIndex){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: resHeight(context, 185),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView.builder(
              controller: PageController(initialPage: 2),
              itemCount: 5,
              itemBuilder: (context,index){
                return _buildCarouselImageWidget(context,otherOne : true);
              },
              onPageChanged: (index){
                model.modifyAllRestaurantsIndex(listIndex, index);
              },),
            Positioned(
                right: resWidth(context, 40),
                bottom: resHeight(context, 16),
                child: VariableDots(model.currentAllRestaurantsIndex[listIndex])),

          ],
        ),
      ),
      SizedBox(
        height: resHeight(context, 16),
      ),
      Padding(
        padding: EdgeInsets.only(left: resWidth(context, 20)),
        child: const Text("McDonald's", style: bodyStyle20w500,),
      ),
      SizedBox(
        height: resHeight(context, 4),
      ),

      Padding(
        padding:  EdgeInsets.only(right: resWidth(context, 68.0),left: resWidth(context, 20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("\$\$", style: greyBodyStyle16,),
            Icon(Icons.circle, size: resWidth(context, 4),color: kcSubtitleGreyColor,),
            const Text("Chinese", style: greyBodyStyle16,),
            Icon(Icons.circle, size: resWidth(context, 4),color: kcSubtitleGreyColor,),
            const Text("America", style: greyBodyStyle16,),
            Icon(Icons.circle, size: resWidth(context, 4),color: kcSubtitleGreyColor,),
            const Text("Desi Food", style: greyBodyStyle16,),


          ],
        ),
      ),
      SizedBox(height: resHeight(context, 9),),
      Padding(
        padding:  EdgeInsets.only(right: resWidth(context, 68.0),left: resWidth(context, 20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('4.3'),
            Icon(Icons.star,color: kcPrimaryColor, size: resWidth(context, 20),),
            const Text('200+ Ratings', style: captionStyle,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/time.svg"),
                SizedBox(width: resWidth(context, 9),),
                const Text("25 min", style: captionStyle,)
              ],
            ),
            Icon(Icons.circle, size: resWidth(context, 4),color: kcSubtitleGreyColor,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/dollar.svg"),
                SizedBox(width: resWidth(context, 9),),
                const Text("Free", style: captionStyle,),
              ],
            ),



          ],
        ),
      ),



    ],
  );
  }

}

class VariableDots extends ViewModelWidget<HomeViewModel> {
  const VariableDots(this.currentIndex, {Key? key}) : super(key: key,reactive: true);
  final int currentIndex;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context,i){
            return  Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildDot(active: i==currentIndex?true:false),
            );}),
    );
  }

  Widget _buildDot({bool active = false}){
    return Container(
      height: 5,
      width: 8,
      decoration: BoxDecoration(
          color: active ? Colors.white : kcWhite30opacity,
          borderRadius: BorderRadius.circular(100)
      ),
    );
  }

}

