import 'package:first_app/screens/HomeEtc/categoryDetail.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/lastfm.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final myController = TextEditingController();
  FocusNode textFocus = FocusNode();
  LastFM lastfm = LastFMUnauthorized(FlutterConfig.get('LASTFM_API_KEY'),
      FlutterConfig.get('LASTFM_SHARED_SECRET'));
  Xml2Json document = Xml2Json();
  String artist = "";
  String input = "";
  String jsonData = "";
  late Map<String, dynamic> jsonDataD;
  late Map<String, dynamic> tracks;
  int initNum = 0;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  searchedItems() {
    return GestureDetector(
        onTap: () {
          textFocus.unfocus();
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white70,
              child: InkWell(
                onTap: () {
                  artist = tracks['track'][index]['artist'];
                  input = tracks['track'][index]['name'];
                  transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  };
                },
                child: Container(
                    child: Row(
                  children: <Widget>[
                    tracks['track'][index]['image'] != null
                        ? Image.network(
                            tracks['track'][index]['image'][2],
                            height: 50,
                            width: 80,
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            'assets/app_logo.png',
                            height: 50,
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                    Column(
                      children: <Widget>[
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                tracks['track'][index]['name'],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                tracks['track'][index]['artist'],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
              ),
            );
          },
          itemCount: initNum,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
            // input 값 받기
            controller: myController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            //enter 키 입력 신호
            textInputAction: TextInputAction.done,
            cursorColor: Colors.purple,
            style: TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: "검색",
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            // 검색 할 때 일어나는 일 (enter Key)
            onSubmitted: (term) async {
              // .xml 값으로 받아와 .json으로 파싱
              //input = term;
              document.parse(
                  (await lastfm.read('track.search', {"track": term}))
                      .toString());
              jsonData = document.toParker();
              jsonDataD = jsonDecode(jsonData);
              jsonDataD = jsonDataD['lfm'];
              jsonDataD = jsonDataD['results'];
              tracks = jsonDataD['trackmatches'];
              initNum = tracks['track'].length;
              setState(() {
                searchedItems();
              });
            }),
      ),
      body: initNum == 0
          ? GestureDetector(
              onTap: () {
                textFocus.unfocus();
              },
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: Container(
                    padding: EdgeInsets.only(top: 10),
                    color: Colors.white,
                    child: Text(
                      "음악, 플레이리스트를 검색해보세요",
                      style: TextStyle(color: Colors.black87),
                      textAlign: TextAlign.center,
                    )),
              ))
          : searchedItems(),
      backgroundColor: Colors.white,
    );
  }
}
