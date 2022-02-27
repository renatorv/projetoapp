import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projetoapp/app/components/instapet_appbar.dart';
import 'package:projetoapp/app/components/instapet_buttom.dart';
import 'package:projetoapp/app/components/instapet_textformfield.dart';
import 'package:projetoapp/app/core/core.dart';
import 'package:validatorless/validatorless.dart';
import './register_controller.dart';

class RegisterPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends InstaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              top: _responsive.dp(3.6),
              right: _responsive.dp(3.6),
              left: _responsive.dp(3.6),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  SizedBox(height: _responsive.dp(3.8)),
                  InstapetTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome é obrigatório.'),
                      Validatorless.min(
                        6,
                        'Nome deve conter pelo menos 6 caracteres.',
                      ),
                    ]),
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
                    obscureText: true,
                  ),
                  SizedBox(height: _responsive.dp(3.8)),
                  InstapetTextformfield(
                    label: 'Confirma senha',
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirma senha é obrigatória.'),
                        Validatorless.min(
                          6,
                          'Senha deve conter pelo menos 6 caracteres.',
                        ),
                        Validatorless.compare(
                          _passwordEC,
                          'Senhas não conferem.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _responsive.dp(5)),
                  Center(
                    child: InstapetButtom(
                      label: 'CADASTRAR',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          controller.register(
                            _nameEC.text,
                            _emailEC.text,
                            _passwordEC.text,
                          );
                        }
                      },
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
