import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Network {
  final Uri url;
  Network(this.url);

  // All the network request with FuelTrans Map<String, dynamic> work
  Future fuelTransPostWebService() async {
    try {
      final response = await http.get(url);


      log(response.body.toString().toString());

      if (response.body.isNotEmpty) {
        return _returnResponse(response);
      } else {
        return emptyNoInternetResponse;
      }
    } on SocketException {
      return errorNoInternetResponse;
    }
  }

  Future hosWebService(Map<String, dynamic> work) async {
    debugPrint('URL: $url');
    debugPrint('Request: $work');
    final response = await http.get(url);
    debugPrint('Response Code: ${response.statusCode}');
    debugPrint('Response : ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return error500Response;
    }
  }

  Future hosGetWebService() async {
    final response = await http.get(url);

    debugPrint('Response Code: ${response.statusCode}');
    debugPrint('Response : ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return error500Response;
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        return error400Response;
      case 401:
      case 403:
        return error401Response;
      case 500:
      default:
        return error500Response;
    }
  }

  debugPrintResponse(int code, String response) {
    debugPrint('Response Code: $code');
    debugPrint('Response: $response');
  }

  final headerParameter = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  final error500Response = {
    'status': false,
    'title': 'Internal Error',
    'message':
    'The server encountered an unexpected condition which prevented it from fulfilling the request.'
  };

  final error401Response = {
    'status': false,
    'title': 'Unauthorized',
    'message':
    'The parameter to this message gives a specification of authorization schemes which are acceptable. The client should retry the request with a suitable Authorization header.'
  };

  final error400Response = {
    'status': false,
    'title': 'Bad request',
    'message':
    'The request had bad syntax or was inherently impossible to be satisfied.'
  };

  final errorNoInternetResponse = {
    'status': false,
    'title': 'No Internet',
    'message': 'There is no Internet Connection'
  };

  final emptyNoInternetResponse = {
    'status': false,
    'title': 'Internal Error',
    'message': 'The server encountered an unexpected response'
  };
}
