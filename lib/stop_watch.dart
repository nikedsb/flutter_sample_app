import 'package:flutter/material.dart';

void main() {
  stopWatch();
}

bool _start = false;
bool get getStart => _start;
set setStart(bool stop) {
  _start = stop;
}

void stopWatch() async {
  const duration = Duration(milliseconds: 10);
  var time = Duration(microseconds: 0);
  for (var i = 0; _start; i++) {
    await Future.delayed(duration, (() {
      time += duration;
    }));
  }
  print(time);
}

class StopWatchWidget extends StatelessWidget {
  const StopWatchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            if (!getStart) {
              setStart = true;
              stopWatch();
            } else {
              debugPrint('二度押し');
            }
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              fixedSize: Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Row(
            children: const <Widget>[Icon(Icons.arrow_forward), Text('START')],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setStart = false;
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Row(children: const <Widget>[
            Icon(Icons.av_timer_rounded),
            Text('STOP')
          ]),
        ),
      ],
    );
  }
}
