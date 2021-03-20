import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_hospital_app/bottom_tab/test/test_card.dart';
import 'package:side_hospital_app/change_notifier/test_provider.dart';
import 'package:side_hospital_app/constraints/custom_colors.dart';
import 'package:side_hospital_app/models/test.dart';
import 'package:side_hospital_app/screens/loader.dart';
import 'package:side_hospital_app/services/test_service.dart';

class TestList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestListState();
  }
}

class _TestListState extends State<TestList> {
  final TestService testService = TestService();
  int count;

  @override
  Widget build(BuildContext context) {
    CustomColors _colors = CustomColors();
    return Scaffold(
      backgroundColor: _colors.colorTheme,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
            "Tests",
            style: TextStyle(
              fontSize: 22.0,
              color: _colors.white,
            ),
          ),
          backgroundColor: _colors.colorTheme,
          centerTitle: true,
          bottomOpacity: 0.0,
          elevation: 0.0),
      resizeToAvoidBottomPadding: false,
      body: Consumer<TestProvider>(builder: (context, testProvider, child) {
        List<Test> test = testProvider.test;
        return test.isEmpty
            ? Center(
                child: Text("No Tests available",
                    style: TextStyle(
                        color: _colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              )
            : ListView.builder(
                itemCount: test.length,
                itemBuilder: (context, i) {
                  return TestCard(test: test[i]);
                });
      }),
    );
  }
}
