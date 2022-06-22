import 'package:aplicativo_animacoes/Pages/Login/widgets/input_fild.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        ////Form pois queremos fazer a validação dos campos com TextFormField
          child: Column(
        children: [
          //compo de username
          InputField(
            hintText: 'Username',
            obscure: false,
            icon: Icons.person_outline,
          ),
          //campo de senha
          InputField(
            hintText: 'Password',
            obscure: true,
            icon: Icons.lock_outline,
          ),
        ],
      )),
    );
  }
}
