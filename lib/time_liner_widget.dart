import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimeLinerWidget extends StatelessWidget {
  final String urlPerfil;
  final String urlFoto;
  final String curtida;
  final String comentarios;
  final String nome;
  final String msg;
  const TimeLinerWidget({
    Key? key,
    required this.urlPerfil,
    required this.urlFoto,
    required this.curtida,
    required this.comentarios,
    required this.nome,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Row(
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
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: NetworkImage(
              urlPerfil,
            ),
            fit: BoxFit.cover,
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
                    Icons.mode_comment_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () => print(''),
                  icon: Icon(
                    Icons.near_me_outlined,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => print(''),
              icon: Icon(Icons.turned_in_not_sharp),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Text('$curtida curtidas'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Text('$nome $msg'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            left: 8.0,
            right: 8.0,
          ),
          child: InkWell(
            child: Text(
              'ver todos os $comentarios comentários',
              style: TextStyle(color: Colors.white54),
            ),
            onTap: () => print(''),
          ),
        ),
      ],
    );
  }
}
