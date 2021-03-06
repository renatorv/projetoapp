import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import '../../components/instapet_appbar.dart';
import '../../components/instapet_textformfield.dart';
import '../../core/core.dart';
import '../../models/animal_model.dart';
import '../../models/raca_model.dart';
import '../../view_models/photo_pet_view_model.dart';
import '../photo_pet/photo_pet_page.dart';
import './register_pet_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

  String? selectedValue, racaId, especieId, especieName, racaName;

  final GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return GetBuilder<RegisterPetController>(
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final formValid = _formKey.currentState?.validate() ?? false;

            if (formValid) {
              PhotoPetViewModel pet = PhotoPetViewModel(
                  nome: _nameEC.text,
                  especie: especieName!,
                  idEspecie: especieId!,
                  raca: racaName!,
                  idRaca: racaId!);
              Get.toNamed(PhotoPetPage.ROUTE_PAGE, arguments: pet);
            }
          },
          child: Icon(Icons.arrow_forward),
        ),
        appBar: InstapetAppbar(elevation: 0),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
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
                            Validatorless.required('Nome ?? obrigat??rio.'),
                            Validatorless.min(
                              6,
                              'Nome deve conter pelo menos 6 caracteres.',
                            ),
                          ]),
                        ),
                        SizedBox(height: _responsive.dp(3.8)),
                        DropdownButtonFormField2<Animal>(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Selecione a esp??cie.',
                            style: TextStyle(
                              fontSize: _responsive.dp(2.2),
                            ),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: _responsive.dp(4.2),
                          buttonHeight: _responsive.dp(8),
                          buttonPadding: EdgeInsets.only(
                            left: _responsive.dp(2),
                            right: _responsive.dp(2),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: controller.listAnimals
                              .map(
                                (item) => DropdownMenuItem<Animal>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: _responsive.dp(2.2),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Favor selecionar esp??cie.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            key.currentState?.reset();

                            var pet = value as Animal;
                            especieId = pet.objectId;
                            especieName = pet.name;
                            controller.buscaRacasPet(pet.objectId);
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                        ),
                        SizedBox(height: _responsive.dp(3.8)),
                        DropdownButtonFormField2<Raca>(
                          key: key,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Selecione a ra??a.',
                            style: TextStyle(
                              fontSize: _responsive.dp(2.2),
                            ),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: _responsive.dp(4.2),
                          buttonHeight: _responsive.dp(8),
                          buttonPadding: EdgeInsets.only(
                            left: _responsive.dp(2),
                            right: _responsive.dp(2),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: controller.racas
                              .map(
                                (item) => DropdownMenuItem<Raca>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: _responsive.dp(2.2),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Favor selecionar a ra??a.';
                            }
                            return null;
                          },
                          onChanged: (Raca? value) {
                            setState(() {});
                            var raca = value as Raca;
                            racaId = raca.idRaca;
                            racaName = raca.name;
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
