
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';


import '../../routes/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: const Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/pet100x100.png'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/bb100x100.png'),
                ),
              ],
            ),
            SizedBox(
                height: 75,
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
                    "Logar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    child: SizedBox(
                      child: Image.asset("assets/bone.png"),

                      height: 28,
                      width: 28,
                    ),
                  )
                ],
              ),
                onPressed: () async {
                  await Navigator.pushNamed(
                      context, AppRoutes.homeclient);
                },
              ),
            ),
        ),
            SizedBox(
              height: 20
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
                        "Cadastrar-se",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/bone.png"),

                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    await Navigator.pushNamed(
                        context, AppRoutes.onboarding);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


/*  final _formKeyLogin = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "yosifob577@gearstag.com");
  final _senhaController = TextEditingController(text: "@Na110916");
  final _response = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: const Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/pet100x100.png'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/bb100x100.png'),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SvgPicture.asset(
            //       'assets/meupet 50x50.svg',
            //       width: 50,
            //       height: 50,
            //     ),
            //     SizedBox(width: 20),
            //     SvgPicture.asset(
            //       'assets/BB 50x50.svg',
            //       width: 50,
            //       height: 50,
            //     ),
            //   ],
            // ),
            SizedBox(height: 20),
            Form(
                key: _formKeyLogin,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // autofocus: true,
                      controller: _senhaController,

                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Container(
                    //   height: 40,
                    //   alignment: Alignment.centerRight,
                    //   child: FlatButton(
                    //     child: Text(
                    //       "Recuperar Senha",
                    //       textAlign: TextAlign.right,
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => ResetPasswordPage(),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                  ],
                )),
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
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
              child: SizedBox(
                child: Image.asset("assets/bone.png"),

                height: 28,
                width: 28,
              ),
            )
          ],
        ),
        onPressed: () {
          _login();

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(),
          //   ),
          // );
        },
      ),
    ),
    ),
            Container(
              height: 40,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  await Navigator.pushNamed(
                      context, AppRoutes.onboarding);
                },
            ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (_validateDescription()) {
      try {
        final email = _emailController.text;
        final senha = _senhaController.text;

        Login repository = Login();
        // homeAreaLogada logouoks = homeAreaLogada();
        //
        // final token = await repository.login(email, senha);
        // String tokens = '${token}';
        //
        // Map<String, dynamic> payload = Jwt.parseJwt(tokens);
        //final areaLogada = await logouoks.loginok('${payload['_id']}', tokens);
        //final user = await logouoks.usuario(areaLogada, token);

        // Map<String, dynamic> payloads = Jwt.parseJwt(user!);
        // print("aqui volta o usuario ${payloads}");


        // print('E-mail do usuário: ${payload['email']}');
        setState(() {
          _response.text = repository.api.emailController.value.text;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomeClientPage(mensagem: '${token}'),
          //   ),
          // );
        });
      } catch (exception) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login inválido')));
      }
    }
  }

bool _validateDescription() {
  if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
    // Mostrar mensagem de erro ao usuário
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Por favor, preencha todos os campos.')),
    );
    return false;
  }
  return true;
}*/
}