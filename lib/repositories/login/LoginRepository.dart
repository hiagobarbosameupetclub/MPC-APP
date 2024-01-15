import 'package:login_cadastro_app/rest/login/login_rest.dart';

class Login {
  final LoginRest api = LoginRest();
  Future<String?> login(email, senha) async {
    return await api.login(email, senha);
  }
}