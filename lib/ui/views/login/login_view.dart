import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:stacked/stacked.dart';

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
                    decoration: InputDecoration(errorText: model.emailErrorText,label: Text('EMAIL ADDRESS', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Email here",
                        suffixIcon: const Icon(Icons.email, color: Colors.grey,)
                    ),
                    onChanged: model.validateEmail,


                  ),

                  TextFormField(
                    obscureText: model.passVisible,
                    decoration: InputDecoration(errorText: model.passErrorText,label: const Text('PASSWORD', style: TextStyle(fontSize: 12),),hintText: "Enter Your Password here",
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


