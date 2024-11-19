import 'package:design/Controller/ManageAppointmentController.dart';
import 'package:design/Screens/profileScreen.dart';
import 'package:design/Screens/serviceDetailScreen.dart';
import 'package:design/widgets/Filterwidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class AppointmentScreen extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil with a reference screen size
    ScreenUtil.init(
      context,
      designSize:
          Size(375, 812), // Reference design size (iPhone X, for example)
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Appointments',
          style: TextStyle(fontSize: 18.sp), // Responsive font size
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                Get.to(ProfileScreen());
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Appointments",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                FilterOptionsWidget(),
              ],
            ),
            SizedBox(height: 10.h),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.todayAppointments.length,
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      appointment: controller.todayAppointments[index],
                    );
                  },
                )),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Past Appointments",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.pastAppointments.length,
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      appointment: controller.pastAppointments[index],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for Appointments...",
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Responsive border radius
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h), // Responsive margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appointment.title,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.w, vertical: 4.h), // Responsive padding
                  decoration: BoxDecoration(
                    color: appointment.status == "Pending"
                        ? Colors.amber
                        : appointment.status == "Done"
                            ? Colors.green
                            : Colors.red,
                    borderRadius:
                        BorderRadius.circular(12.r), // Responsive border radius
                  ),
                  child: Text(
                    appointment.status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              appointment.description,
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(ServiceDetailsScreen());
                      },
                      child: Text(
                        'Reschedule',
                        style:
                            TextStyle(fontSize: 12.sp), // Responsive font size
                      ),
                    ),
                    SizedBox(width: 8.w),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style:
                            TextStyle(fontSize: 12.sp), // Responsive font size
                      ),
                    ),
                  ],
                ),
                Text(
                  appointment.date,
                  style: TextStyle(fontSize: 12.sp), // Responsive font size
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
