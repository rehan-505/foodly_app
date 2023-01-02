import 'package:flutter/material.dart';
import 'package:foodly_app/enums/authscreen_type.dart';
import 'package:foodly_app/ui/shared_widgets/authentication_layout.dart';
import 'package:stacked/stacked.dart';

import 'reset_email_viewmodel.dart';

class ResetEmailView extends StatelessWidget {
  const ResetEmailView({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder<ResetEmailViewModel>.reactive(
      viewModelBuilder: () => ResetEmailViewModel(email: email),
      builder: (context, model, child) => Scaffold(
        body:  AuthenticationLayout(busy: model.isBusy,
            appBarTitle: "Reset email sent",
          authScreenType: AuthScreenType.resetEmailSent,
          subtitle: "We have sent a instructions email to ${model.email}",
          title: "Reset email sent",
          mainButtonTitle: "Send Again",
          form: const SizedBox(),
          onBackPressed: model.navigateBack,
          onMainButtonTapped: model.saveData,

        ),
      ),
    );
  }
}
