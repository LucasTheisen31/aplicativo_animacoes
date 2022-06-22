import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  //construtor, inicializando as animaçoes no proprio construtor,
  StaggerAnimation({required this.animationController})
      : buttonSqueeze = Tween(begin: 300.0, end: 60.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval(0, 0.150),
        )),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final AnimationController animationController;
  final Animation<double> buttonSqueeze; //animação squeeze('espremer')
  final Animation<double> buttonZoomOut; //animação Reduzir o zoom

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50, //50 de esspaçamento da parte de baixo do stack
      ),
      child: InkWell(
        //InkWell para servir de botao, pois vamos desenhar o botao manualmente
        //InkWell uma área retangular de um Material que "responde ao toque".
        onTap: () {
          animationController
              .forward(); //inicia a animação, faz a animaçao andar pra frente
        },
        child: Hero(
            tag: 'fade',
            child: buttonZoomOut.value == 60
            //se a animação ZoomOut nao iniciou ainda ou seja buttonZoomOut.value == 60, vai mostrar o container padrao
                ? Container(
              //vamos desenhar o botao manualmente em um container
              width: buttonSqueeze.value,
              height: 60,
              alignment: Alignment.center,
              //Alignment.center para o texto ficar centalizado
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 64, 106, 1.0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: _buildInside(context),
            )
            //se a animação ZoomOut ja iniciou e o buttonZoomOut.value > 60, mostra este outro container sem nada que vai variar a largura e a altura de acordo com buttonZoomOut.value
                : Container(
              //vamos desenhar o botao manualmente em um container
              width: buttonZoomOut.value,
              height: buttonZoomOut.value,
              //Alignment.center para o texto ficar centalizado
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 64, 106, 1.0),
                shape: buttonZoomOut.value < 500
                    ? BoxShape.circle
                    : BoxShape
                    .rectangle, //ate a metade da animação vai retornar um BoxShape.circle, e apos a metade da animação vai retornar um BoxShape.rectangle
              ),
            ),
        ),
      ),
    );
  }

  //funcao que retorna um widget -> ou texto ou um CircularProgressIndicator que vai estar
  // dentro do Botao que fizemos, quando a animação comçar e o botao ficar <75
  // vai trocar o texto do botao por um CircularProgressIndicator
  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        'SingIn',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3, //Espaçamento entre letras
        ),
      );
    } else {
      return CircularProgressIndicator(
        color: Colors.white,
      );
    }
  }

}
