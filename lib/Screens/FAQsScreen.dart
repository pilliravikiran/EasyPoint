import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  // List of FAQs
  final List<Map<String, String>> faqs = [
    {
      "question": "How can I book an appointment?",
      "answer": "To book an appointment, navigate to the 'Search Services' screen, select a service, and choose a time slot that suits you."
    },
    {
      "question": "How do I cancel or reschedule an appointment?",
      "answer": "Go to 'Manage Appointments' and select the appointment you wish to cancel or reschedule. Follow the prompts to complete the action."
    },
    {
      "question": "Is there any customer support available?",
      "answer": "Yes, our customer support team is available 24/7. You can contact them via the 'Contact Support' screen."
    },
    {
      "question": "What payment methods are accepted?",
      "answer": "We accept credit/debit cards, PayPal, and other online payment methods for your convenience."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQs',
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
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                faqs[index]['question'] ?? '',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Text(
                    faqs[index]['answer'] ?? '',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
