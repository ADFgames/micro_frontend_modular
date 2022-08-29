import 'package:flutter/material.dart';

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../infra/models/models.dart';
import 'controller/login_page_controller.dart';
import 'states/states.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFN = FocusNode();
  final _passwordFN = FocusNode();

  final controller = Modular.get<LoginPageController>();

  @override
  void initState() {
    super.initState();

    _emailController.text = 'admin@gmail.com';
    _passwordController.text = '123456';
  }

  @override
  void dispose() {
    _emailFN.dispose();
    _passwordFN.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPcolors.greyColor.shade50,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            final LoginState state = controller.loginState;

            if (state is ErrorLoginState) {
              return Center(
                child: Text(state.error.message!),
              );
            }

            if (state is LoadingLoginState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SuccessLoginState) {
              Modular.to.pushReplacementNamed('/home', arguments: state.login);
            }

            if (state is InitialLoginState) {
              return Column(
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
                              const SizedBox(height: 20),
                              const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: SPcolors.primaryColor, fontSize: 40),
                                ),
                              ),
                              const SizedBox(height: 120),
                              CustomTextFormField(
                                label: "E-mail",
                                controller: _emailController,
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                label: "Password",
                                controller: _passwordController,
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 100),
                              CustomElevatedButton(
                                text: 'logar',
                                onPressed: () async {
                                  LoginParams params = LoginParams(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

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
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
