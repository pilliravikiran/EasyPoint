import 'package:design/Controller/settingController.dart';
import 'package:design/Screens/ContactSupport.dart';
import 'package:design/Screens/FAQsScreen.dart';
import 'package:design/Screens/FeedbackScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // For locking orientation

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView( // Ensures scrollability on smaller screens
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Text("Profile", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image Section
                  Container(
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 2.w),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      children: [
                        // Text Fields for Profile Info
                        _buildProfileTextField("Name..."),
                        _buildProfileTextField("Email..."),
                        _buildProfileTextField("Password...", obscureText: true),
                        SizedBox(height: 20.h),
                        // Action Buttons (Save & Edit)
                        Row(
                          children: [
                            Expanded(
                              child: _buildActionButton("Save changes", Colors.green),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: _buildActionButton("Edit", Colors.orange),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Divider(),
              SizedBox(height: 20.h),
              // Privacy Settings Section
              Text("Privacy Settings", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              _buildCheckboxTile("Notifications", controller.isNotificationEnabled),
              _buildCheckboxTile("Security Rules", controller.isSecurityEnabled),
              _buildCheckboxTile("Theme", controller.isThemeEnabled),
              SizedBox(height: 20.h),
              Divider(),
              SizedBox(height: 20.h),
              // Useful Links Section
              Text("Useful Links", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              _buildUsefulLinkButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method to build text fields
  Widget _buildProfileTextField(String label, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h), // Add padding for better spacing
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        ),
      ),
    );
  }

  // Custom method to build the action buttons (Save, Edit)
  Widget _buildActionButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label, style: TextStyle(fontSize: 14.sp)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h),
      ),
    );
  }

  // Custom method to build checkbox tiles for privacy settings
  Widget _buildCheckboxTile(String title, RxBool value) {
    return Obx(() {
      return CheckboxListTile(
        title: Text(title),
        value: value.value,
        onChanged: (newValue) {
          value.value = newValue!;
        },
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        activeColor: Colors.blueAccent,
        checkColor: Colors.white,
      );
    });
  }

  // Custom method to build useful link buttons
  Widget _buildUsefulLinkButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Wrap( // Use Wrap widget to prevent overflow
        spacing: 10.w, // Adjust the horizontal spacing between buttons
        runSpacing: 10.h, // Adjust the vertical spacing between buttons
        children: [
          _buildLinkButton("Contact Support", ContactSupportScreen()),
          _buildLinkButton("Feedback", FeedbackScreen()),
          _buildLinkButton("FAQ's", FAQScreen()),
        ],
      ),
    );
  }

  // Custom method to build individual link buttons
  Widget _buildLinkButton(String label, Widget screen) {
    return SizedBox(
      width: 120.w, // Ensure buttons don't overflow, you can adjust this width
      child: ElevatedButton(
        onPressed: () {
          Get.to(screen);
        },
        child: Text(label, style: TextStyle(fontSize: 12.sp)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 141, 177, 240),
          minimumSize: Size(90.w, 40.h), // Scales with ScreenUtil
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
      ),
    );
  }
}
