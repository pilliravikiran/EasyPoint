import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedDate = ''.obs;
  var selectedCategory = ''.obs;
  var selectedRating = 0.obs;

  // Setters for each filter
  void setDate(String date) => selectedDate.value = date;
  void setCategory(String category) => selectedCategory.value = category;
  void setRating(int rating) => selectedRating.value = rating;
}
