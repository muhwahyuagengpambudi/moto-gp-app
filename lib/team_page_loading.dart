import 'package:flutter/material.dart';
import 'package:moto_gp_app/shimer/shimer_widget.dart';

class TeamsPageLoading extends StatefulWidget {
  TeamsPageLoading({Key? key}) : super(key: key);

  @override
  State<TeamsPageLoading> createState() => _TeamsPageLoadingState();
}

class _TeamsPageLoadingState extends State<TeamsPageLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 45, right: 45, bottom: 45),
          child: ShimmerWidget(height: 260, width: 310),
        );
      },
    );
  }
}
