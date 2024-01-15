import 'package:Meu_Pet_Club/homeClient/page/homeClient.dart';
import 'package:Meu_Pet_Club/onboarding/page/conclusaoCadastro.dart';
import 'package:Meu_Pet_Club/onboarding/page/onboarding.page.dart';

import '../login/page/login.page.dart';


abstract class AppRoutes {
  static const login = LoginPage.routeName;
  static const onboarding = Onboarding.routeName;
  static const emailenviado= ConclusaoCadastro.routeName;
  static const homeclient = HomeClientPage.routeName;
}