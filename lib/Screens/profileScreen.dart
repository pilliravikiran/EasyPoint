import 'package:design/Screens/settingscreen.dart';
import 'package:design/widgets/profileScreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var username = 'John Doe'.obs;
  var email = 'johndoe@example.com'.obs;
}

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Get.to(SettingsScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            // Profile picture using local asset image
            CircleAvatar(
              radius: 60.r,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
            SizedBox(height: 16.h),
            Obx(() => Text(
                  controller.username.value,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 8.h),
            Obx(() => Text(
                  controller.email.value,
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                )),
            SizedBox(height: 24.h),
            Divider(),
            SizedBox(height: 24.h),
            ProfileActionButton(
              icon: Icons.edit,
              text: 'Edit Profile',
              onTap: () {
                Get.snackbar(
                    'Edit Profile', 'This feature is under development');
              },
            ),
            ProfileActionButton(
              icon: Icons.lock,
              text: 'Change Password',
              onTap: () {
                Get.snackbar(
                    'Change Password', 'This feature is under development');
              },
            ),
            ProfileActionButton(
              icon: Icons.history,
              text: 'View Activity Log',
              onTap: () {
                Get.snackbar(
                    'Activity Log', 'This feature is under development');
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/logout');
              },
              child: Text('Logout', style: TextStyle(fontSize: 16.sp)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
