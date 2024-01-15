import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_cadastro_app/rest/api.dart';


class LoginRest{
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  Future<String?> login(email, senha) async {
    final emailController = email;
    final senhaController = senha;

    final http.Response response = await http.post(
        Uri.parse('${API.baseurl}/auth/login'),
        body: {
        'email': emailController,
        'senha': senhaController,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return '${data['access_token']}';
    } else {
      print('Falha no login: ${response.reasonPhrase}');
    }
  }
}
