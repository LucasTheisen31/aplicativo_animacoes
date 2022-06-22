import 'package:aplicativo_animacoes/Pages/Home/widgets/fade_container.dart';
import 'package:aplicativo_animacoes/Pages/Home/widgets/home_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'animated_list_view.dart';

class SteggetAnimmation extends StatelessWidget {
  //construtor, inicializando as animaçoes no proprio construtor,
  SteggetAnimmation({Key? key, required this.animationController})
      : containerGrow =
            CurvedAnimation(parent: animationController, curve: Curves.easeIn),
        listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.325,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        fadeAnimation = ColorTween(
                begin: Color.fromRGBO(247, 64, 106, 1.0),
                end: Colors.transparent)
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.decelerate)),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> containerGrow; //animação conteiner que vai crescer
  final Animation<EdgeInsets> listSlidePosition;

  /* animação para a AnimatedListView (animacao do tipo EdgeInsets, ou seja é uma animacao de borda, ali em cima
  quando inicializamos a animação definimos que ela vai comecar com 0 e terminar com 80, ou seja borda 0 e terminar com borda 80 ja que é uma animação de borda ) */
  final Animation<Color?> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          //AnimatedBuilder sempre vai refazer esta parte da tela (no caso é o builder: BuildAnimation) toda vez que a animação tiver alguma alteração
          animation: animationController,
          builder: BuildAnimation,
        ),
      ),
    );
  }

  //metodo que retorna um widget com os conteudos da tela
  Widget BuildAnimation(BuildContext context, Widget? child) {
    return Stack(
      /*stack para sobrepor widgets, pois primeiro ira vir a animação da tela de login (aquela tela toda rosa) e essa animaçao
      vai ser usada no Fade Container(que sera o container rosa que vai cobrir toda a tela e que vai ser feito por min)
       */
      children: [
        ListView(
          //ListView pois quero rolar a tela para cima e para baixo
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          children: [
            HomeTop(containerGrow: containerGrow),
            //HomeTop widgetcriado
            AnimatedListView(listSlidePosition: listSlidePosition),
            //AnimatedListView widget criado, passo a animação listSlidePosition
          ],
        ),
        IgnorePointer(/*para ignorar o conteiner que vai ser colocado por cima, ou seja mesmo ele estando na tela, vamos poder clicar nos widgets que estao por baixo dele
        como esse conteiner vai ser usado so para animação e vai ficar transparente apos a animação precisamos conseguir clicar nos widgets a baixo que sao a list view
        RESUMINDO o IgnorePointer vai ignorar os toques no widget a baixo definido no child*/
          child: FadeContainer(fadeAnimation: fadeAnimation),
        ),
      ],
    );
  }
}
