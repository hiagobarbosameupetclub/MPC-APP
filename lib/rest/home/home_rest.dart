import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_cadastro_app/rest/api.dart';

class homeAreaLogada {
  Future<String?> loginok(id, token) async{
    http.Response response = await http.get(Uri.parse('${API.baseurl}/usuario/${id}'),
      headers: {
      'Authorization': 'Bearer ${token}',
      },
    );
    Map<String, dynamic> retorno = json.decode(response.body);
    final teste = retorno['data']['entidades'][0]['entidadeId'];
    print("aqui esta o token ${teste}");
    if(response.statusCode==200){
      return teste;
    }else{
      throw Exception(
          'erro'
      );
    }
  }

  // Future<String?> usuario(id, token) async {
  //   http.Response response = await http.get(
  //     Uri.parse('${API.baseurl}/cliente/${id}/pessoaFisica'),
  //     headers: {
  //       'Authorization': 'Bearer ${token}',
  //     },
  //   );
  //   Map<String, dynamic> retorno = json.decode(response.body);
  //   print("aqui esta o token ${retorno}");
  //   if(response.statusCode==200){
  //     print("retorno ${retorno}");
  //   }else{
  //     throw Exception(
  //         'erro'
  //     );
  //   }
  // }
}