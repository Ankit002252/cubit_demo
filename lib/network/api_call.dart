import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


Future<bool> isNetworkAvailable() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

enum HttpMethod { GET, POST, DELETE, PUT }


/// for Api method

class ApiCall {
  static const String mBaseUrl = "";

  Map<String, String> buildHeaderTokens() {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };


    log(jsonEncode(header));
    return header;
  }

  Uri buildBaseUrl(String endPoint) {
    Uri url = Uri.parse(endPoint);
    if (!endPoint.startsWith('http')) url = Uri.parse('$mBaseUrl$endPoint');

    logger.d('URL: ${url.toString()}');

    return url;
  }

  Future<Response> buildHttpResponse(String endPoint,
      {HttpMethod method = HttpMethod.GET, Map? request}) async {
    if (await isNetworkAvailable()) {
      var headers = buildHeaderTokens();
      Uri url = buildBaseUrl(endPoint);

      Response response;

      if (method == HttpMethod.POST) {
        log('Request: $request');

        response =
        await http.post(url, body: jsonEncode(request), headers: headers);
      } else if (method == HttpMethod.DELETE) {
        response = await delete(url, headers: headers);
      } else if (method == HttpMethod.PUT) {
        response = await put(url, body: jsonEncode(request), headers: headers);
      } else {
        response = await get(url, headers: headers);
      }

      log('Response ($method): ${response.statusCode} ${response.body}');

      return response;
    } else {
      throw "errorInternetNotAvailable";
    }
  }


