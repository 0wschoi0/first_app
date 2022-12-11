import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/profile.dart';
import 'package:first_app/utils/cacheData.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cache/firestore_cache.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late Map<String, dynamic> temptDoc;
  //late QuerySnapshot snapshot;
  TextEditingController? nameController;
  TextEditingController? mailController;
  TextEditingController? msgController;
  late User _user;
  List resultTxt = List<String>.filled(10, "", growable: true);
  List songTxt = List<String>.filled(10, "", growable: true);
  List itmCnt = List<int>.filled(10, 0, growable: true);

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    nameController = TextEditingController();
    msgController = TextEditingController();
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InkWell playListElement(int index) {
      return InkWell(
        onTap: () {
          print("touched");
        },
        child: Column(children: [
          Container(
              width: 358.70,
              height: 190, //85.53,
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
              child: FutureBuilder(
                future: CacheData.fetchCacheData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return Text("fail");
                  } else {
                    final tempt = snapshot.data!.docs;
                    final usercol = FirebaseFirestore.instance
                        .collection(_user.email!)
                        .doc("privateList");
                    usercol.get().then((value) => {
                          resultTxt[0] =
                              (value["나만의 플레이리스트"]["0"][0].toString()),
                          resultTxt[1] =
                              (value["나만의 플레이리스트"]["1"][0].toString()),
                          songTxt[0] = (value["나만의 플레이리스트"]["0"][1].toString()),
                          songTxt[1] = (value["나만의 플레이리스트"]["1"][1].toString()),
                          itmCnt[0] = (value["나만의 플레이리스트"]["0"].length - 1),
                          itmCnt[1] = (value["나만의 플레이리스트"]["1"].length - 1),
                          setState(() {})
                        });

                    return ListView.separated(
                        itemCount: 2,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(thickness: 3),
                        itemBuilder: (context, index) {
                          return SizedBox(
                              height: 85.53,
                              child: ListTile(
                                title: RichText(
                                    text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: [
                                      //큰글씨 : 플레이리스트이름
                                      TextSpan(
                                          text: "${resultTxt[index]!}\n",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w600,
                                          )),
                                      //작은글씨 : 노래들이름
                                      TextSpan(
                                          text:
                                              "\n${songTxt[index]!}외 총 ${itmCnt[index]!}곡\n\n",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ])),
                              ));
                        });
                  }
                },
              )),
          SizedBox(
            height: 9.42,
          )
        ]),
      );
    }

    return Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 90,
              padding: const EdgeInsets.only(left: 30),
              child: Text("플레이리스트",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ))),
              child: TabBar(
                tabs: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '나만의 플레이리스트',
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '공유된 플레이리스트',
                    ),
                  ),
                ],
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: Colors.purple),
                ),
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          playListElement(0),
                          //playListElement(1),
                        ],
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '',
                      //'Tab2 View',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('New Playlist'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey, //키 할당
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '입력해주세요';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: '플레이리스트 이름',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              controller: msgController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '입력해주세요';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: '소개글',
                                icon: Icon(Icons.message),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final usercol = FirebaseFirestore.instance
                                  .collection(_user.email!)
                                  .doc("privateList");
                              int i = 0;
                              print("sdfsdaf");
                              usercol.get().then((value) => {
                                    usercol.update({
                                      "나만의 플레이리스트.${value["나만의 플레이리스트"].length}":
                                          [
                                        nameController!.value.text,
                                        "tomboy",
                                        "hypeboy",
                                        "새삥"
                                      ]
                                    })
                                  });
                            }
                            Navigator.pop(context);
                            // your code
                          })
                    ],
                  );
                });
          },
        ));
  }
}
