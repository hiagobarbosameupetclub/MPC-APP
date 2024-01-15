import 'package:flutter/material.dart';
import 'package:login_cadastro_app/homeClient/page/homeClient.dart';
import 'package:login_cadastro_app/onboarding/page/conclusaoCadastro.dart';
import 'package:login_cadastro_app/onboarding/page/onboarding.page.dart';
import 'package:login_cadastro_app/routes/routes.dart';

import 'login/page/login.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
    routes: {
      AppRoutes.login: (_) => LoginPage(),
      AppRoutes.onboarding: (context) => Onboarding(),
      AppRoutes.emailenviado: (context) => ConclusaoCadastro(),
      AppRoutes.homeclient: (context) => HomeClientPage(),
      //AppRoutes.homeclient: (context) => HomeClientPage(mensagem: "teste"),
      },
    );
  }
}
