import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:login_cadastro_app/repositories/onboarding/OnboardingRepository.dart';
import 'package:login_cadastro_app/rest/onboarding/onboarding_rest.dart';
import 'package:login_cadastro_app/routes/routes.dart';

import '../onboarding.model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _formKeyOnboarding = GlobalKey<FormState>();
  final _nometutorController =
      TextEditingController();
  final _senhaController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmaController = TextEditingController();

  bool isEntrando = true;

  void dispose() {
    _nometutorController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmaController.dispose();
  }

  void _salvar() async {
    Cadastro cadastro = Cadastro.nova(_nometutorController.text,
        _emailController.text, _cpfController.text, _senhaController.text);
    try {
      OnboardingRepository repository = OnboardingRepository();
      await repository.inserir(cadastro);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Onboarding concluído com sucesso')),
      );
      Navigator.pushNamed(context, AppRoutes.emailenviado);
    } catch (exception) {
      List<String> mensagensErro = [];

      if (exception is OnboardingException) {
        mensagensErro = exception.mensagensErro;
      } else {
        mensagensErro.add('Erro desconhecido ao cadastrar.');
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Cadastro'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('A API retornou os seguintes erros:'),
                SizedBox(height: 10),
                for (String mensagem in mensagensErro) Text('- $mensagem'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fechar o AlertDialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Ative seu Plano"),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            child: ListView(children: [
              Form(
                  key: _formKeyOnboarding,
                  child: Column(children: <Widget>[
                    TextFormField(
                      controller: _nometutorController,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Nome do Tutor",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _cpfController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo nao pode ser vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "CPF",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite uma senha';
                        }
                        // RegExp padrao = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!()*_+\-={}[\]|\\:;\'",<>.?/]).{6,}$"");
                        //     if (!padrao.hasMatch(value)) {
                        // return "senha invalida";
                        // }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _confirmaController,
                      decoration: InputDecoration(
                          labelText: "Confirme a senha",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, confirme a senha';
                        } else if (value != _senhaController.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFF658FF5),
                            Color(0xFF052DC7),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Cadastrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                // padding: EdgeInsets.only(
                                //     top: 10, left: 40, right: 40),
                                child: SizedBox(
                                  child: Image.asset("assets/bone.png"),
                                  height: 28,
                                  width: 28,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            if (_formKeyOnboarding.currentState!.validate()) {
                              _salvar();
                            }
                          },
                        ),
                      ),
                    )
                  ]))
            ])));
  }
}
