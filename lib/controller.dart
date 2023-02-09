import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'model/rider_model.dart';
import 'model/team_model.dart';

class RiderController extends GetxController {
  RiderModel? RiderModels;
  TeamModel? TeamModels;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  getApi() async {
    try {
      isDataLoading(true);
      http.Response responseRider =
          await http.get(Uri.parse("http://rizalkalam.fun/api/rider"));

      http.Response responseTeam =
          await http.get(Uri.parse("http://rizalkalam.fun/api/team"));

      if (responseRider.statusCode == 200 || responseTeam.statusCode == 200) {
        ///data successfully
        var resultRider = jsonDecode(responseRider.body);
        var resultTeam = jsonDecode(responseTeam.body);

        RiderModels = RiderModel.fromJson(resultRider);
        TeamModels = TeamModel.fromJson(resultTeam);
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
