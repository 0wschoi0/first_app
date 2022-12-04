import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/playlist.dart';
import 'package:first_app/screens/search.dart';
import 'package:first_app/screens/notification.dart';
import 'package:first_app/screens/profile.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:first_app/screens/HomeEtc/categoryDetail.dart';
import 'package:first_app/utils/lastFM.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  late User _user;
  int _selectedIndex = 0;
  int _pageIndex = 0;
  //BottomNavigationBar 버튼 메뉴에 따른 dart 페이지 List
  late List<Widget> _widgetOptions = <Widget>[
    MyMain(pageIndex: _pageIndex),
    PlaylistScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: ,
        home: Scaffold(
      // 상단 고정

      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: '플레이리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '알림',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Image.network(
                _user.photoURL!,
                height: 25,
                width: 25,
              ),
            ),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    ));
  }

  // BottomNavigationBar 탭을 하였을 때 index의 state변경
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// 홈화면 첫번째 요소 슬라이드
InkWell FirstElement(int rgb, String title, String song1, String artist1,
    String song2, String artist2, String image1, String image2, String length) {
  return InkWell(
      onTap: () {
        print("touched");
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color(rgb),
          ),
          padding: const EdgeInsets.only(
            left: 21,
            top: 20,
            bottom: 23,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  length,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 350,
                  height: 34,
                  child: Row(children: <Widget>[
                    Image.network(
                      image1,
                      height: 34,
                      width: 34,
                      fit: BoxFit.contain,
                    ),
                    Column(children: <Widget>[
                      Flex(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Container(
                            height: 17,
                            child: Text(
                              " $song1",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 17,
                            child: Text(
                              " $artist1",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ]),
                ),
                SizedBox(height: 4),
                Container(
                    width: 350,
                    height: 34,
                    child: Row(children: <Widget>[
                      Image.network(
                        image2,
                        height: 34,
                        width: 34,
                        fit: BoxFit.contain,
                      ),
                      Column(children: <Widget>[
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            Container(
                              height: 17,
                              child: Text(
                                " $song2",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 17,
                              child: Text(
                                " $artist2",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ]))
              ])));
}

class MyMain extends StatefulWidget {
  const MyMain({Key? key, required int pageIndex})
      : _pageIndex = pageIndex,
        super(key: key);
  final int _pageIndex;

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  late Timer _timer;

  late int _pageIndex;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _pageIndex = widget._pageIndex;
    // 5초 지나면 자동으로 페이지 슬라이드
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      int animatingDuration = 350;
      if (_pageIndex < 4) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
        animatingDuration = 800;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: Duration(milliseconds: animatingDuration),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  // 홈 화면 UI 구성
  @override
  Widget build(BuildContext context) {
    // 홈화면 두번째 요소 슬라이드
    Positioned category(String cate, double leftP, double topP,
        IconData iconName, int color, String genre) {
      return Positioned(
          left: leftP,
          top: topP,
          child: InkWell(
            onTap: (() {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CategoryDetailScreen(
                    input: genre,
                  ),
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
                  },
                ),
              );
            }),
            child: Container(
              width: 45,
              height: 55.25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.27,
                    height: 32.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      iconName,
                      size: 32.25288772583008,
                      color: Color(color),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "$cate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1e1e1e),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ));
    }

    // 홈화면 마지막 요소 슬라이드
    InkWell LastElement() {
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
              )),
          SizedBox(
            height: 9.42,
          )
        ]),
      );
    }

    return Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/google_logo.png',
                  height: 30,
                  width: 30,
                ),
                Text(
                  " Hear! Here!",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
          ),
          body: ListView(children: [
            // 첫번째 요소
            Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 199,
                      child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _pageIndex = index;
                            });
                          },
                          children: [
                            SizedBox.expand(
                                child: FirstElement(
                                    0xFF5b778b,
                                    "이거 들으면서 출근하면\n다 이길 수 있음",
                                    "삐삐",
                                    "IU",
                                    "Attention",
                                    "NewJeans",
                                    "https://lastfm.freetls.fastly.net/i/u/64s/ec71d3329fb762bd59056645a55f0dd3.png",
                                    "https://lastfm.freetls.fastly.net/i/u/174s/026e88ed24b4902ffb8c492674904504.png",
                                    "15곡 | 49분 17초")),
                            SizedBox.expand(
                              child: FirstElement(
                                  0xFF391A1A,
                                  "출근길 지옥철? \n이정돈 껌이지",
                                  "Dice",
                                  "NMIXX",
                                  "Rush Hour(feat. j-hope of BTS",
                                  "Crush",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/7a51bee8674f56c6cbf7eea968855f46.png",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/7c79ecab44a7307f7d58e2a44952f1f3.png",
                                  "20곡 | 66분 09초"),
                            ),
                            SizedBox.expand(
                                child: FirstElement(
                                    0xFF53566D,
                                    "나른한 오후, \n편안한 팝 플레이리스트",
                                    "Think about you",
                                    "Sture Zetterberg",
                                    "Just tell me",
                                    "Alexa Cappelli",
                                    "https://images.genius.com/2e2710a53ce138a1ff2cbf3117b48325.640x640x1.jpg",
                                    "https://lastfm.freetls.fastly.net/i/u/64s/d0ab683146d15d9b8599d1e87535187c.png",
                                    "21곡 | 68분 43초")),
                            SizedBox.expand(
                              child: FirstElement(
                                  0xFF1A392E,
                                  "공부할 때, 책 읽을 때\n듣는 음악",
                                  "Pass you by",
                                  "Alaina Castillo",
                                  "Changes",
                                  "Hayd",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/49849dd64a1524abcd8f3e9c1bf3cb64.png",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/2b08251874a1e24c3b23cad4fe6fe936.png",
                                  "12곡 | 40분 19초"),
                            ),
                            SizedBox.expand(
                              child: FirstElement(
                                  0xFF536D64,
                                  "이거 틀면 옆 차선에서\n제목 알려달라 한다",
                                  "Circles",
                                  "Post Malone",
                                  "Peaches",
                                  "Justine Bieber",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/8a0bf866fadddaf1fac76e40192eed23.png",
                                  "https://lastfm.freetls.fastly.net/i/u/64s/d0e042f23c7b689d8958bfdc6c9d48c2.png",
                                  "20곡 | 64분 48초"),
                            ),
                          ])),
                  SizedBox(
                    height: 8,
                  ),
                  // 슬라이드 indicator
                  CarouselIndicator(
                    color: Color(0xFF828282),
                    activeColor: Color(0xFF2A5CE3),
                    animationDuration: 250,
                    space: 7,
                    width: 6,
                    count: 5,
                    index: _pageIndex,
                  ),

                  // 두번째 요소;
                  SizedBox(height: 9.42),
                  Text(
                    "지금 당신의 플리 mood는?",
                    style: TextStyle(
                      color: Color(0xff1e1e1e),
                      fontSize: 20,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.42),
                  Container(
                      width: 358.70,
                      height: 170.82,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 358.70,
                                height: 170.82,
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
                                child: Stack(children: [
                                  category(
                                      "이동",
                                      20,
                                      19.0,
                                      CupertinoIcons.location_solid,
                                      0xFF6D5353,
                                      "kpop"),
                                  category(
                                      "공부",
                                      91.27,
                                      19.01,
                                      CupertinoIcons.pencil,
                                      0xFF6D6753,
                                      "jazz"),
                                  category(
                                      "여행",
                                      162.54,
                                      19.01,
                                      CupertinoIcons.briefcase_fill,
                                      0xFF6D5953,
                                      "swing"),
                                  category(
                                      "운동",
                                      233.81,
                                      19.01,
                                      Icons.fitness_center,
                                      0xFF9E6464,
                                      "hip-hop"),
                                  category(
                                      "아침",
                                      305.08,
                                      19.01,
                                      CupertinoIcons.brightness_solid,
                                      0xFFAD9C81,
                                      "blues"),
                                  category("휴식", 19, 95.35, Icons.coffee,
                                      0xFF9E6487, "rnb"),
                                  category(
                                      "노동요",
                                      90,
                                      95.35,
                                      CupertinoIcons.desktopcomputer,
                                      0xFF64759E,
                                      "indie"),
                                  category(
                                      "취침",
                                      162.5,
                                      95.35,
                                      CupertinoIcons.bed_double_fill,
                                      0xFF9E6464,
                                      "christmas"),
                                  category(
                                      "게임",
                                      234.5,
                                      95.35,
                                      CupertinoIcons.game_controller_solid,
                                      0xFF472E2E,
                                      "rock"),
                                  category(
                                      "내적댄스",
                                      300,
                                      95.35,
                                      CupertinoIcons.headphones,
                                      0xFF391A1A,
                                      "soul"),
                                ])),
                          ])),
                  // 세번째 요소;
                  SizedBox(height: 9.42),
                  Text(
                    "추천하는 아티스트",
                    style: TextStyle(
                      color: Color(0xff1e1e1e),
                      fontSize: 20,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.42),
                  Column(
                    children: [
                      LastElement(),
                      LastElement(),
                      LastElement(),
                      LastElement(),
                      LastElement(),
                    ],
                  )
                ])
          ]),
        ));
  }
}
