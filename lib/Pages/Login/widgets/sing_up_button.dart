import 'package:flutter/material.dart';

class SingUpButton extends StatelessWidget {
  const SingUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(
          top: 160,
        ),
      ),
      child: Text(
        "Não possui uma conta? Cadastre-se!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
          //overflow caso o texto ultramasse o limite da tela
          fontWeight: FontWeight.w300,
          fontSize: 12,
          letterSpacing: 0.5, //espacamento entre as letras
        ),
      ),
    );
  }
}
