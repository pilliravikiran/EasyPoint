
import 'package:design/Screens/serviceDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final int rating;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.rating,
  }) : super(key: key);

  // Function to create a list of stars based on the rating
  List<Widget> _buildStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        Icon(
          i < rating ? Icons.star : Icons.star_border, // Filled star for i < rating, otherwise empty star
          color: i < rating ? Colors.yellow : Colors.grey,
          size: 20.sp,
        ),
      );
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            // Centering the stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the stars horizontally
              children: _buildStars(rating), // Display dynamic stars based on the rating
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                // Use GetX to navigate to the DetailScreen and pass the service details as arguments
                Get.to(
                  ServiceDetailsScreen()
                  // arguments: {
                  //   'title': title,
                  //   'description': description,
                  //   'rating': rating,
                  // },
                );
              },
              child: Center(child: Text("View Details", style: TextStyle(fontSize: 16.sp))),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 177, 196, 211),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
