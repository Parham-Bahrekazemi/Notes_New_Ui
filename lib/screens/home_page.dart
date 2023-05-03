import 'package:flutter/material.dart';
import 'package:notes_new_ui/constants/constants.dart';

import '../widgets/category_item.dart';
import '../widgets/task_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgUrls = <String>[
    'bg1',
    'bg2',
    'bg3',
  ];

  List<String> contents = <String>[
    'آموزش',
    'ورزش',
    'خرید',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: <Widget>[
                _getHeader(),
                _searchBox(),
                _getTitle('دسته بندی'),
                _getCategoriesBox(),
                _getTitle('تسک های امروز'),
                const GetCategoryItem(),
                getTaskBox(context, 0.23),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCategoriesBox() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 163,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Container(
                  margin: index == 0 ? const EdgeInsets.only(right: 20) : null,
                  width: 130,
                  height: 163,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg${index + 1}.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Text(
                              contents[index],
                              style: TextStyle(
                                color: blackColor,
                                fontFamily: 'SB',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: blackColor,
              fontFamily: 'SB',
              fontSize: 16,
            ),
          ),
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
              color: greenColor,
              fontFamily: 'SB',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: SizedBox(
        height: 46,
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: greenColor),
            ),
            filled: true,
            fillColor: const Color(0xffffffff),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 15,
                top: 10,
                bottom: 12,
              ),
              child: Image.asset(
                'assets/images/search.png',
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 11,
              ),
              child: Image.asset(
                'assets/images/filter.png',
              ),
            ),
            hintText: 'جست و جوی تسکات...',
            hintStyle: TextStyle(
              color: graykColor,
              fontFamily: 'SB',
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: 32,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/avatar1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'سلام ، ',
                    style: TextStyle(
                        fontFamily: 'SB', color: blackColor, fontSize: 16),
                  ),
                  Text(
                    'پرهام 👋',
                    style: TextStyle(
                        fontFamily: 'SB', color: greenColor, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                '۲ شهریور',
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 12,
                  color: graykColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '۲۰ تسک فعال',
            style: TextStyle(
              fontFamily: 'SB',
              fontSize: 12,
              color: greenColor,
            ),
          )
        ],
      ),
    );
  }
}
