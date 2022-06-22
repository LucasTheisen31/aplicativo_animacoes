import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> listaCategorias = ['ESTUDOS', 'TRABALHO', 'CASA'];
  int _indexListaCategoria = 0;

  void selectForward() {
    //anda pra frente na lista
    setState(() {
      _indexListaCategoria++;
    });
  }

  void selectBackward() {
    //anda pra tras na lista
    setState(() {
      _indexListaCategoria--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //Espaço de alinhamento do eixo principal(vai dar o espacamento possivel entre os widgets e nas beradas nao vai dar espaçamento)
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              disabledColor: Colors.white30, //cor ao desabilitar o botao
              onPressed: _indexListaCategoria > 0
                  ? selectBackward
                  : null //para usar indice < 0
              ),
          Text(
            listaCategorias[_indexListaCategoria].toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.2, //espacaento entre as letras
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              color: Colors.white,
              disabledColor: Colors.white30, //cor ao desabilitar o botao
              onPressed: _indexListaCategoria < listaCategorias.length - 1
                  ? selectForward
                  : null //para usar indice > que o tamanho da listaCategorias
              ),
        ],
      ),
    );
  }
}
