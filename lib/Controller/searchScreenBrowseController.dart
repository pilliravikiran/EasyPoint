import 'package:get/get.dart';

class SearchBrowseController extends GetxController {
  // Controller for managing the state if needed (e.g., selected category, search text, etc.)
  var searchText = ''.obs;
  var categories = ["Plumbers", "Mechanics", "Tailors", "Chef"];
  var services = [
    {"title": "John's Plumbing Services", "description": "Expert plumbing solutions for all your needs.", "rating": 4},
    {"title": "QuickFix Mechanics", "description": "Reliable repair services same-day appointments.", "rating": 4},
    {"title": "Tech Repair Hub", "description": "Tech repair for phones, laptops, and other gadgets.", "rating": 4},
    {"title": "Sparkling Cleaning Co.", "description": "Professional cleaning services for home.", "rating": 4},
  ];
}