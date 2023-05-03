import 'package:flutter/material.dart';

import '../constants/constants.dart';

Widget getTaskBox(BuildContext context, double heightListView,
    [double? opacity, ScrollPhysics? physics, bool? checkTrue]) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * heightListView,
      child: ListView.builder(
          physics: physics,
          itemCount: 2,
          itemBuilder: (context, int index) {
            return Opacity(
              opacity: opacity ?? 1,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 132,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/images/study.png'),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'بدون عنوان',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'SB',
                                    color: blackColor,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1.4,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    activeColor: const Color(0xff18daa3),
                                    value: checkTrue ?? false,
                                    onChanged: (bool? value) {},
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'توضیحات',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'SM',
                                color: blackColor,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 85,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color(0xffe2f6f1),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset('assets/images/edit.png'),
                                      const SizedBox(width: 5),
                                      const Text(
                                        'ویرایش',
                                        style: TextStyle(
                                          color: Color(0xff18daa3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  width: 85,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: const Color(0xff18daa3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/time.png',
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          '00:00',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    ),
  );
}
