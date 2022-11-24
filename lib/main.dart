import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String theText = "Hello";
Icon theIcon = Icon(Icons.arrow_forward_ios_rounded);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      width: 390,
      height: 844,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 390,
                height: 843,
                color: Color(0xfff8f8f8),
                padding: const EdgeInsets.only(
                  bottom: 59,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 390,
                      height: 99,
                      color: Colors.white,
                    ),
                    SizedBox(height: 9.42),
                    Container(
                      width: 348.31,
                      height: 12.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 12.279999732971191),
                    ),
                    SizedBox(height: 9.42),
                    Container(
                      width: 390,
                      height: 199,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 390,
                            height: 199,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xff5b778b),
                            ),
                            padding: const EdgeInsets.only(
                              left: 21,
                              right: 156,
                              top: 20,
                              bottom: 23,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "이거 들으면서 출근하면\n다 이길 수 있음",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "15곡 | 49분 17초",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  width: 165,
                                  height: 38,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 50,
                                        top: 122,
                                        child: Text(
                                          "지코 (ZICO)",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "새삥(feat. Homies)",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 38,
                                            height: 38,
                                            child: FlutterLogo(size: 38),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  width: 109,
                                  height: 38,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 50,
                                        top: 122,
                                        child: Text(
                                          "NewJeans",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "Attention",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            width: 38,
                                            height: 38,
                                            child: FlutterLogo(size: 38),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 9.42),
                    Container(
                      width: 61.02,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 8),
                    ),
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
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 300,
                                  top: 95.35,
                                  child: Container(
                                    width: 45,
                                    height: 55.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.25288772583008),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "내적댄스",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 234.25,
                                  top: 95.35,
                                  child: Container(
                                    width: 32.27,
                                    height: 55.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.25288772583008),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "게임",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 162.50,
                                  top: 95.35,
                                  child: Container(
                                    width: 32.27,
                                    height: 55.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.25288772583008),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "취침",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 90,
                                  top: 95.35,
                                  child: Container(
                                    width: 34,
                                    height: 55.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.25288772583008),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "노동요",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 19,
                                  top: 95.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 55.25,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.25288772583008),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "휴식",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 305.08,
                                  top: 19.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 56,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 33,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.27000045776367),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "아침",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 233.81,
                                  top: 19.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 56,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.12,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.12239456176758),
                                        ),
                                        SizedBox(height: 7.88),
                                        Text(
                                          "운동",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 162.54,
                                  top: 19.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 56,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 32.12,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.12239456176758),
                                        ),
                                        SizedBox(height: 7.88),
                                        Text(
                                          "여행",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 91.27,
                                  top: 19.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 56,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 33,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.27000045776367),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "공부",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 19.01,
                                  child: Container(
                                    width: 32.27,
                                    height: 56,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32.27,
                                          height: 33,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: FlutterLogo(
                                              size: 32.27000045776367),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          "이동",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1e1e1e),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 9.42),
                    Text(
                      "최근에 이용한 플레이리스트",
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
                      height: 85.53,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 148,
                                  top: 50.19,
                                  child: Text(
                                    "김유정, 이승기, 제왑피99, 최민식87",
                                    style: TextStyle(
                                      color: Color(0xff757575),
                                      fontSize: 12,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  top: 45.79,
                                  child: Container(
                                    width: 52.49,
                                    height: 22.87,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                        FlutterLogo(size: 22.873931884765625),
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  top: 17.19,
                                  child: Text(
                                    "김이박최 드라이브 플리",
                                    style: TextStyle(
                                      color: Color(0xff1e1e1e),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 8.61,
                                  top: 11.02,
                                  child: Container(
                                    width: 63.44,
                                    height: 63.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterLogo(size: 63.4039421081543),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 9.42),
                    Container(
                      width: 358.70,
                      height: 85.53,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 148,
                                  top: 50,
                                  child: Text(
                                    "lovestudy43, samsu33, fighting^^7 ...",
                                    style: TextStyle(
                                      color: Color(0xff757575),
                                      fontSize: 12,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  top: 46,
                                  child: Container(
                                    width: 52.49,
                                    height: 22.87,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: 22.89,
                                              height: 22.87,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3f000000),
                                                    blurRadius: 3,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                color: Color(0xb2000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 22.89,
                                              height: 22.87,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3f000000),
                                                    blurRadius: 3,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                color: Color(0x7f000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 22.89,
                                              height: 22.87,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3f000000),
                                                    blurRadius: 3,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                color: Color(0x4c000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 22.89,
                                              height: 22.87,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3f000000),
                                                    blurRadius: 3,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                color: Color(0x66000000),
                                              ),
                                              padding: const EdgeInsets.only(
                                                top: 6,
                                                bottom: 7,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "+83",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  top: 17,
                                  child: Text(
                                    "공부할 때 듣는 플리 공유해요!",
                                    style: TextStyle(
                                      color: Color(0xff1e1e1e),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 8.79,
                                  top: 10.81,
                                  child: Container(
                                    width: 63.44,
                                    height: 63.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterLogo(size: 63.4039421081543),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 390,
                height: 92,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 390,
                      height: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 334.17,
                            top: 38.83,
                            child: Text(
                              "프로필",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffb7b7b7),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 339.91,
                            top: 11.79,
                            child: Container(
                              width: 21.49,
                              height: 20.70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x66949494),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 262.68,
                            top: 38.83,
                            child: Text(
                              "알림",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffb7b7b7),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 263.99,
                            top: 12.46,
                            child: Container(
                              width: 19.53,
                              height: 18.03,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 19.53,
                                    height: 16.19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xffb7b7b7),
                                        width: 1.50,
                                      ),
                                      color: Color(0x7f7f3a44),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 185.37,
                            top: 38.83,
                            child: Text(
                              "검색",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffb7b7b7),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 186.68,
                            top: 13.13,
                            child: Container(
                              width: 17.68,
                              height: 16.69,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FlutterLogo(size: 16.691457748413086),
                            ),
                          ),
                          Positioned(
                            left: 85.69,
                            top: 38.83,
                            child: Text(
                              "플레이리스트",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffb7b7b7),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 107.29,
                            top: 11.46,
                            child: Container(
                              width: 19.67,
                              height: 19.94,
                              padding: const EdgeInsets.only(
                                bottom: 6,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 19.67,
                                    height: 19.94,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Color(0xffb7b7b7),
                                        width: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 33.84,
                            top: 38.83,
                            child: Text(
                              "홈",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff295ce3),
                                fontSize: 12,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 29.99,
                            top: 11.46,
                            child: Container(
                              width: 18.03,
                              height: 19.29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FlutterLogo(size: 18.02666664123535),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
