import 'package:flutter/material.dart';

//classe que vai construir os itens para AnimatedLIstView
class ListData extends StatelessWidget {
  const ListData(
      {Key? key,
      required this.titulo,
      required this.subTitulo,
      required this.imagem,
      required this.margin})
      : super(key: key);

  final String titulo;
  final String subTitulo;
  final ImageProvider imagem;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            //borda do topo
            color: Colors.grey.shade200,
            width: 1,
          ),
          bottom: BorderSide(
            //borda em baixo
            //borda do topo
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            //conteiner para a imagem
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imagem,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                subTitulo,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
