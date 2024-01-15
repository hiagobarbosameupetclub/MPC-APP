
import 'package:Meu_Pet_Club/onboarding/onboarding.model.dart';
import 'package:Meu_Pet_Club/rest/onboarding/onboarding_rest.dart';

class OnboardingRepository {
  final OnboardingRest api = OnboardingRest();
  Future<Cadastro> inserir(Cadastro cadastro) async {
    return await api.inserir(cadastro);
  }
}