import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:interview_app/providers/auth_provider.dart';
import 'package:interview_app/routes/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:interview_app/providers/global_providers.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends ConsumerWidget {
  void updateEmail(BuildContext context, String email) {
    context.read<EmailProvider>().save(email);
  }

  void updatePassword(BuildContext context, String pass) {
    context.read<PasswordProvider>().save(pass);
  }

  static var formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, ref) {
    // String email = ref.read(emailProvider).state;
    // String pass = ref.read(passwordProvider).state;
    final _auth = ref.read(authUtilProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const FlutterLogo(size: 200),
              FormBuilderTextField(
                name: 'email',
                onChanged: (value) => updateEmail(context, value!),
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () async {
                  if (formKey.currentState!.saveAndValidate()) {
                    await _auth
                        .resetPassword(
                      email: formKey.currentState!.value['email'],
                    )
                        .then((value) {
                          Fluttertoast.showToast(
                          msg: "Check your email",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      AutoRouter.of(context).push(LoginRoute());
                    }).catchError((error) {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                content: Text(error.toString()),
                              ));
                    });
                  }
                },
                color: Colors.blue,
                child: const Text('Reset password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
