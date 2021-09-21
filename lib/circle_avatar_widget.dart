import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String urlImage;
  final String nome;
  final bool aovivo;
  final bool favorito;
  const CircleAvatarWidget({
    Key? key,
    required this.urlImage,
    required this.nome,
    required this.aovivo,
    required this.favorito,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade400, Colors.purple.shade800],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(urlImage),
              ),
            ),
            aovivo
                ? Container(
                    width: 80,
                    height: 80,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple.shade600,
                              Colors.pink.shade900
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'AO VIVO',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                  ),
            favorito
                ? Container(
                    width: 72,
                    height: 72,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueGrey.shade600, Colors.grey],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.favorite_outlined,
                          color: Colors.purple.shade900,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                  ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 80,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: nome,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
