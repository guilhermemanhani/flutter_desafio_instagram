import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimeLinerWidget extends StatelessWidget {
  final String urlPerfil;
  final String urlFoto;
  final String curtida;
  final String comentarios;
  final String nome;
  const TimeLinerWidget({
    Key? key,
    required this.urlPerfil,
    required this.urlFoto,
    required this.curtida,
    required this.comentarios,
    required this.nome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(urlPerfil),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(alignment: Alignment.topLeft, child: Text(nome)),
              ],
            ),
            IconButton(
              onPressed: () => print(''),
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        Container(
          height: 296,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: NetworkImage(
              urlPerfil,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => print(''),
                  icon: Icon(
                    Icons.favorite_border_sharp,
                  ),
                ),
                IconButton(
                  onPressed: () => print(''),
                  icon: Icon(
                    Icons.chat_bubble_outline,
                  ),
                ),
                IconButton(
                  onPressed: () => print(''),
                  icon: Icon(
                    Icons.send_outlined,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => print(''),
              icon: Icon(Icons.flag),
            ),
          ],
        ),
      ],
    );
  }
}
