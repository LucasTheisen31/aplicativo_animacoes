import 'package:aplicativo_animacoes/Pages/Home/home_page.dart';
import 'package:aplicativo_animacoes/Pages/Login/widgets/form_container.dart';
import 'package:aplicativo_animacoes/Pages/Login/widgets/sing_up_button.dart';
import 'package:aplicativo_animacoes/Pages/Login/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  //ao iniciar a janela
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    //quando terminar a animação mudar o status vai notificar o listner
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      }
    });
  }

  //ao fechar a janela
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation =
        1; //para testar, faz tudo no app ficar mais lento * o valor passado, serve pra visualizzar as animaçoes mais lentamente
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          //ListView pois sao varios widgets que ira ter na tela de login e quero poder rolar a tela
          padding: EdgeInsets.zero,
          children: [
            Stack(
              //stack pois quero sobrepor widget na hora da animação, e o stack permite sobrepor widgets
              alignment: Alignment.bottomCenter,
              //alinha o Stack na parte de baixo centro
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        'images/tickicon.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    //widget que vai conter os inputs(campos de texto), feito
                    SingUpButton(), //botao de SingIn vem por cima da coluna
                    //classe que vai retornar um TextButton, feito
                  ],
                ),
                //Stager animation é a classe que vai desenhar o botao e suas animaçoes botao SingIn
                StaggerAnimation(animationController: _animationController),
              ],
            )
          ],
        ),
      ),
    );
  }
}
