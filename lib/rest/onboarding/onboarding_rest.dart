import 'dart:convert';

import 'package:Meu_Pet_Club/onboarding/onboarding.model.dart';
import 'package:Meu_Pet_Club/rest/api.dart';
import 'package:http/http.dart' as http;

class OnboardingRest {
  Future<Cadastro> inserir(Cadastro cadastro) async {
    final http.Response response = await http.post(
      Uri.parse('${API.baseurl}/beneficiado/cadastro-mobile'),
      body: cadastro.toJson(),
      headers: {"Accept": "*/*", "content-type": "application/json"},
    );

    if (response.statusCode == 201) {
      print(response.body);
      return Cadastro.fromJson(jsonEncode(
          {"idCliente": "", "nome": "", "email": "", "cpf": "", "senha": ""}));
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final List<String> mensagensErro =
          List<String>.from(responseBody['message']);
      throw OnboardingException(mensagensErro);
    } else {
      print(
          'Erro ao cadastrar. Status code: ${response.statusCode}, Response: ${response.body}');
      throw Exception(response.body);
    }
  }
}

class OnboardingException implements Exception {
  final List<String> mensagensErro;
  OnboardingException(this.mensagensErro);
}
