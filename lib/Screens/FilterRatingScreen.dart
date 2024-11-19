import 'package:design/Controller/FilterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil package

class RatingFilterScreen extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter by Rating'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Scale padding
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Description
                  Text(
                    'Select a Rating for Filtering',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16.h), // Space between title and description

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      'Slide the rating to select the desired rating level. You can filter content based on user ratings.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h), // Space before the slider

                  // Rating Slider with Text Label
                  Text(
                    'Rating: ${filterController.selectedRating.value.toString()}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10.h), // Space between slider label and slider
                  
                  // Custom Slider
                  Slider(
                    value: filterController.selectedRating.value.toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: filterController.selectedRating.value.toString(),
                    activeColor: Colors.blueAccent,
                    inactiveColor: Colors.blueAccent.withOpacity(0.4),
                    thumbColor: Colors.yellow, // Custom Thumb color
                    onChanged: (double newValue) {
                      filterController.setRating(newValue.toInt());
                    },
                    // Customizing the track
                    onChangeStart: (_) {
                      // Optional: Add a visual cue when slider starts sliding
                    },
                    onChangeEnd: (_) {
                      // Optional: Add a visual cue when slider stops sliding
                    },
                  ),
                  
                  SizedBox(height: 30.h), // Space after the slider

                  // Display the rating as stars
                  Obx(() {
                    int rating = filterController.selectedRating.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        if (index < rating) {
                          return Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30.sp, // Scale icon size
                          );
                        } else {
                          return Icon(
                            Icons.star_border,
                            color: Colors.grey,
                            size: 30.sp, // Scale icon size
                          );
                        }
                      }),
                    );
                  }),

                  SizedBox(height: 30.h), // Space before bottom section

                  // Additional Information Section
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.blueAccent, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Helpful Tip:',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'You can filter products, reviews, or content based on user ratings. Use the slider to select a rating between 0 and 5 stars.',
                            style: TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
