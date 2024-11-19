import 'package:design/Controller/FilterController.dart';
import 'package:design/Screens/FilterCategoryScreen.dart';
import 'package:design/Screens/FilterDateScreen.dart';
import 'package:design/Screens/FilterRatingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil package

class FilterOptionsWidget extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Design size (for example, iPhone 11 size)
      minTextAdapt: true,
    );

    return IconButton(
      icon: Icon(Icons.filter_alt_outlined, size: 30.sp), // Scale the icon size
      onPressed: () {
        // Show filter options when the icon is tapped
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16.0.w), // Scale padding
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter Options',
                        style: TextStyle(
                          fontSize: 18.sp, // Scale the font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0.h), // Scale the vertical spacing
                      ListTile(
                        leading: Icon(Icons.date_range, size: 24.sp), // Scale icon size
                        title: Text('Date', style: TextStyle(fontSize: 16.sp)), // Scale text size
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => DateFilterScreen());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.category, size: 24.sp), // Scale icon size
                        title: Text('Category', style: TextStyle(fontSize: 16.sp)), // Scale text size
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => CategoryFilterScreen());
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.star, size: 24.sp), // Scale icon size
                        title: Text('Rating', style: TextStyle(fontSize: 16.sp)), // Scale text size
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(() => RatingFilterScreen());
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
