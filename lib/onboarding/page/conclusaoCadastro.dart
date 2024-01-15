
import 'package:flutter/material.dart';
import 'package:login_cadastro_app/routes/routes.dart';

class ConclusaoCadastro extends StatefulWidget{
  const ConclusaoCadastro ({Key? key}) : super(key: key);
  static const String routeName = '/EmailEnviado';

  @override
  State <ConclusaoCadastro>createState()=> _ConclusaoCadastroState();
}

class _ConclusaoCadastroState extends State<ConclusaoCadastro>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text("Cadastro Concluido"),
        ),

    body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Colors.white,
        child: ListView(children: <Widget>[
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
            height: 40,
          ),
          Form(child:
          const Text('Muito Obrigado pelo interesse em ativar seu plano. Ja pode efetuar o Login',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(
            height: 25,
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
                onPressed: ()async {
                 await Navigator.pushNamed(context, AppRoutes.homeclient);
                },
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),
        ]
        )
    )
    );
  }

}

