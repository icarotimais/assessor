import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:get/get.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'calendario_controller.dart';

class CalendarioView extends GetView<CalendarioController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: CalendarCarousel<Event>(
                onDayPressed: (date, events) {
                  //this.setState(() => _currentDate = date);
                  events.forEach((event) => print("oi"));
                },
                thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
                locale: "pt-BR",
                weekFormat: false,
                markedDatesMap: _markedDateMap,
                height: 500.0,
                //selectedDateTime: _currentDate2,
                showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
                customGridViewPhysics: NeverScrollableScrollPhysics(),
                markedDateShowIcon: true,
                selectedDayTextStyle: TextStyle(
                  color: Colors.yellow,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.white,
                ),
                childAspectRatio: 3,
                //minSelectedDate: _currentDate.subtract(Duration(days: 360)),
                //maxSelectedDate: _currentDate.add(Duration(days: 360)),
                todayButtonColor: Colors.green,
                todayBorderColor: Colors.green,
                markedDateMoreShowTotal:
                    true, // null for not showing hidden events indicator
                daysHaveCircularBorder: true,
                markedDateIconMargin: 5,
                markedDateIconOffset: 5,
              ),
            ),
          ],
        ));
  }
}

var _markedDateMap = new EventList<Event>(
  events: {
    new DateTime(2021, 4, 4): [
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 1',
      ),
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 2',
      ),
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 3',
      ),
    ],
    new DateTime(2021, 4, 6): [
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 1',
      ),
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 2',
      ),
      new Event(
        date: new DateTime(2021, 4, 4),
        title: 'Event 3',
      ),
    ],
  },
);
