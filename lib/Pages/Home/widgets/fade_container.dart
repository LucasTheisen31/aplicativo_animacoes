
import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
  const FadeContainer({Key? key, required this.fadeAnimation}) : super(key: key);

  final Animation<Color?> fadeAnimation;//animação

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'fade',/*esma tag usada no Hero na StaggerAnimation da LoginPage
        ou seja quando for feita a transição da LoginPage para HomePage vai identificar que a HomePage possui um Hero com a mesma tag
        entao vai converter o conteiner da tela anterior para o conteiner da HomePage, vai meio que enviar uma tela pra outra
        entao vamos animar aquela conteiner para ir sumindo com o tempo
        */
        child: Container(
          decoration: BoxDecoration(
            color: fadeAnimation.value,
          ),
        ),
    );
  }
}
