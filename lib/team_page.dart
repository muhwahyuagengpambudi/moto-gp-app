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
            ? RiderPageLoading()
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
                        const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50)),
                      child: Container(
                        color: Color.fromRGBO(23, 28, 33, 1),
                        height: 211,
                        width: 310,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      color: fromHex(teamController.TeamModels!
                                          .teams![index].mainColor!),
                                      height: double.maxFinite,
                                      width: 7,
                                    ),
                                    Container(
                                      height: double.maxFinite,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          gradient: new LinearGradient(
                                              colors: [
                                            fromHex(teamController.TeamModels!
                                                    .teams![index].mainColor!)
                                                .withOpacity(0.8),
                                            Colors.black,
                                          ],
                                              stops: [
                                            0.0,
                                            1.2
                                          ],
                                              begin:
                                                  FractionalOffset.centerLeft,
                                              end: FractionalOffset.centerRight,
                                              tileMode: TileMode.repeated)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.1)
                              ])),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Image.network(
                                "http://rizalkalam.fun/images/" +
                                    teamController
                                        .TeamModels!.teams![index].imgBike!,
                                height: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                  teamController
                                      .TeamModels!.teams![index].name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5, // shadow blur
                                        color: Colors.black, // shadow color
                                        offset: Offset(2,
                                            2), // how much shadow will be shown
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )));
  }
}
