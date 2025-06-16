import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_provider/utils/print_value.dart';
import 'package:weather_app_with_provider/utils/toast_message.dart';

class HttpHelper {
  // GET API METHOD
  Future<dynamic> getAPI({
    required String url,
    bool isRequireAuthorization = false,
  }) async {
    Map<String, String> apiHeaders = {"Content-Type": "application/json"};

    if (isRequireAuthorization) {
      apiHeaders = {
        "content-type": "application/json",
        "Authorization": 'Bearer "userBearerToken"',
      };
    }
    try {
      final response = await http.get(Uri.parse(url), headers: apiHeaders);
      printValue(url, tag: "API GET URL:");
      printValue(apiHeaders, tag: "API HEADERS:");
      printValue(response.body, tag: "API GET RESPONSE:");
      return _returnResponse(response: response);
    } on SocketException {
      return null;
    }
  }

  // POST API METHOD
  Future<dynamic> postAPI({
    required String url,
    Object? body,
    bool isRecuredAuthorization = false,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (isRecuredAuthorization) {
      headers = {
        "content-type": "application/json",
        "Authorization": 'Bearer "userBearerToken"',
      };
    }
    try {
      http.Response response;
      if (body == null) {
        response = await http.post(Uri.parse(url), headers: headers);
      } else {
        response = await http.post(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: headers,
        );
      }
      printValue(url, tag: "API POST URL:");
      printValue(body, tag: "API POST BODY:");
      printValue(headers, tag: "API HEADERS:");
      printValue(response.body, tag: "API POST RESPONSE:");
      return _returnResponse(response: response);
    } on SocketException {
      return null;
    }
  }

  // PUT API METHOD
  Future<dynamic> putAPI({
    required String url,
    Object? body,
    bool isRecuredAuthorization = false,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (isRecuredAuthorization) {
      headers = {
        "content-type": "application/json",
        "Authorization": 'Bearer "userBearerToken"',
      };
    }
    try {
      http.Response response;
      if (body == null) {
        response = await http.put(Uri.parse(url), headers: headers);
      } else {
        response = await http.put(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: headers,
        );
      }
      printValue(url, tag: "API PUT URL:");
      printValue(body, tag: "API PUT BODY:");
      printValue(headers, tag: "API HEADERS:");
      printValue(response.body, tag: "API PUT RESPONSE:");
      return _returnResponse(response: response);
    } on SocketException {
      return null;
    }
  }

  // DELETE API METHOD
  Future<dynamic> deleteAPI({
    required String url,
    Object? body,
    bool isRecuredAuthorization = false,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (isRecuredAuthorization) {
      headers = {
        "content-type": "application/json",
        "Authorization": 'Bearer "userBearerToken"',
      };
    }
    try {
      http.Response response;
      if (body == null) {
        response = await http.delete(Uri.parse(url), headers: headers);
      } else {
        response = await http.delete(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: headers,
        );
      }
      printValue(url, tag: "API DELETE URL:");
      printValue(body, tag: "API DELETE BODY:");
      printValue(headers, tag: "API HEADERS:");
      printValue(response.body, tag: "API DELETE RESPONSE:");
      return _returnResponse(response: response);
    } on SocketException {
      return null;
    }
  }

  dynamic _returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        var responseJson = json.decode(response.body);
        if (responseJson.containsKey("message")) {
          toastMessage(responseJson["message"].toString());
        }
        throw Exception("Error with Status code 400");
      case 401:
        throw Exception("Unauthorized");
      case 500:
        throw Exception("Error with Status code 500");
      default:
        throw Exception("Error with Status code ${response.statusCode}");
    }
  }
}
