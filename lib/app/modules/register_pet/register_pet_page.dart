import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import '../../components/instapet_appbar.dart';
import '../../components/instapet_textformfield.dart';
import '../../core/core.dart';
import '../../core/insta_state.dart';
import './register_pet_controller.dart';

class RegisterPetPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/register-pet';
  const RegisterPetPage({Key? key}) : super(key: key);

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

class _RegisterPetPageState
    extends InstaState<RegisterPetPage, RegisterPetController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
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
                    'Cadastro de seu Pet',
                    style: context.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha agora os dados do seu amiguinho.',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: const Text(
    //       'Registro de seu Pet',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Obx(() => Text(
    //           'Olá ${controller.name.toString()}, chegou a hora de cadastrarmos seu amiguinho!')),
    //     ],
    //   ),
    // );
  }
}
