import 'package:design/Controller/FilterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

class CategoryFilterScreen extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  // Dummy category list (you can replace this with dynamic data)
  final List<String> categories = ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5'];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter by Category'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Scale padding
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Adjust layout based on screen width
            bool isWideScreen = constraints.maxWidth > 600;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Pick Category" Button
                ElevatedButton(
                  onPressed: () {
                    // Show category selection dialog or list
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select Category'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: categories
                                  .map(
                                    (category) => GestureDetector(
                                      onTap: () {
                                        filterController.setCategory(category);
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          category,
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Button color
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Pick Category',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.h), // Space between button and categories list

                Text(
                  'Select a Category',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold), // Scale font size
                ),
                SizedBox(height: 20.h), // Space between title and categories list

                // Category List
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Update the selected category when an item is tapped
                          filterController.setCategory(categories[index]);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300), // Smooth transition
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.all(16.0.w),
                          decoration: BoxDecoration(
                            color: filterController.selectedCategory == categories[index]
                                ? Colors.blueAccent // Blue for selected
                                : Colors.white, // White for unselected
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.category,
                                color: filterController.selectedCategory == categories[index]
                                    ? Colors.white // White icon for selected
                                    : Colors.blueAccent, // Blue icon for unselected
                                size: 24.sp, // Scale icon size
                              ),
                              SizedBox(width: 16.w), // Space between icon and text
                              Text(
                                categories[index],
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: filterController.selectedCategory == categories[index]
                                      ? Colors.white // White text for selected
                                      : Colors.black, // Black text for unselected
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h), // Space before the selected category text
                Obx(() => Padding(
                      padding: EdgeInsets.only(top: 16.0.h),
                      child: Text(
                        filterController.selectedCategory.isEmpty
                            ? 'No category selected'
                            : 'Selected Category: ${filterController.selectedCategory}',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
