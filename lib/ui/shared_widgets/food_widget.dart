import 'package:flutter/material.dart';
import 'package:foodly_app/ui/common/app_colors.dart';

import '../common/app_styles.dart';
import '../common/ui_helpers.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({Key? key, this.imgPath}) : super(key: key);

  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: resWidth(context, 200),
      child: Padding(
        padding:  EdgeInsets.only(right: resWidth(context, 14.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imgPath ?? 'assets/images/food2.png', fit: BoxFit.cover,
                height: resHeight(context, 160),
                  width: resWidth(context, 200),

                )),
            SizedBox(height: resHeight(context, 14),),
            const Text("Daylight Coffee", style: bodyStyle20w500,),
            SizedBox(height: resHeight(context, 4),),
            const Text("Colarodo, San Francisco", style: greyBodyStyle16,),
            SizedBox(height: resHeight(context, 14),),
            Padding(
              padding: EdgeInsets.only(right: resWidth(context, 8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRatingWidget(context, 4.5),
                  const Text("25min",style: blackCaptionStyle14W500),
                  Icon(Icons.circle, size: resWidth(context, 4),color: kcSubtitleGreyColor,),
                  const Text("Free Delivery", style: blackCaptionStyle14W500,)

                ],
              ),
            )






          ],
        ),
      ),
    );
  }

  Widget _buildRatingWidget(BuildContext context, double rating) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(resWidth(context, 6)),
        color: kcPrimaryColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: resWidth(context, 8), vertical: resHeight(context, 4)),
      child: Text(rating.toString(), style: whiteCaptionStyleW600),
    );
  }
}
