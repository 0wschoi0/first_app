import 'dart:convert';

import 'package:first_app/utils/cacheData.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cache/firestore_cache.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late Map<String, dynamic> temptDoc;
  //late QuerySnapshot snapshot;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
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
              child: FutureBuilder(
                future: CacheData.fetchCacheData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    return Text("");
                  } else {
                    final tempt = snapshot.data!.docs;
                    int i = 0;
                    while (i < tempt[0]["나만의 플레이리스트"]["tempt"].length) {
                      //////////////
                    }
                    //print(temptDoc);
                    return ListView.builder(
                        itemCount: tempt.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                tempt[0]["나만의 플레이리스트"]["tempt"].toString()),
                          );
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
              height: 118,
              padding: const EdgeInsets.only(left: 30),
              child: Text("플레이리스트",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
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
                          playListElement(1),
                        ],
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Tab2 View',
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
                    title: Text('Login'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Message',
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
                            // your code
                          })
                    ],
                  );
                });
          },
        ));
  }
}
