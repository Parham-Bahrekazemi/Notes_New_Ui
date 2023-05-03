import 'package:flutter/material.dart';
import 'package:persian/persian.dart';

import '../constants/constants.dart';

class GetCategoryItem extends StatefulWidget {
  const GetCategoryItem({super.key});

  @override
  State<GetCategoryItem> createState() => _GetCategoryItemState();
}

class _GetCategoryItemState extends State<GetCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return getCategoriesItem();
  }

  List<String> hoursCategory = <String>[
    'همه',
    '8:30-10',
    '10-12',
    '12-13:30',
    '14-16',
    '16-18',
    '18-20',
    '20-22',
    '22-00',
    '00-02',
    '02-04',
    '04-06',
    '06-08',
  ];

  int selectedIndex = 0;

  Widget getCategoriesItem() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: hoursCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              hoursCategory[index] == hoursCategory.first
                  ? const SizedBox(width: 14)
                  : const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AnimatedScale(
                    scale: selectedIndex == index ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: greenColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color:
                              selectedIndex == index ? blackColor : graykColor,
                          fontSize: 16,
                          fontFamily: 'SB',
                        ),
                        child: Text(
                          hoursCategory[index].withPersianNumbers(),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              hoursCategory[index] == hoursCategory.last
                  ? const SizedBox(width: 24)
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
