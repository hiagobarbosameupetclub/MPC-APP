
import 'package:Meu_Pet_Club/rest/login/login_rest.dart';

class Login {
  final LoginRest api = LoginRest();
  Future<String?> login(email, senha) async {
    return await api.login(email, senha);
  }
}