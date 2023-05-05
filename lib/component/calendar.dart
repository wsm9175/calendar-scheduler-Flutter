import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );
    final defalutTextStyle = TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w700,
    );


    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      // 최소 날짜 선정
      lastDay: DateTime(3000),
      // 최대 날짜 선정
      //2 weeks 버튼 제거
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: PRIMARY_COLOR,
                width: 1.0,
              )
          ),
          defaultTextStyle: defalutTextStyle,
          weekendTextStyle: defalutTextStyle,
          selectedTextStyle: defalutTextStyle.copyWith(
            color: PRIMARY_COLOR
          ),
      ),

      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        print(selectedDay);
        setState(() {
          this.selectedDay = selectedDay;
        });
      },

      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) return false;

        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
