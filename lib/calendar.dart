import 'package:flutter/material.dart';

List makeDateList() {
  const dayNumList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  final monthList = List.generate(12, (index) => index + 1);
  final now = DateTime.now();
  var dateList = [];
  monthList.asMap().forEach(
    (index, element) {
      if (now.month == element) {
        for (var i = now.day; i <= dayNumList[index]; i++) {
          dateList = [
            ...dateList,
            DateTime(now.year, element, i),
          ];
        }
      } else if (now.month < element) {
        for (var i = 1; i <= dayNumList[index]; i++) {
          dateList = [
            ...dateList,
            DateTime(now.year, element, i),
          ];
        }
      }
    },
  );
  return dateList;
}

// Widget getDateIcon(DateTime date) {
//   var now = DateTime.now();
//   if (date.month == now.month && date.day == now.day) {
//     //今日の時
//     return Container(
//       decoration:
//           BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen),
//       height: 50,
//       width: 50,
//       child: const Text(
//         'Today',
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   } else {
//     return const Icon(
//       Icons.arrow_forward,
//       color: Colors.white,
//     );
//   }
// }

// Widget getDateWrapper(DateTime date) {
//   var weekday = date.weekday;
//   String weekdayStr = '';
//   var color = Colors.black;
//   switch (weekday) {
//     case 1:
//       weekdayStr = 'Mon';
//       break;
//     case 2:
//       weekdayStr = 'Tue';
//       break;
//     case 3:
//       weekdayStr = 'Wed';
//       break;
//     case 4:
//       weekdayStr = 'Thur';
//       break;
//     case 5:
//       weekdayStr = 'Fri';
//       break;
//     case 6:
//       weekdayStr = 'Sat';
//       color = Colors.red;
//       break;
//     case 7:
//       weekdayStr = 'Sun';
//       color = Colors.lightBlue;
//       break;
//     default:
//       break;
//   }
//   Widget dateWrapper = Column(
//     children: [
//       RichText(
//           text: TextSpan(style: TextStyle(color: color), children: [
//         TextSpan(
//             text: weekdayStr, style: TextStyle(fontWeight: FontWeight.bold)),
//         TextSpan(text: '${date.month}/${date.day}')
//       ])),
//       Text('schedule')
//     ],
//   );
//   return dateWrapper;
// }

// Column(
//   children: <Widget>[
//     const Text('Calendar'),
//     ListView.builder(
//       itemBuilder: (context, index) {
//         final dateList = makeDateList();
//         // final icon = getDateIcon(dateList[index]);
//         // final dateWrap = getDateWrapper(dateList[index]);
//         return ListTile(
//             leading: Icon(Icons.arrow_back), title: Text('aaa'));
//       },
//       itemCount: makeDateList().length,
//     )
//   ],
// )

String sortWeekday(int weekday) {
  switch (weekday % 7) {
    case 0:
      return 'Sun';
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thur';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    default:
      return 'なし';
  }
}

final dateList = makeDateList();

class CircleWidget extends StatelessWidget {
  const CircleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: const Text('image')),
      decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(50),
          color: Colors.lightGreen),
      height: 100,
      width: 100,
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Image.asset(
          'images/flutter-logo.png',
        )),
        Expanded(
            child: Image.network(
          'https://cdn-ak.f.st-hatena.com/images/fotolife/m/mbaasdevrel/20200110/20200110154553.png',
        ))
      ],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text('calendar'),
        Expanded(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            var now = DateTime.now();
            var date = makeDateList()[index];
            var color;
            switch (dateList[index].weekday) {
              case 6:
                color = Colors.red;
                break;
              case 7:
                color = Colors.lightBlue;
                break;
              default:
                color = Colors.black;
            }
            var leading;
            if (dateList[index].month == now.month &&
                dateList[index].day == now.day) {
              leading = Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightGreen),
                  height: 50,
                  width: 50,
                  child: const Center(
                    child: Text(
                      'Today',
                      style: TextStyle(color: Colors.white),
                    ),
                  ));
            } else {
              leading = Icon(
                Icons.arrow_forward,
                color: Colors.lightGreen,
              );
            }
            var title = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(style: TextStyle(color: color), children: [
                  TextSpan(
                      text: sortWeekday(date.weekday),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${date.month}/${date.day}')
                ])),
                Text('schedule')
              ],
            );
            return ListTile(
              leading: leading,
              title: title,
            );
          }),
          itemCount: makeDateList().length,
        ))
      ],
    ));
  }
}
