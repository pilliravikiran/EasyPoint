import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatelessWidget {
  // Controller to manage text input
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We value your feedback!',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle feedback submission
                  if (_feedbackController.text.trim().isEmpty) {
                    Get.snackbar('Error', 'Feedback cannot be empty',
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    // Here you would typically send the feedback to your backend server
                    Get.snackbar('Thank you!', 'Your feedback has been submitted',
                        snackPosition: SnackPosition.BOTTOM);
                    _feedbackController.clear();
                  }
                },
                child: Text('Submit', style: TextStyle(fontSize: 16.sp)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
