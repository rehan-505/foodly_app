import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/views/signup/signup_view.form.dart';
import 'package:foodly_app/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared_widgets/authentication_layout.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignupView extends StatelessWidget with $SignupView {
  SignupView({Key? key}) : super(key: key);

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
            validationMessage: "",
            title: 'Create Account',
            subtitle: 'Enter your Name, Email and Password for sign up.',
            mainButtonTitle: 'SIGN UP',
            form: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(label: Text('FULL NAME', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Name here",
                      suffixIcon: Icon(Icons.person, color: Colors.grey,)
                  ),
                  controller: nameController,
                ),
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
            onSignInWithGoogle: (){},
            appBarTitle: 'Sign Up',
            onBackPressed: null,
          )),
    );
  }
}
