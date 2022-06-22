import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({Key? key, required this.listSlidePosition})
      : super(key: key);

  final Animation<EdgeInsets> listSlidePosition;

  /* animação para a AnimatedListView (animacao do tipo EdgeInsets, ou seja é uma animacao de borda, ali em cima
  quando inicializamos a animação definimos que ela vai comecar com 0 e terminar com 80, ou seja borda 0 e terminar com borda 80 ja que é uma animação de borda ) */

  @override
  Widget build(BuildContext context) {
    return Stack(
      //stack para poder sobrepor os widgets e animalos
      alignment: Alignment.bottomCenter,
      //alinha os widgets na parte central de baixo no stack
      children: [
        ListData(
          titulo: 'Estudar Flutter',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *5,/* ou seja multiplicando a marginBotton por*5, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*5 =0 ate 80*5 = 400)
          vai fixar o MarginBotton(margin em baixo)do container em 400 de altura
          */
        ),
        ListData(
          titulo: 'Estudar Flutter',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *4,/* ou seja multiplicando a marginBotton por*4, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*4 =0 ate 80*4 = 320)
          vai fixar o MarginBotton(margin em baixo)do container em 320 de altura
          */
        ),
        ListData(
          titulo: 'Estudar Flutter',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *3,/* ou seja multiplicando a marginBotton por*3, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*3 =0 ate 80*3 = 240)
          vai fixar o MarginBotton(margin em baixo)do container em 240 de altura
          */
        ),
        ListData(
          titulo: 'Estudar Flutter',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *2,/* ou seja multiplicando a marginBotton por*2, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*2 =0 ate 80*2 = 160)
          vai fixar o MarginBotton(margin em baixo)do container em 160 de altura
          */
        ),
        ListData(
          titulo: 'Estudar Java',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *1,/* ou seja multiplicando a marginBotton por*1, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*1 =0 ate 80*1 = 80)
          vai fixar o MarginBotton(margin em baixo)do container em 80 de altura
          */
        ),
        ListData(
          titulo: 'Descansar',
          subTitulo: "Todo Dia",
          imagem: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value *0,/* ou seja multiplicando a marginBotton por*0, marginBoton foi definida a animaçao para ela ir de 0 a 80 entao (0*0 =0 ate 80*0 = 0)
          vai fixar o MarginBotton(margin em baixo)do container em 0 de altura
          */
        ),
      ],
    );
  }
}
