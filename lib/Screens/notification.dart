
import 'package:design/widgets/notificationwidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notification = controller.notifications[index];
              return NotificationCard(notification: notification);
            },
          ),
        ),
      ),
    );
  }
}





//controller

class NotificationController extends GetxController {
  // Observable list of notifications with more sample data
  var notifications = List.generate(
    10, // Number of notifications to display
    (index) => NotificationItem(
      title: 'Notification ${index + 1}',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      count: '${(index % 3) + 1}', // Sample count (1-3)
      timeAgo: '${(index + 1) * 2}m ago', // Different time for each
    ),
  ).obs;
}

class NotificationItem {
  final String title;
  final String description;
  final String count;
  final String timeAgo;

  NotificationItem({
    required this.title,
    required this.description,
    required this.count,
    required this.timeAgo,
  });
}
