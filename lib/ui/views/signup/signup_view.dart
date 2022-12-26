import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/common/app_colors.dart';
import 'package:foodly_app/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../shared_widgets/authentication_layout.dart';


class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder:() => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
            authScreenType: AuthScreenType.signUp,
            busy: model.isBusy,
            onMainButtonTapped: model.saveData,
            onGoToOtherPageTapped: model.navigateToLogin,
            validationMessage: model.validationMessage,
            title: 'Create Account',
            subtitle: 'Enter your Name, Email and Password for sign up.',
            mainButtonTitle: 'SIGN UP',
            form: Column(
              children: [
                TextFormField(

                  decoration:  InputDecoration(
                    errorText: model.nameErrorText ,label: const Text('FULL NAME', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Name here",
                      suffixIcon: const Icon(Icons.person, color: Colors.grey,),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kcLightGrey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kcLightGrey)
                    ),
                    fillColor: kcVeryLightGrey,


                  ),
                  onChanged: model.validateName,
                ),
                verticalSpaceSmall,
                verticalSpaceTiny,

                TextFormField(
                  decoration:  InputDecoration(errorText: model.emailErrorText,label: const Text('EMAIL ADDRESS', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Email here",
                      suffixIcon: const Icon(Icons.email, color: Colors.grey,),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kcLightGrey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kcLightGrey)
                    ),
                    fillColor: kcVeryLightGrey,

                  ),
                  onChanged: model.validateEmail,

                ),
                verticalSpaceSmall,
                verticalSpaceTiny,
                TextFormField(
                  obscureText: model.passVisible,
                  decoration: InputDecoration(errorText: model.passErrorText,label: Text('PASSWORD', style: TextStyle(fontSize: 12),),hintText: "Enter Your Password here",
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kcLightGrey)
                      ),
                      fillColor: kcVeryLightGrey,

                      suffixIcon: InkWell(
                          onTap: model.eyePressed,
                          child: Icon(Icons.remove_red_eye, color: model.passVisible ? Colors.grey : null,))
                  ),
                  onChanged: model.validatePass,

                ),
              ],
            ),
            onSignInWithGoogle: (){},
            appBarTitle: 'Sign Up',
            onBackPressed: null,
          )),
    );
  }
}
