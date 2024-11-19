import 'package:design/Screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Calendar Widget
class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  CalendarWidget({required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDate,
      firstDay: DateTime(DateTime.now().year - 1),
      lastDay: DateTime(DateTime.now().year + 1),
      selectedDayPredicate: (day) => isSameDay(day, selectedDate),
      onDaySelected: (selectedDay, focusedDay) {
        onDateSelected(selectedDay);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// Reminder Widget
class ReminderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.notifications, color: Colors.white, size: 20.w),
        ),
        title: Text(
          'Reminder',
          style: TextStyle(fontSize: 16.sp),
        ),
        subtitle: Text(
          'Appointment at 3 PM with John\'s Auto Repair',
          style: TextStyle(fontSize: 12.sp),
        ),
        trailing: FittedBox(
          fit: BoxFit.scaleDown, // Ensures it scales down to prevent overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '12:34 PM',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ignore',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(NotificationScreen());
                    },
                    child: Text(
                      'View',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
