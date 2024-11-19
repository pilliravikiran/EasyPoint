import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  // For demonstration, let's add a simple state to track the selected date
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void onDateChanged(DateTime date) {
    selectedDate.value = date;
  }

  void bookAppointment() {
    // Logic for booking an appointment (placeholder)
    Get.snackbar("Appointment", "Appointment booked successfully!");
  }

  void contactUs() {
    // Logic for contacting (placeholder)
    Get.snackbar("Contact", "Contacting John's Plumbing Services...");
  }
}
