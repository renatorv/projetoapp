import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projetoapp/app/components/instapet_appbar.dart';
import 'package:projetoapp/app/components/instapet_buttom.dart';
import 'package:projetoapp/app/components/instapet_textformfield.dart';
import 'package:projetoapp/app/core/core.dart';
import 'package:projetoapp/app/modules/register/register.dart';
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
    final Responsive _responsive = Responsive(context);
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
                  padding: EdgeInsets.only(
                    top: _responsive.dp(3.6),
                    right: _responsive.dp(3.6),
                    left: _responsive.dp(3.6),
                  ),
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
                        SizedBox(height: _responsive.dp(3.8)),
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
                        SizedBox(height: _responsive.dp(3.8)),
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
                        SizedBox(height: _responsive.dp(4.6)),
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
                        SizedBox(height: _responsive.dp(4.6)),
                        const Center(
                          child: Text(
                            '- Ou acesse com sua rede social -',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: _responsive.dp(3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton.extended(
                              heroTag: "btnGoogle",
                              onPressed: () {
                                controller.googleLogin();
                              },
                              icon: Image.asset(
                                'assets/images/google_icon.png',
                                height: _responsive.dp(4.2),
                                width: _responsive.dp(4.2),
                              ),
                              label: Text(
                                'Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            FloatingActionButton.extended(
                              heroTag: "btnFacebook",
                              onPressed: () {
                                controller.loginFacebook();
                              },
                              icon: Image.asset(
                                'assets/images/facebook_icon.png',
                                height: _responsive.dp(4.2),
                                width: _responsive.dp(4.2),
                                color: Colors.white,
                              ),
                              label: Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: PaletaCores.azulFacebook,
                              foregroundColor: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive.dp(2)),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Não possui uma conta?',
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RegisterPage.ROUTE_PAGE);
                              },
                              child:
                                  Text('Cadastre-se', style: UiConfig.textBold),
                            ),
                          ],
                        ),
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
