import 'package:design/Controller/serviceDetailcontroller.dart';
import 'package:design/Screens/ContactSupport.dart';
import 'package:design/Screens/Manageappointmentscreen.dart';
import 'package:design/Screens/bookingreceipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceDetailsScreen extends StatelessWidget {
  // Instantiate the controller using Get.put
  final ServiceDetailsController controller =
      Get.put(ServiceDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "John's Plumbing Services",
          style: TextStyle(fontSize: 18.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for Title and Image
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula nibh eu sem auctor, ac interdum.",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w), // Space between text and image
                  // Image Container
                  Container(
                      width: 100.w,
                      height: 100.h,
                      color: Colors.grey[300], // Placeholder for the image
                      child: Image(
                        image: AssetImage(
                          'assets/profile.jpeg',
                        ),
                        fit: BoxFit.cover,
                      )
                      //Icon(Icons.image, size: 50.sp),
                      ),
                ],
              ),
              SizedBox(height: 20.h),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // This will ensure the Row takes only the needed width
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: 12.h),
              Text(
                "Reviews",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "1 - Excellent service and very professional – highly recommended!",
                        style: TextStyle(fontSize: 14.sp)),
                    SizedBox(height: 4.h),
                    Text(
                        "2 - Quick response and thorough work; couldn’t ask for better.",
                        style: TextStyle(fontSize: 14.sp)),
                    SizedBox(height: 4.h),
                    Text(
                        "3 - Great experience, friendly staff, and reliable service.",
                        style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Availability",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Availability Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status: Available",
                          style: TextStyle(fontSize: 14.sp)),
                      SizedBox(height: 4.h),
                      Text("Location: XYZ Street ABC",
                          style: TextStyle(fontSize: 14.sp)),
                      SizedBox(height: 4.h),
                      Text("Price: \$1200/-",
                          style: TextStyle(fontSize: 14.sp)),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Calendar Picker
                  Obx(
                    () => Container(
                      width: double
                          .infinity, // Make it responsive by taking full width
                      child: CalendarDatePicker(
                        initialDate: controller.selectedDate.value,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                        onDateChanged: controller.onDateChanged,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.bookAppointment,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            BookingConfirmationScreen()); // Navigate to BookAppointmentScreen
                      },
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  OutlinedButton(
                    onPressed: () {
                      Get.to(ContactSupportScreen());
                    },
                    //controller.contactUs,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 14.sp),
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
