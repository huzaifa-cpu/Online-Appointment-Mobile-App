import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:side_hospital_app/authentication/login_screen.dart';
import 'package:side_hospital_app/bottom_tab/menu.dart';
import 'package:side_hospital_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future setUserId(AuthenticatedUser user) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userUid", user.uid);
    }

    final user = Provider.of<AuthenticatedUser>(context);

    if (user == null) {
      return LoginScreen();
    } else {
      setUserId(user);
      return Menu();
    }
  }
}
