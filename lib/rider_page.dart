import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/rider_model.dart';

class Rider extends StatelessWidget {
  RiderController riderController = Get.put(RiderController());

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((event) {
  //     if (event.notification != null) {
  //       //ada notifikasi yang masuk
  //       print(event.notification!.title);
  //     }
  //   });
  // }

  @override
  void dependencies() {
    Get.lazyPut<RiderController>(
      () => RiderController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() => riderController.isDataLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            :
            // : ListView.builder(
            //     itemCount: riderController._riderModel?.riders.length ?? 0,
            //     itemBuilder: ((context, index) {
            //       return ListTile(
            //         leading: Image.network("http://rizalkalam.my.id/images/" +
            //             riderController._riderModel!.riders[index].imgRider!),
            //         title: Text(
            //           riderController._riderModel!.riders[index].name!,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         subtitle: Text(
            //             riderController._riderModel!.riders[index].teamName!,
            //             style: TextStyle(color: Colors.white)),
            //       );
            //     }),
            //   )),

            ListView.builder(
                itemCount: riderController._riderModel?.riders.length ?? 0,
                itemBuilder: (context, index) {
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
                                      color: Colors.blue.withOpacity(0.8),
                                      height: double.maxFinite,
                                      width: 7,
                                    ),
                                    Container(
                                      height: double.maxFinite,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          gradient: new LinearGradient(
                                              colors: [
                                            Colors.blue,
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
                                Image.network(
                                    "http://rizalkalam.my.id/images/" +
                                        riderController._riderModel!
                                            .riders[index].imgFlag!),
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
                            Container(
                              padding: const EdgeInsets.only(left: 12, top: 2),
                              alignment: Alignment.topLeft,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                    riderController
                                        ._riderModel!.riders[index].iconRider!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 30,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Image.network(
                                "http://rizalkalam.my.id/images/" +
                                    riderController
                                        ._riderModel!.riders[index].imgRider!,
                                height: 211,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                riderController
                                    ._riderModel!.riders[index].teamName!,
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                  riderController
                                      ._riderModel!.riders[index].name!,
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

class RiderController extends GetxController {
  RiderModel? _riderModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response =
          await http.get(Uri.parse("http://rizalkalam.my.id/api/rider"));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        _riderModel = RiderModel.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
