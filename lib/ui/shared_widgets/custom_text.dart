import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;

  const CustomText.headingOne(this.text, {TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align;
  const CustomText.headingTwo(this.text, {TextAlign align = TextAlign.start})
      : style = heading2Style,
        alignment = align;
  const CustomText.headingThree(this.text, {TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align;
  const CustomText.headline(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align;
  CustomText.headline34(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle.copyWith(fontSize: 34,fontWeight: FontWeight.w600),
        alignment = align;
  const CustomText.subheading(this.text, {TextAlign align = TextAlign.start})
      : style = subheadingStyle,
        alignment = align;
  const CustomText.caption(this.text, {TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align;

  CustomText.body(this.text, {Color color = kcDarkGreyColor, TextAlign align = TextAlign.start, FontWeight fontWeight = FontWeight.w100})
      : style = bodyStyle.copyWith(color: color, fontWeight: fontWeight),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}