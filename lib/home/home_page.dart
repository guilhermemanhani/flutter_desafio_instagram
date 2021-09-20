import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desafio_instagram/circle_avatar_widget.dart';
import 'package:flutter_desafio_instagram/model/heros/heros.dart';
import 'package:flutter_desafio_instagram/model/timeline/timeline.dart';

import '../time_liner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var herois = <Heros>[];
  var timeline = <Timeline>[];

  @override
  void initState() {
    super.initState();
    _loadHeros();
    _loadTimeLine();
  }

  Future<void> _loadHeros() async {
    final heroiJson = await rootBundle.loadString('assets/json/hero.json');
    setState(() {
      var cidadeList = json.decode(heroiJson);
      herois = cidadeList.map<Heros>((hero) => Heros.fromMap(hero)).toList();
    });
  }

  Future<void> _loadTimeLine() async {
    final timelineJson =
        await rootBundle.loadString('assets/json/timeline.json');
    setState(() {
      var cidadeList = json.decode(timelineJson);
      timeline = cidadeList
          .map<Timeline>((timeline) => Timeline.fromMap(timeline))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.padding.top;
    final heightBody = mediaQuery.size.height -
        statusBar -
        kToolbarHeight -
        kBottomNavigationBarHeight -
        34;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => print(''),
            icon: Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () => print(''),
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () => print(''),
            icon: Icon(Icons.chat_outlined),
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Birthstone',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 158,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: herois.length,
                itemBuilder: (context, index) {
                  var heroiAtual = herois[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: CircleAvatarWidget(
                      urlImage: heroiAtual.url,
                      nome: heroiAtual.nome,
                      favorito: heroiAtual.favorito,
                      aovivo: heroiAtual.aovivo,
                    ),
                  );
                },
              ),
            ),
            Container(
              height: heightBody - 158,
              child: ListView.builder(
                itemCount: timeline.length,
                itemBuilder: (context, index) {
                  var postAtual = timeline[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                    child: TimeLinerWidget(
                      urlPerfil: postAtual.urlPerfil,
                      urlFoto: postAtual.urlFoto,
                      curtida: postAtual.curtidas.toString(),
                      comentarios: postAtual.comentarios.toString(),
                      nome: postAtual.nome,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Pag1',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Pag2',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline_outlined,
              ),
              label: 'Pag1',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'Pag2',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assistant_direction_sharp,
              ),
              label: 'Pag2',
            ),
          ],
        ),
      ),
    );
  }
}
