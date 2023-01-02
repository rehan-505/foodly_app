import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/decorations.dart';
import '../../shared_widgets/authentication_layout.dart';

import 'login_viewmodel.dart';


class LoginView extends StatelessWidget {
    LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder:() => LoginViewModel(),

        builder: (context, model, child) => Scaffold(
            body: AuthenticationLayout(
              onSignInWithPhone: model.navigateToPhoneScreen,
              busy: model.isBusy,
              onMainButtonTapped: model.saveData,
              onGoToOtherPageTapped: model.navigateToSignUp,
              validationMessage: model.validationMessage,
              title: 'Welcome',
              subtitle: 'Enter your Phone number or Email address for sign in. Enjoy your food :)',
              mainButtonTitle: 'SIGN IN',
              form: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(errorText: model.emailErrorText,label: const Text('EMAIL ADDRESS', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Email here",
                        suffixIcon: const Icon(Icons.email, color: Colors.grey,),
                      filled: true,
                      enabledBorder: outlineInputBorderKcLightGrey,
                      focusedBorder: outlineInputBorderKcLightGrey,
                      errorBorder: outlineInputBorderKcLightGrey,
                      fillColor: kcVeryLightGrey,

                    ),
                    onChanged: model.validateEmail,


                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,

                  TextFormField(
                    obscureText: model.passVisible,
                    decoration: InputDecoration(
                        filled: true,
                        enabledBorder: outlineInputBorderKcLightGrey,
                        focusedBorder: outlineInputBorderKcLightGrey,
                        errorBorder: outlineInputBorderKcLightGrey,
                        fillColor: kcVeryLightGrey,
                        errorText: model.passErrorText,label: const Text('PASSWORD', style: TextStyle(fontSize: 12),),hintText: "Enter Your Password here",
                    suffixIcon: InkWell(
                        onTap: model.eyePressed,
                        child: Icon(Icons.remove_red_eye, color: model.passVisible ? Colors.grey : null,))
                    ),
                    onChanged: model.validatePass,

                  ),
                ],
              ),
              onForgotPassword: model.navigateToForgotPass,
              onSignInWithGoogle: (){

              },
              appBarTitle: 'Sign In', authScreenType: AuthScreenType.signIn,

            )),
    );
  }
}