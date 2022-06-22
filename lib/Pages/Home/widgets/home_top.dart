import 'package:flutter/material.dart';

import 'category_view.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({Key? key, required this.containerGrow}) : super(key: key);

  final Animation<double> containerGrow; //animação conteiner que vai crescer

  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; //pega o tamanho total da tela

    return Container(
      height: screenSize.height * 0.4, //40% da altura da tela
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/background.jpg'),
        fit: BoxFit.cover,
      )),
      child: SafeArea(
        //Widget Safe Area vai ignorar a parte da barra dos icones em cima da tela, os widgets nao vao invador a barra de status (statusbar)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //para espacar os widget no eixo principal da coluna (Espaço de alinhamento do eixo principal uniformemente)
          children: [
            Text(
              "Bem Vindo, Lucas!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              // Alignment.topRight para alinhar o circolo pequeno no topo - direita
              /*
              como containerGrow vai de 0 a 1 entao a altura e a largura vao de 0*120=0 ate 1*120=120 ou seja a largura e a altura vai alterar de 0 a 120
              fazendo a animação de aumentando
               */
              width: containerGrow.value * 120,
              height: containerGrow.value * 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/perfil.jpg'),
                    fit: BoxFit.cover, //para a imagem cobrir o circulo completo
                  )),
              child: Container(
                //bolinha no canto direito da imagem
                /*
              como containerGrow vai de 0 a 1 entao a altura e a largura vao de 0*35=0 ate 1*35=35 ou seja a largura e a altura vai alterar de 0 a 35
              fazendo a animação de aumentando
               */
                width: containerGrow.value * 35,
                height: containerGrow.value * 35,
                margin: EdgeInsets.only(left: 80),
                child: Center(
                  child: Text(
                    '23',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: containerGrow.value * 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1),
                ),
              ),
            ),
            CategoryView(),
          ],
        ),
      ),
    );
  }
}
