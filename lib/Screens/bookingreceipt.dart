import 'package:design/Controller/bookingReceiptController.dart';
import 'package:design/Screens/profileScreen.dart';
import 'package:design/widgets/bookingReceiptwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final BookingConfirmationController controller =
      Get.put(BookingConfirmationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Booking Confirmation',
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child:IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Get.to(ProfileScreen());
            },
          ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100.w,
              color: Colors.black,
            ),
            SizedBox(height: 20.h),
            Text(
              "Your Appointment has been booked with \"Los Santos Motors\"",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            SizedBox(height: 30.h),
            Obx(() => Column(
                  children: [
                    buildDetailRow("Location:", controller.location.value),
                    buildDetailRow("Price:", controller.price.value),
                    buildDetailRow("Time:", controller.time.value),
                    buildDetailRow("Date:", controller.date.value),
                  ],
                )),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  ),
                  child: Text(
                    'Go back to Home',
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel appointment action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  ),
                  child: Text(
                    'Cancel Appointment',
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
