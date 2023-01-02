import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/common/app_styles.dart';
import 'package:foodly_app/ui/common/ui_helpers.dart';
import 'package:foodly_app/ui/shared_widgets/authentication_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../common/app_colors.dart';
import 'phone_auth_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneAuthViewModel>.reactive(
      viewModelBuilder: () => PhoneAuthViewModel(),
      onModelReady: (model){
        model.focusNode.requestFocus();
      },
      builder: (context, model, child) {

        return Scaffold(
          body: model.codeSent ? _buildOtpView(context, model) : AuthenticationLayout(
            validationMessage: model.validationMessage,
            onBackPressed: (){
              model.navigateBack();
            },
            busy: model.isBusy,
            appBarTitle: "Login to Foodly", authScreenType: AuthScreenType.phoneAuth,
            subtitle: 'Enter your phone number to use foodly and enjoy your food :)',
            title: "Get started with Foodly",
            onMainButtonTapped: model.runAuthentication,
            mainButtonTitle: "Sign UP",
            form: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: resHeight(context, 25),),
                const Text(" PHONE NUMBER", style: subtitleStyle, ),
                SizedBox(height: resHeight(context, 5),),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IntlPhoneField(
                    showDropdownIcon: true,
                    flagsButtonPadding: EdgeInsets.only(left:resWidth(context, 10)),

                    disableLengthCheck: true,
                    dropdownTextStyle: const TextStyle(
                        fontSize: 16
                    ),
                    focusNode: model.focusNode,
                    onCountryChanged: (selectedCountry){
                      model.selectedCountry = selectedCountry;
                    },
                    onChanged: model.validatePhone,
                    initialCountryCode: 'PK',
                    decoration:   InputDecoration(
                      errorText: model.phoneErrorText,
                      counterText: '',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: resHeight(context, 15.5)),
                      isCollapsed: true,

                      // labelText: "PHONE NUMBER",
                      // labelStyle: subtitleStyle,
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      fillColor: kcVeryLightGrey,


                      // labelText: "Phone Number",
                      // labelStyle: subtitleStyle,


                    ),
                    style: greyBodyStyle16op75,

                  ),
                ),
                SizedBox(height: resHeight(context, 140),),

              ],
            ),



          ),
        );
      },
    );
  }

  _buildOtpView(BuildContext context,PhoneAuthViewModel model){
    return AuthenticationLayout(
      validationMessage: model.validationMessage,
      onBackPressed: model.navigateBack,
      appBarTitle: "Login to Foodly",
      authScreenType: AuthScreenType.enterOtp,
      title: "Verify phone number",
      subtitle: "Enter the 6-Digit code sent to you at ${model.phone}",
      onMainButtonTapped: model.verifySmsCode,
      busy: model.isBusy,
      form: Form(
        key: model.globalKeyOtpForm,
        child: PinCodeTextField(
          enablePinAutofill: true,
          controller: model.smsCodeController,
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
          validator: (String? value){
            if( value==null || value.length < 6){
              return "Invalid Code";
            }
            return null;
          },



        ),
      ),
      mainButtonTitle: "Continue",
      showTermsText: true,

    );
  }
}
