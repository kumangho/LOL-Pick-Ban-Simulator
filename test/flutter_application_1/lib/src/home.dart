import 'package:flutter/material.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/util.dart';
import 'dart:convert';

List topList = Champions.top;
List jugList = Champions.jug;
List midList = Champions.mid;
List botList = Champions.bot;
List supList = Champions.sup;

List _bluPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List _redPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List redTeam = List<String>.filled(5, null, growable: false);
List bluTeam = List<String>.filled(5, null, growable: false);

class Home extends StatefulWidget {
  @override
  State createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("PICK BAN SIMULATOR"),
          brightness: Brightness.dark,
          backgroundColor: MainColor),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: MainColor)),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 175,
                  decoration: myBoxDecoration(),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintStyle: TeamColor(Colors.blue),
                        hintText: 'Team Blue'),
                    style: TeamColor(Colors.blue),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: myBoxDecoration(),
                  child: Text(
                    'Patch 11.12',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  width: 60,
                ),
                Container(
                  height: 40,
                  width: 176,
                  decoration: myBoxDecoration(),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintStyle: TeamColor(Colors.red),
                        hintText: 'Team Red',
                        contentPadding: EdgeInsets.all(6),
                        border: InputBorder.none),
                    style: TeamColor(Colors.red),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                BanContainer(0),
                BanContainer(1),
                BanContainer(2),
                BanContainer(3),
                BanContainer(4),
                Container(
                  height: 44,
                  width: 60,
                  decoration: myBoxDecoration(),
                  child: Text(
                    'BAN',
                    style: TextStyle(fontSize: 20, color: SubColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                BanContainer(5),
                BanContainer(6),
                BanContainer(7),
                BanContainer(8),
                BanContainer(9),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    PlayerContainer(0, _bluPlayer[0], bluTeam[0]),
                    PlayerContainer(1, _bluPlayer[1], bluTeam[1]),
                    PlayerContainer(2, _bluPlayer[2], bluTeam[2]),
                    PlayerContainer(3, _bluPlayer[3], bluTeam[3]),
                    PlayerContainer(4, _bluPlayer[4], bluTeam[4])
                  ],
                ),
                Container(
                  height: 325,
                  width: 200,
                  decoration: BoxDecoration(
                      color: MainColor,
                      border: Border.all(color: SubColor),
                      image: DecorationImage(
                          image: new AssetImage('assets/images/map.jpg'),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                  children: [
                    PlayerContainer(0, _redPlayer[0], redTeam[0]),
                    PlayerContainer(1, _redPlayer[1], redTeam[1]),
                    PlayerContainer(2, _redPlayer[2], redTeam[2]),
                    PlayerContainer(3, _redPlayer[3], redTeam[3]),
                    PlayerContainer(4, _redPlayer[4], redTeam[4])
                  ],
                )
              ],
            ),
            Container(
              color: MainColor,
              child: DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          indicator: BoxDecoration(color: SubColor),
                          labelStyle: TeamColor(Colors.red),
                          unselectedLabelColor: SubColor,
                          indicatorColor: MainColor,
                          labelColor: Colors.white,
                          tabs: [
                            Tab(text: 'TOP'),
                            Tab(text: 'JG'),
                            Tab(text: 'MID'),
                            Tab(text: 'BOT'),
                            Tab(text: 'SUP')
                          ],
                        ),
                        decoration: myTabBoxDecoration(),
                      ),
                      Container(
                        height: 270,
                        child: TabBarView(children: [
                          ChampionGrid(topList),
                          ChampionGrid(jugList),
                          ChampionGrid(midList),
                          ChampionGrid(botList),
                          ChampionGrid(supList),
                        ]),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
