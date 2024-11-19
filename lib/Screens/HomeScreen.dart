import 'package:design/Screens/Manageappointmentscreen.dart';
import 'package:design/Screens/bookingreceipt.dart';
import 'package:design/Screens/logoutscreen.dart';
import 'package:design/Screens/notification.dart';
import 'package:design/Screens/profileScreen.dart';
import 'package:design/Screens/searchBrowseScreen.dart';
import 'package:design/Screens/serviceDetailScreen.dart';

import 'package:design/Screens/settingscreen.dart';
import 'package:design/widgets/HomeScreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importing the widgets
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Controller for handling state with GetX
class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EasyAppoint',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Open the drawer using the context within Builder
            },
          ),
        ),
        actions: [
          
      
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Get.to(ProfileScreen());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'EasyAppoint',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back(); // Close the drawer
                Get.to(HomeScreen()); // Navigate to the home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search Service', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back();
                Get.to(SearchBrowseScreen()); // Navigate to SearchBrowseScreen
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title:
                  Text('Manage Appointment', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back();
                Get.to(AppointmentScreen()); // Navigate to AppointmentScreen
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back();
                Get.to(NotificationScreen()); // Navigate to NotificationScreen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back();
                Get.to(SettingsScreen()); // Navigate to SettingsScreen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Get.back();
                Get.to(LogoutScreen()); // Navigate to LogoutScreen
              },
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Using ScreenUtil for padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming Appointments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Obx(() => CalendarWidget(
                    selectedDate: controller.selectedDate.value,
                    onDateSelected: controller.selectDate,
                  )),
              SizedBox(height: 8.h),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(AppointmentScreen()); // Navigate to AppointmentScreen
                  },
                  child: Text('View All Appointments'),
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(SearchBrowseScreen()); // Navigate to SearchBrowseScreen
                    },
                    child: Text('Search Services'),
                    style: ElevatedButton.styleFrom(
                       backgroundColor: const Color.fromARGB(255, 164, 193, 243),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(ServiceDetailsScreen()); // Navigate to ServiceDetailScreen
                    },
                    child: Text('New Appointment'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ReminderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
