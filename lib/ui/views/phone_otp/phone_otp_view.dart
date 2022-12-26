import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/common/app_colors.dart';
import 'package:foodly_app/ui/shared_widgets/authentication_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'phone_otp_viewmodel.dart';

class PhoneOtpView extends StatelessWidget {
  const PhoneOtpView({Key? key, required this.phoneNo}) : super(key: key);

  final String phoneNo;

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<PhoneOtpViewModel>.reactive(
      viewModelBuilder: () => PhoneOtpViewModel(),
      builder: (context, model, child) => Scaffold(
        body:  AuthenticationLayout(
          onBackPressed: model.navigateBack,
            appBarTitle: "Login to Foodly",
            authScreenType: AuthScreenType.enterOtp,
          title: "Verify phone number",
          subtitle: "Enter the 4-Digit code sent to you at $phoneNo",
          form: PinCodeTextField(
            cursorColor: kcPrimaryColor,
            keyboardType: TextInputType.phone,
            pinTheme: PinTheme(
              activeColor: kcSubtitleGreyColor,
              selectedColor: kcSubtitleGreyColor,
              inactiveColor: kcSubtitleGreyColor
            ),
            appContext: context,
            length: 6,
            onChanged: (String value) {  },

          ),
          mainButtonTitle: "Continue",
          showTermsText: true,

        ),

      ),
    );
  }
}
