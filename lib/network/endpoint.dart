import 'dart:convert';

import '../network/network.dart';
import 'package:http/http.dart' as http;

Uri baseFTURL = Uri.https('catfact.ninja', 'fact');

class HOSAPI {
  // Future<dynamic> getProductItemList() async {
  //   final network = Network(baseFTURL);
  //   final results = await network.hosGetWebService() as Map<String, dynamic>;
  //   return results;
  // }
  Future GetUserData() async
  {

    final network = Network(baseFTURL);
    final results = await network.fuelTransPostWebService();
   // final results = await http.get();
   //  var response = await http.get(Uri.https('catfact.ninja', 'fact'));
   //        var jsonData =jsonDecode(response.body);
     print(results);
    return  results;
  }

}