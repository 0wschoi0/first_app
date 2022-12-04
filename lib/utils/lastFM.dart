import 'package:lastfm/lastfm.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class LastFm {
  LastFM lastfm = LastFMUnauthorized(FlutterConfig.get('LASTFM_API_KEY'),
      FlutterConfig.get('LASTFM_SHARED_SECRET'));
  String jsonData = "";
  String artist = "";
  String track = "";
  String image = "";
  Xml2Json document = Xml2Json();
  late Map<String, dynamic> jsonDataD;
  late Map<String, dynamic> tracks;
  Future<String> getArtist(String track) async {
    document.parse(
        (await lastfm.read('track.search', {"track": track})).toString());
    jsonData = document.toParker();
    jsonDataD = jsonDecode(jsonData);
    jsonDataD = jsonDataD['lfm'];
    jsonDataD = jsonDataD['results'];
    jsonDataD = jsonDataD['trackmatches'];
    artist = jsonDataD['track'][0]['artist'];
    return artist;
  }

  Future<List<String>> getTrackInfo(String track) async {
    List<String> info = ["", "", ""];
    artist = await getArtist(track);
    document.parse(
        (await lastfm.read('track.getInfo', {"artist": artist, "track": track}))
            .toString());
    jsonData = document.toParker();
    jsonDataD = jsonDecode(jsonData);
    jsonDataD = jsonDataD['lfm'];
    jsonDataD = jsonDataD['track'];
    info[0] = track;
    info[1] = artist;
    info[2] = jsonDataD['album']['image'][0];

    return info;
  }

  Future<List<String>> getTrackImage(String artist, String track) async {
    List<String> info = ["", "", ""];
    artist = await getArtist(track);
    document.parse(
        (await lastfm.read('track.getInfo', {"artist": artist, "track": track}))
            .toString());
    jsonData = document.toParker();
    jsonDataD = jsonDecode(jsonData);
    jsonDataD = jsonDataD['lfm'];
    jsonDataD = jsonDataD['track'];
    info[0] = track;
    info[1] = artist;
    info[2] = jsonDataD['album']['image'][0];

    return info;
  }
}
