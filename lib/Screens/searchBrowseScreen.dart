import 'package:design/Controller/searchScreenBrowseController.dart';
import 'package:design/Screens/profileScreen.dart';
import 'package:design/widgets/searchBrowseScreenwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class SearchBrowseScreen extends StatelessWidget {
  final SearchBrowseController controller = Get.put(SearchBrowseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Search and Browse',
          style: TextStyle(fontSize: 18.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Get.to(ProfileScreen());
            },
          ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              // Search Field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  hintText: "Search for Services...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onChanged: (value) => controller.searchText.value = value,
              ),
              SizedBox(height: 16.h),
              // Categories Section (Updated for Horizontal Scrolling)
              Text("Categories", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Container(
                height: 60.h,  // Set a fixed height for the horizontal scroll
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: controller.categories.map((category) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Chip(
                        label: Text(category),
                        backgroundColor: Colors.grey[200],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.h),
              // Services Section
              Text("Services", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Column(
                children: controller.services.map((service) {
                  return ServiceCard(
                    title: service['title'] != null ? service['title'] as String : '',
                    description: service['description'] != null ? service['description'] as String : '',
                    rating: service['rating'] != null ? (service['rating'] as num).toDouble().toInt() : 0, // Cast to int
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:design/Controller/searchScreenBrowseController.dart';
// import 'package:design/Screens/DetailScreen.dart';
// import 'package:design/widgets/searchBrowseScreenwidget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SearchBrowseScreen extends StatelessWidget {
//   final SearchBrowseController controller = Get.put(SearchBrowseController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Get.back(),
//         ),
//         title: Text(
//           'Search and Browse',
//           style: TextStyle(fontSize: 18.sp),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 16.w),
//             child: IconButton(
//               icon: Icon(Icons.account_circle, color: Colors.black),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 16.h),
//               // Search Field
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search),
//                   suffixIcon: Icon(Icons.mic),
//                   hintText: "Search for Services...",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                 ),
//                 onChanged: (value) => controller.searchText.value = value,
//               ),
//               SizedBox(height: 16.h),
//               // Categories Section (Updated for Horizontal Scrolling)
//               Text("Categories", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8.h),
//               Container(
//                 height: 60.h,  // Set a fixed height for the horizontal scroll
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: controller.categories.map((category) {
//                     return Padding(
//                       padding: EdgeInsets.only(right: 8.w),
//                       child: Chip(
//                         label: Text(category),
//                         backgroundColor: Colors.grey[200],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               // Services Section
//               Text("Services", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8.h),
//               Column(
//                 children: controller.services.map((service) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Pass the service details to the detail screen
//                       Get.to(
//                         DetailScreen(),
//                         arguments: service, // Passing the data
//                       );
//                     },
//                     child: ServiceCard(
//                     title: service['title'] != null ? service['title'] as String : '',
//                      description: service['description'] != null ? service['description'] as String : '',
//                      rating: service['rating'] != null ? (service['rating'] as num).toDouble().toInt() : 0, // Cast to int
//                    ));
//                  }).toList(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




