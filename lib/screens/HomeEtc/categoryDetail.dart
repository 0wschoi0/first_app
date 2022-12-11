import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/lastfm.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import 'dart:io';

class CategoryDetailScreen extends StatefulWidget {
  CategoryDetailScreen(
      {Key? key,
      required String cate,
      required String input,
      required int color})
      : _category = cate,
        _genreInput = input,
        _color = color,
        super(key: key);
  final String _category;
  final String _genreInput;
  final int _color;

  @override
  State<CategoryDetailScreen> createState() => _MyAppState();
}

//Detail info
class _MyAppState extends State<CategoryDetailScreen> {
  late String cate;
  late String input;
  late int color;
  late String cate;
  LastFM lastfm = LastFMUnauthorized(FlutterConfig.get('LASTFM_API_KEY'),
      FlutterConfig.get('LASTFM_SHARED_SECRET'));
  Xml2Json document = Xml2Json();
  String jsonData = "";
  late Map<String, dynamic> trackInfo;
  int numOfDetailList = 0;
  String recMusicName = "";
  int recMusicDur = 0;
  String recMusicCoverURL = "";
  String recMusicArtist = "";

  @override
  void initState() {
    cate = widget._category;
    input = widget._genreInput;
    color = widget._color;
    cate = widget._category;
    super.initState();
  }

  void fetchTrackInfo() async {
    document.parse((await lastfm.read('tag.getTopTracks', {
      "tag": input,
    }))
        .toString());
    jsonData = document.toParker();
    trackInfo = jsonDecode(jsonData);
    trackInfo = trackInfo['lfm']['tracks'];
    print(trackInfo);
    numOfDetailList = trackInfo['track'].length;
  }

  @override
  Widget build(BuildContext context) {
    fetchTrackInfo();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(color),
          title: Text(cate),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Flex(direction: Axis.vertical, children: [
              //여기 밑으로 검색결과들
              ListView.builder(
                  itemCount: 5, //numOfDetailList,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    //파싱이 정상적으로 가능한지 확인하지 못 함
                    //추가확인필요
                    recMusicName =
                        "Rolling in the deep"; // trackInfo['track'][index]['name'];
                    recMusicCoverURL =
                        "https://lastfm.freetls.fastly.net/i/u/64s/49849dd64a1524abcd8f3e9c1bf3cb64.png"; // trackInfo['track'][index]['image'][1];
                    recMusicArtist =
                        "Adele"; // trackInfo['track'][index]['artist']['name'];
                    return InkWell(
                      onTap: () {
                        print("yourflee");
                      },
                      child: Column(children: [
                        Container(
                          width: 358.70,
                          height: 85.53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26262626),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          // CONTENTS For each box
                          child: Row(children: [
                            //Album Cover Img
                            Padding(
                                padding: EdgeInsets.only(left: 12.5, right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    recMusicCoverURL,
                                    height: 60,
                                    width: 60,
                                  ),
                                )),
                            //Music title&Artist name
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Music title
                                Text(
                                  recMusicName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  //Artist name
                                  recMusicArtist,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 9.42,
                        ),
                      ]),
                    );
                  }),
            ]),
          ),
        ));
  }
}
