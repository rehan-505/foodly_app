import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/views/forgot_pass/forgot_pass_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/app_colors.dart';
import '../../common/decorations.dart';
import '../../shared_widgets/authentication_layout.dart';
import 'forgot_pass_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class ForgotPassView extends StatelessWidget with $ForgotPassView {
  ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPassViewModel>.reactive(
      viewModelBuilder:() => ForgotPassViewModel(),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
            busy: model.isBusy,
            onMainButtonTapped: model.saveData,
            validationMessage: model.validationMessage,
            title: 'Forgot Password',
            subtitle: 'Enter your email address and we will send you a reset instructions.',
            mainButtonTitle: 'RESET PASSWORD',
            form: Column(
              children: [
                TextField(
                  decoration:  InputDecoration(errorText: model.emailErrorText,label: const Text('EMAIL ADDRESS', style: TextStyle(fontSize: 12, ),),hintText: "Enter Your Email here",
                      suffixIcon: const Icon(Icons.email, color: Colors.grey,),
                    filled: true,
                    enabledBorder: outlineInputBorderKcLightGrey,
                    focusedBorder: outlineInputBorderKcLightGrey,
                    errorBorder: outlineInputBorderKcLightGrey,
                    fillColor: kcVeryLightGrey,

                  ),
                  onChanged: model.validateEmail,
                ),
              ],
            ),
            appBarTitle: 'Forgot Password', authScreenType: AuthScreenType.forgetPass,
            onBackPressed: model.navigateBack,
          )),
    );
  }
}
