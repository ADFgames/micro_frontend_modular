import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter/material.dart';
import 'package:login/app/module/infra/models/models.dart';
import 'package:login/app/module/presenter/controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final controller = Modular.get<LoginPageController>();

  final restClient = RestClient;

  final emailCopntroller = TextEditingController();
  final passwordController = TextEditingController();

  final _emailFN = FocusNode();
  final _passcontrollerFN = FocusNode();

  @override
  void initState() {
    super.initState();

    emailCopntroller.text = 'admin@gmail.com';
    passwordController.text = '123456';
  }

  @override
  void dispose() {
    _emailFN.dispose();
    _passcontrollerFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPcolors.greyColor.shade50,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: SPcolors.primaryColor,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        CustomTextFormField(
                          label: "E-mail",
                          controller: emailCopntroller,
                          //validator: (value) {},
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          label: "Password",
                          controller: passwordController,
                          //validator: (value) {},
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        CustomElevatedButton(
                          text: 'logar',
                          onPressed: () async {
                            LoginParams params = LoginParams(email: emailCopntroller.text, password: passwordController.text);

                            controller.auth(params.email, params.password);
                          },
                          buttonSize: SPButtonSize.medium,
                          buttonState: SPButtonState.common,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
