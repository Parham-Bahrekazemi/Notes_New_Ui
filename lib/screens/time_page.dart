import 'package:flutter/material.dart';
import 'package:notes_new_ui/constants/constants.dart';
import 'package:persian/persian.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String a = '00:34';

  List<String> titles = <String>[
    'کارآموزی',
    'جلسه',
    'جلسه',
    'لایو',
  ];

  List<String> contents = <String>[
    'جلسه با خانم رضایی',
    'جلسه هماهنگی کارها',
    'گفتگو راجب رونده استارتاپ',
    'دیدن لایو طبقه ۱۶',
  ];

  List<String> times = <String>[
    '۰۰:۲۵:۰۰',
    '۰۰:۳۰:۰۰',
    '۰۱:۰۰:۰۰',
    '۰۰:۴۰:۰۰',
  ];

  List<String> imgSrc = <String>[
    'avatar2',
    'avatar3',
    'avatar4',
    'avatar1',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  double initial = 0;

  bool stop = false;

  Stream<double> _stopWatch() async* {
    while (stop) {
      if (initial == 100) {
        break;
      }
      await Future.delayed(const Duration(
        seconds: 1,
      ));
      yield initial++;
    }
  }

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
                _progressBar(),
                _getButtons(),
                _getTitle(),
                _getBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: <Widget>[
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/edit2.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/delete.png',
                          width: 20.83,
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 380,
                  height: 76,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 15),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/${imgSrc[index]}.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SB',
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 95,
                        child: Text(
                          contents[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'SM',
                            color: graykColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        times[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SB',
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset('assets/images/play.png'),
                      ),
                      const SizedBox(width: 17),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _getTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 24),
      child: Row(
        children: <Widget>[
          Text(
            'شمارنده های ذخیره',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'SB',
              color: graykColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(107, 36),
              backgroundColor: lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() {
                stop = false;
              });
            },
            child: Text(
              'پایان',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SB',
                color: greenColor,
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(107, 36),
              backgroundColor: greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() {
                stop = true;
                _stopWatch();
              });
            },
            child: const Text(
              'ادامه',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SB',
              ),
            ),
          ),
        ],
      ),
    );
  }

  StreamBuilder<double> _progressBar() {
    return StreamBuilder<double>(
        stream: _stopWatch(),
        builder: (context, snapshot) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                width: 244,
                height: 244,
                child: SleekCircularSlider(
                  initialValue: initial,
                  innerWidget: (double percentage) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'توقف',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 24,
                            fontFamily: 'SB',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          initial.toString(),
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 16,
                            fontFamily: 'SM',
                          ),
                        ),
                      ],
                    );
                  },
                  appearance: CircularSliderAppearance(
                    startAngle: -90,
                    angleRange: 360,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      dynamicGradient: true,
                      trackColor: lightGreen,
                      progressBarColors: <Color>[
                        Colors.white,
                        greenColor,
                        greenColor,
                      ],
                      dotColor: greenColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: DashedCircularProgressBar.square(
                  dimensions: 350,
                  progress: initial,
                  maxProgress: 100,
                  startAngle: 0,
                  foregroundColor: greenColor,
                  backgroundColor: const Color(0xffeeeeee),
                  foregroundStrokeWidth: 5,
                  backgroundStrokeWidth: 5,
                  foregroundGapSize: 6,
                  foregroundDashSize: 6,
                  backgroundGapSize: 5,
                  backgroundDashSize: 6,
                  animation: true,
                ),
              ),
            ],
          );
        });
  }

  Widget _getHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 49),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 240,
            child: Expanded(
              child: TabBar(
                labelStyle: const TextStyle(fontSize: 13, fontFamily: 'SB'),
                indicatorColor: greenColor,
                indicatorWeight: 2,
                controller: _tabController,
                labelColor: blackColor,
                unselectedLabelColor: graykColor,
                tabs: const <Widget>[
                  Tab(
                    text: 'شمارنده معکوس',
                  ),
                  Tab(
                    text: 'زمان شمار',
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 25,
            height: 25,
            child: Image.asset('assets/images/settings.png'),
          ),
          const SizedBox(width: 35),
          SizedBox(
            width: 25,
            height: 25,
            child: Image.asset('assets/images/add.png'),
          ),
        ],
      ),
    );
  }
}
