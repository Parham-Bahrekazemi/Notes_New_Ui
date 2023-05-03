import 'package:flutter/material.dart';
import 'package:notes_new_ui/constants/constants.dart';
import 'package:notes_new_ui/widgets/category_item.dart';
import 'package:notes_new_ui/widgets/task_box.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:persian/persian.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int selectedIndex = 0;

  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: <Widget>[
                _getHeader(),
                _getDaysBox(),
                const GetCategoryItem(),
                getTaskBox(context, 0.35),
                _getDoneTaskTitle(),
                isOpen
                    ? AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: isOpen ? 1 : 0,
                        child: getTaskBox(context, 0.4, 0.5,
                            const NeverScrollableScrollPhysics(), true),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget _getDoneTaskTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: SizedBox(
          height: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Text(
                'تسک های انجام شده',
                style: TextStyle(
                    fontFamily: 'SB', color: Colors.black, fontSize: 14),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                child: isOpen
                    ? AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: 1,
                        child: Image.asset('assets/images/down_arrow.png'),
                      )
                    : AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: 0.5,
                        child: Image.asset('assets/images/down_arrow.png'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDaysBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 34, bottom: 16),
      child: SizedBox(
        height: 93,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Row(
                children: <Widget>[
                  index == 0
                      ? const SizedBox(width: 4)
                      : const SizedBox(width: 0),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 71,
                      height: 93,
                      decoration: BoxDecoration(
                        color: selectedIndex == index ? greenColor : lightGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 15),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'SM',
                              color: selectedIndex == index
                                  ? Colors.white
                                  : greenColor,
                            ),
                            child: const Text(
                              'چهارشنبه',
                            ),
                          ),
                          const SizedBox(height: 10),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'SM',
                              color: selectedIndex == index
                                  ? Colors.white
                                  : greenColor,
                            ),
                            child: Text(
                              '2'.withPersianNumbers(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : greenColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  index == 6
                      ? const SizedBox(width: 24)
                      : const SizedBox(width: 0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '۲ شهریور',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'SB',
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '۱۰ تسک فعال در امروز',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SB',
                  color: graykColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 56,
            height: 56,
            child: CircularPercentIndicator(
              backgroundColor: lightGreen,
              radius: 28.0,
              lineWidth: 4.0,
              percent: 0.2,
              center: Text(
                "20%".withPersianNumbers(),
                style: TextStyle(
                  fontSize: 16,
                  color: blackColor,
                  fontFamily: 'SB',
                ),
              ),
              progressColor: greenColor,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgCalendar.png'),
              ),
            ),
            width: 56,
            height: 56,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 14, left: 14, top: 16, bottom: 14),
                child: Image.asset('assets/images/calendar.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
