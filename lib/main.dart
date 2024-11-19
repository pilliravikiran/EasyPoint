import 'package:design/Screens/HomeScreen.dart';
import 'package:design/Screens/Manageappointmentscreen.dart';
import 'package:design/Screens/bookingreceipt.dart';
import 'package:design/Screens/logoutscreen.dart';
import 'package:design/Screens/notification.dart';
import 'package:design/Screens/searchBrowseScreen.dart';
import 'package:design/Screens/serviceDetailScreen.dart';
import 'package:design/Screens/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart'; 

void main() {
  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,   
    DeviceOrientation.portraitDown, 
  ]);

  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), 
      minTextAdapt: true, 
      builder: (context, _) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/searchService', page: () => SearchBrowseScreen()),
        GetPage(name: '/manageAppointment', page: () => AppointmentScreen()),
        GetPage(name: '/servicescreen', page: () => ServiceDetailsScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
        GetPage(name: '/logout', page: () => LogoutScreen()),
        GetPage(name: '/booking', page: () => BookingConfirmationScreen()),
        GetPage(name: '/Notification', page: () => NotificationScreen()),
      ],
    );
  }
}
