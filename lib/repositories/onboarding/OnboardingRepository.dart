import 'package:login_cadastro_app/onboarding/onboarding.model.dart';
import 'package:login_cadastro_app/rest/onboarding/onboarding_rest.dart';

class OnboardingRepository {
  final OnboardingRest api = OnboardingRest();
  Future<Cadastro> inserir(Cadastro cadastro) async {
    return await api.inserir(cadastro);
  }
}