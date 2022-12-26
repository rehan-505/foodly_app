import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/common/app_styles.dart';
import 'package:foodly_app/ui/common/ui_helpers.dart';
import 'package:foodly_app/ui/shared_widgets/authentication_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../common/app_colors.dart';
import 'phone_auth_viewmodel.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneAuthViewModel>.reactive(
      viewModelBuilder: () => PhoneAuthViewModel(),
      onModelReady: (model){
        model.focusNode.requestFocus();
      },
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          onBackPressed: (){
            model.navigateBack();
          },
          appBarTitle: "Login to Foodly", authScreenType: AuthScreenType.phoneAuth,
          subtitle: 'Enter your phone number to use foodly and enjoy your food :)',
          title: "Get started with Foodly",
          onMainButtonTapped: (){},
          mainButtonTitle: "Sign UP",
          form: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: resHeight(context, 25),),
              const Text(" PHONE NUMBER", style: subtitleStyle, ),
              SizedBox(height: resHeight(context, 5),),
              IntlPhoneField(

                showDropdownIcon: true,
               flagsButtonPadding: EdgeInsets.only(left:resWidth(context, 10)),

               disableLengthCheck: true,
                dropdownTextStyle: const TextStyle(
                  fontSize: 16
                ),
                focusNode: model.focusNode,
                decoration:   InputDecoration(
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
                  fillColor: kcVeryLightGrey,


                  // labelText: "Phone Number",
                    // labelStyle: subtitleStyle,


                ),
                style: greyBodyStyle16,

              ),
              SizedBox(height: resHeight(context, 160),),

            ],
          ),



        ),
      ),
    );
  }
}
