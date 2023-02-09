import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moto_gp_app/rider_page_loading.dart';
import 'package:moto_gp_app/team_page_loading.dart';
import 'controller.dart';
import 'model/team_model.dart';

class Team extends StatelessWidget {
  RiderController teamController = Get.put(RiderController());

  @override
  void dependencies() {
    Get.lazyPut<RiderController>(
      () => RiderController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() => teamController.isDataLoading.value
            ? TeamsPageLoading()
            : ListView.builder(
                itemCount: teamController.TeamModels?.teams?.length ?? 0,
                itemBuilder: (context, index) {
                  Color fromHex(String hexString) {
                    final buffer = StringBuffer();
                    if (hexString.length == 6 || hexString.length == 7)
                      buffer.write('ff');
                    buffer.write(hexString.replaceFirst('#', ''));
                    return Color(int.parse(buffer.toString(), radix: 16));
                  }

                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 45, right: 45, bottom: 45),
                    child: Container(
                      color: Color.fromRGBO(23, 28, 33, 1),
                      height: 260,
                      width: 310,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.network(
                              "http://rizalkalam.fun/images/" +
                                  teamController
                                      .TeamModels!.teams![index].imgBike!,
                              fit: BoxFit.cover,
                              height: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: fromHex(teamController
                                  .TeamModels!.teams![index].mainColor!),
                              height: double.maxFinite,
                              width: 7,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 161,
                              width: double.maxFinite,
                              padding: EdgeInsets.only(left: 20, bottom: 24),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0),
                                    Colors.black.withOpacity(1)
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    teamController
                                        .TeamModels!.teams![index].name!,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "haha",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Container(
                                          width: 1.5,
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "haha",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )));
  }
}
