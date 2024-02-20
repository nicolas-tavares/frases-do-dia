import 'package:flutter/material.dart';  //Biblioteca principal códigos dart
import 'dart:math';    //Gerar números aleatórios pra escolher frases
import 'package:flutter/services.dart';  //Biblioteca serviços extra dart


void main(){

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);      /* Orientação de tela, nesse caso não
                                                 é possivel girar a tela */
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Nem todos os dias são bons, mas há algo bom em cada dia.",
    "Respeite sua mente e trate seu corpo com carinho.",
    "Lidar com erros e fracassos é tão importante quanto aceitar o sucesso.",
    "Toda manhã você tem duas escolhas: continuar dormindo com seus sonhos ou acordar e persegui-los!",
    "Comece seu dia com um sorriso que venha lá de dentro da alma.",
    "Imagine uma nova história para sua vida e acredite nela.",
    "Todos os dias são diferentes. Basta observar o que a natureza tem para te oferecer.",
    "Um homem criativo é motivado pelo desejo de alcançar, não pelo desejo de vencer os outros.",
    "Acredite em milagres, mas não dependa deles.",
    "Cada segundo é tempo para mudar tudo para sempre.",
    "Não importa a cor do céu, quem faz o dia lindo é você.",
    "Se quer viver uma vida feliz, amarre-se a um objetivo, não às pessoas ou aos objetos.",
    "Siga Nicolas Tavares no linkedin e instagram!",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){

    var numeroSorteado = Random().nextInt( _frases.length );   //_frases.length = todas as frases do array
    // ou: var numeroSorteado = Random().nextInt(13); */

    setState(() {  //setState - muda o valor da variável
      _fraseGerada = _frases[numeroSorteado];  // Vai gerar posição aleatória do array
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do dia"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),

          // width: double.infinity,           //Double.infinity = 100% do espaço disponível

         /* decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.amber),  //Borda para visualização do container
          ), */

          child:  Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Separação dos widgets (textos,imagens...)
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Image.asset("images/logo_frases.png"),
               Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                onPressed: _gerarFrase,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple
                ),

                child: const Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              )
            ],
          ),
        ),
      )
    );
  }
}
