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
  const CustomText.subheading(this.text, {TextAlign align = TextAlign.start})
      : style = subheadingStyle,
        alignment = align;
  const CustomText.caption(this.text, {TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align;

  CustomText.body(this.text,
      {Color color = kcDarkGreyColor, TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
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