import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_hospital_app/change_notifier/appointment_provider.dart';
import 'package:side_hospital_app/change_notifier/doctor_provider.dart';
import 'package:side_hospital_app/change_notifier/profile_provider.dart';
import 'package:side_hospital_app/change_notifier/test_provider.dart';
import 'package:side_hospital_app/constraints/custom_colors.dart';
import 'package:side_hospital_app/models/doctor.dart';
import 'package:side_hospital_app/screens/splash.screen.dart';
import 'package:side_hospital_app/services/doctor_service.dart';
import 'package:side_hospital_app/state_management/router.dart';

import 'change_notifier/patient_test_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));

  final DoctorService doctorService = DoctorService();
  List<Doctor> doctor = await doctorService.getDoctorList();

  runApp(MyApp(
    doctor: doctor,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({this.doctor});
  List<Doctor> doctor;
  CustomColors _colors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider()),
          ChangeNotifierProvider<DoctorProvider>(
              create: (context) => DoctorProvider()),
          ChangeNotifierProvider<TestProvider>(
              create: (context) => TestProvider()),
          ChangeNotifierProvider<AppointmentProvider>(
              create: (context) => AppointmentProvider()),
          ChangeNotifierProvider<PatientTestProvider>(
              create: (context) => PatientTestProvider())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Appointing",
            theme: ThemeData(
              accentColor: _colors.colorTheme,
            ),
            home: Consumer<DoctorProvider>(
                builder: (context, doctorProvider, child) {
              doctorProvider.doctor = doctor;
              return Routers();
            })));
  }
}
