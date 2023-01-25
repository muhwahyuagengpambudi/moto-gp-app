import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/rider_model.dart';

class Rider extends StatelessWidget {
  RiderController riderController = Get.put(RiderController());

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
          : ListView.builder(
              itemCount: riderController._riderModel?.riders.length ?? 0,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: Image.network("http://rizalkalam.my.id/images/" +
                      riderController._riderModel!.riders[index].imgRider!),
                  title: Text(riderController._riderModel!.riders[index].name!),
                  subtitle: Text(
                      riderController._riderModel!.riders[index].teamName!),
                );
              }),
            )),
    );
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
