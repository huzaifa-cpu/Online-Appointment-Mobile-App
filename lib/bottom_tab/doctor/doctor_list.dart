import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_hospital_app/bottom_tab/doctor/doctor_card.dart';
import 'package:side_hospital_app/change_notifier/doctor_provider.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'package:side_hospital_app/constraints/custom_colors.dart';
import 'package:side_hospital_app/models/doctor.dart';
import 'package:side_hospital_app/screens/loader.dart';
import 'package:side_hospital_app/services/doctor_service.dart';

class DoctorList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoctorListScreenState();
  }
}

class DoctorListScreenState extends State<DoctorList> {
  final DoctorService doctorService = DoctorService();
  @override
  Widget build(BuildContext context) {
    CustomColors _colors = CustomColors();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Doctors",
            style: TextStyle(
              fontSize: 22.0,
              color: _colors.white,
            ),
          ),
          backgroundColor: _colors.colorTheme,
          centerTitle: true,
          bottomOpacity: 0.0,
          elevation: 0.0),
      backgroundColor: _colors.colorTheme,
      resizeToAvoidBottomInset: false,
      body: Consumer<DoctorProvider>(builder: (context, doctorProvider, child) {
        List<Doctor> doctor = doctorProvider.doctor;
        return doctor.isEmpty
            ? Center(
                child: Text("No Doctors available",
                    style: TextStyle(
                        color: _colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              )
            : ListView.builder(
                itemCount: doctor.length,
                itemBuilder: (BuildContext context, int i) {
                  return DoctorCard(doctor: doctor[i]);
                });
      }),
    );
  }
}
