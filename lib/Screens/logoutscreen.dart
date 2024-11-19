import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For navigation and state management
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart'; // For SystemNavigator.pop()

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logout',
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigate back using GetX
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 18.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // Navigate back without logging out
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 24.w,
                      ),
                      backgroundColor: Colors.grey,
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Close the application
                      SystemNavigator.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 24.w,
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
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
