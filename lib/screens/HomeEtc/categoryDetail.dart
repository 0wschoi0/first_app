import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/lastfm.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class CategoryDetailScreen extends StatefulWidget {
  CategoryDetailScreen({Key? key, required String input})
      : _input = input,
        super(key: key);
  final String _input;

  @override
  State<CategoryDetailScreen> createState() => _MyAppState();
}

class _MyAppState extends State<CategoryDetailScreen> {
  late String input;
  LastFM lastfm = LastFMUnauthorized(FlutterConfig.get('LASTFM_API_KEY'),
      FlutterConfig.get('LASTFM_SHARED_SECRET'));
  Xml2Json document = Xml2Json();
  String jsonData = "";
  late Map<String, dynamic> trackInfo;

  @override
  void initState() {
    input = widget._input;
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
  }

  @override
  Widget build(BuildContext context) {
    fetchTrackInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Flex(direction: Axis.vertical, children: [
          Text(
            input,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ),
    );
  }
}
/*
  selectedItem(int index) async {
    trackDoc.parse(await lastfm.read('track.getInfo',
        {"artist": tracks['track'][index]['artist']}).toString());
  }
*/