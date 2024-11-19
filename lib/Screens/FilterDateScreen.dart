import 'package:design/Controller/FilterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil package

class DateFilterScreen extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
 
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter by Date'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Scale padding
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Adjust layout based on screen width
            bool isWideScreen = constraints.maxWidth > 600;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Select a Date for Filtering',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 16.h), // Space between title and next widget

                  // Informational Text
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      'Choose a date that fits your preference to filter the content shown.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h), // Space before the button

                  // Pick Date Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // Open date picker
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          String formattedDate = '${pickedDate.toLocal()}'.split(' ')[0];
                          filterController.setDate(formattedDate);
                        }
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        size: 18.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Pick Date',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 162, 187, 229), // Button color
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        elevation: 5, // Shadow effect
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h), // Space between button and selected date text

                  // Selected Date Display
                  Obx(() => AnimatedCrossFade(
                        firstChild: Text(
                          'No date selected',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                        secondChild: Text(
                          'Selected Date: ${filterController.selectedDate}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                        crossFadeState: filterController.selectedDate.isEmpty
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 300), // Smooth transition
                      )),
                  SizedBox(height: 30.h), // Space for bottom spacing

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
                            'You can use the date filter to see only the content relevant to the selected date.',
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
