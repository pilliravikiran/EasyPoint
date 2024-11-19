import 'package:get/get.dart';

class AppointmentController extends GetxController {
  // State variables for appointments
  var todayAppointments = [
    Appointment(
      title: "John’s Plumbing Services",
      description: "Meet for fixing the hatch of the car hood at 5 PM.",
      status: "Pending",
      date: "12/11/2024",
    ),
    Appointment(
      title: "Adam Furniture Services",
      description: "Visit to buy new furniture at 5 PM",
      status: "Pending",
      date: "13/11/2024",
    ),
  ].obs;

  var pastAppointments = [
    Appointment(
      title: "John’s Plumbing Services",
      description: "Repaint the whole car body at 2 PM.",
      status: "Done",
      date: "02/11/2024",
    ),
    Appointment(
      title: "John’s Plumbing Services",
      description: "Repaint the whole car body at 2 PM.",
      status: "Late",
      date: "02/11/2024",
    ),
  ].obs;
}

class Appointment {
  final String title;
  final String description;
  final String status;
  final String date;

  Appointment({
    required this.title,
    required this.description,
    required this.status,
    required this.date,
  });
}