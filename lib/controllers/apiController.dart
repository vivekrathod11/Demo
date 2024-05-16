import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nike/ApiService/apiService.dart';
import 'package:nike/responsePojo/shoeResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nike/utils/constants.dart';






class ApiController extends GetxController {


  late ApiService apiService;
  late Dio dio;
  late ShoeResponses shoeResponses;


  //variables
  var data = [].obs;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  //api call

  Future<void> fetchShoes() async {
    // 'https://shoes-collections.p.rapidapi.com/shoes';
    const url = Constants.BASE_URL + Constants.SHOES;
    const headers = {
      'X-RapidAPI-Key': Constants.APIKEY,
      'X-RapidAPI-Host': Constants.HOST,
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        //fetching on 3 data but total items are 30
        data.value = responseData.take(3).toList();
        print(data.value);
      } else {
        var error = 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      var errorCatch = 'Error: $e';
    }
  }
}