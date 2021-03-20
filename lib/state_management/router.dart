import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_hospital_app/models/user.dart';
import 'package:side_hospital_app/services/auth_service.dart';
import 'package:side_hospital_app/state_management/wrapper.dart';

class Routers extends StatefulWidget {
  @override
  _RoutersState createState() => _RoutersState();
}

class _RoutersState extends State<Routers> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthenticatedUser>.value(
        value: AuthService().user, child: Wrapper());
  }
}
