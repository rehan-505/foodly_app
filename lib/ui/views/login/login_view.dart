import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared_widgets/authentication_layout.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
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
              validationMessage: null,
              title: 'Welcome',
              subtitle: 'Enter your Phone number or Email address for sign in. Enjoy your food :)',
              mainButtonTitle: 'SIGN IN',
              form: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(label: Text('EMAIL ADDRESS', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Email here",
                        suffixIcon: Icon(Icons.email, color: Colors.grey,)
                    ),
                    controller: emailController,
                  ),
                  TextField(
                    obscureText: model.passVisible,
                    decoration: InputDecoration(label: const Text('PASSWORD', style: TextStyle(fontSize: 12),),hintText: "Enter Your Password here",
                    suffixIcon: InkWell(
                        onTap: model.eyePressed,
                        child: Icon(Icons.remove_red_eye, color: model.passVisible ? Colors.grey : null,))
                    ),
                    controller: passwordController,
                  ),
                ],
              ),
              onForgotPassword: () {},
              onSignInWithGoogle: (){},
              appBarTitle: 'Sign In', authScreenType: AuthScreenType.signIn,
            )),
    );
  }
}
