import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model/rider_model.dart';

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
      http.Response response = await http.get(
          Uri.parse("https://rizalkalam-my-id.preview-domain.com/api/rider"));
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
