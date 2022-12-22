import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/ui/common/app_styles.dart';
import 'package:foodly_app/ui/shared_widgets/custom_text.dart';
import '../../enums/authscreen_type.dart';
import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String appBarTitle;
  final String? title;
  final String? subtitle;
  final String? mainButtonTitle;
  final Widget? form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onGoToOtherPageTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final void Function()? onSignInWithGoogle;
  final String? validationMessage;
  final bool busy;
  final AuthScreenType authScreenType;

  const AuthenticationLayout({
    Key? key,
    this.title,
    this.subtitle,
    this.mainButtonTitle,
    this.form,
    this.onMainButtonTapped,
    this.onGoToOtherPageTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.onSignInWithGoogle,
    this.validationMessage,
    this.showTermsText = false,
    this.busy = false, required this.appBarTitle, required this.authScreenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(

        children: [
          verticalSpaceMedium,

          Row(
            mainAxisAlignment: onBackPressed==null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children:  [
              onBackPressed==null ? const SizedBox() : InkWell(
                  onTap: onBackPressed,
                  child: const Icon(Icons.arrow_back_ios)),
              Text(appBarTitle, style: heading4Style,),
              onBackPressed==null ? const SizedBox() : const Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_back_ios)),

            ],
          ),
          verticalSpaceMedium,
          verticalSpaceRegular,
          Text(
            title!,
            style: TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.7),
              child: CustomText.body(
                subtitle!,
                color: kcSubtitleGreyColor,
              ),
            ),
          ),

          verticalSpaceRegular,
          form!,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: onForgotPassword,
                  child: const CustomText.caption(
                    'Forget Password?',
                  )),
            ),
          verticalSpaceRegular,
          if ((validationMessage != null) && (validationMessage!.isNotEmpty))
            CustomText.body(
              validationMessage!,
              color: Colors.red,
            ),
          if ((validationMessage != null) && (validationMessage!.isNotEmpty)) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: busy
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
                  : Text(
                mainButtonTitle!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
          verticalSpaceRegular,
            GestureDetector(
              onTap: onGoToOtherPageTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(authScreenType == AuthScreenType.signIn ? 'Don\'t have an account?' : "Already have an account?",
                      style: TextStyle(
                          fontSize: 12
                      )
                  ),
                  horizontalSpaceTiny,
                  Text(
                    authScreenType == AuthScreenType.signIn ?
                    'Create an account' : "Login",
                    style: TextStyle(
                      color: kcPrimaryColor,
                      fontSize: 12
                    ),
                  )
                ],
              ),
            ),
          if (showTermsText)
            CustomText.body(
              'By signing up you agree to our terms, conditions and privacy policy.',
            ),
          verticalSpaceMedium,
          Align(
              alignment: Alignment.center,
              child: CustomText.body(
                'Or',
              )),
          verticalSpaceRegular,
          FacebookAuthButton(
            materialStyle: const ButtonStyle(
                alignment: Alignment.centerLeft

            ),
            onPressed: () {},
            text: '        CONNECT WITH FACEBOOK',
            style: const AuthButtonStyle(
              buttonColor: Color(0xff395998),
              iconSize: 24,
              iconBackground: Colors.white,
              buttonType: AuthButtonType.secondary,
              height: 50,
              textStyle: TextStyle(color: Colors.white),
            ),
          ),

          verticalSpaceRegular,
          GoogleAuthButton(
            onPressed: onSignInWithGoogle ?? () {},
            text: '        CONNECT WITH GOOGLE',
            style: const AuthButtonStyle(
              buttonColor: Color(0xff4285F4),
              iconSize: 24,
              iconBackground: Colors.white,
              buttonType: AuthButtonType.secondary,
              height: 50,
              textStyle: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}