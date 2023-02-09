import 'package:flutter/material.dart';
import 'package:moto_gp_app/shimer/shimer_widget.dart';

class RiderPageLoading extends StatefulWidget {
  RiderPageLoading({Key? key}) : super(key: key);

  @override
  State<RiderPageLoading> createState() => _RiderPageLoadingState();
}

class _RiderPageLoadingState extends State<RiderPageLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            child: ShimmerWidget(height: 211, width: 310),
          ),
        );
      },
    );
  }
}
