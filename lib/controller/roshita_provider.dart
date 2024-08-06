//import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderRoshitaDetails extends ChangeNotifier {
  String doctorName = '......';
  String doctorSpecialty = '';
  String patientName = '';
  String age = '0';
  String dateTime = 'dd/mm/yy';
  String jobTime = '';
  String teleNumber = '010999999999';

  editDoctorName(
      {required String doctorName,
      required String doctorSpecialty,
      required String patientName,
      required String age,
      required String jobTime,
      required String teleNumber}) {
    this.doctorName = doctorName;
    this.doctorSpecialty = doctorSpecialty;
    this.patientName = patientName;
    this.age = age;
    this.jobTime = jobTime;
    this.teleNumber = teleNumber;
    notifyListeners();
    print('docName:${this.doctorName}');
  }

  editDateTime() {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    dateTime = '$year/$month/$day';
  }
}
