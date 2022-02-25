import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projetoapp/app/components/instapet_appbar.dart';
import 'package:projetoapp/app/components/instapet_buttom.dart';
import 'package:projetoapp/app/components/instapet_textformfield.dart';
import 'package:projetoapp/app/core/insta_state.dart';
import 'package:validatorless/validatorless.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends InstaState<LoginPage, LoginController> {
  final _formKeyLogin = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKeyLogin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(height: 30),
                        InstapetTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('E-mail é obrigatório.'),
                              Validatorless.email('E-mail inválido.')
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        InstapetTextformfield(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEC,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('Senha é obrigatória.'),
                              Validatorless.min(
                                6,
                                'Senha deve conter pelo menos 6 caracteres.',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: InstapetButtom(
                            label: 'ENTRAR',
                            onPressed: () {
                              final formValid =
                                  _formKeyLogin.currentState?.validate() ??
                                      false;
                              if (formValid) {
                                controller.login(
                                  _emailEC.text,
                                  _passwordEC.text,
                                );
                              }
                            },
                            width: context.width,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            '- Ou acesse com sua rede social -',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
