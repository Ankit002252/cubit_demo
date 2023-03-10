import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

Map<String, String> buildHeaderTokens() {
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    HttpHeaders.cacheControlHeader: 'no-cache',
    HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
  };

  log(jsonEncode(header));
  return header;
}

Uri buildBaseUrl(String endPoint, bool memes) {
  Uri url = Uri.parse(endPoint);
  String? newurl;
  if (memes == true) {
    newurl = baseurl2;
  } else {
    newurl = mBaseUrl;
  }

  if (!endPoint.startsWith('http')) url = Uri.parse('$newurl$endPoint');

  log('URL: ${url.toString()}');

  return url;
}

Future<Response> buildHttpResponse(String endPoint,
    {HttpMethod method = HttpMethod.GET, Map? request, bool? burl}) async {
  if (await isNetworkAvailable()) {
    // var headers = buildHeaderTokens();
    Uri url = buildBaseUrl(endPoint, burl!);

    Response response;

    if (method == HttpMethod.POST) {
      log('Request: $request');

      response = await http.post(url);
    } else if (method == HttpMethod.DELETE) {
      response = await delete(url);
    } else if (method == HttpMethod.PUT) {
      response = await put(url, body: jsonEncode(request));
    } else {
      response = await get(url);
    }

    log('Response ($method): ${response.statusCode} ${response.body}');

    return response;
  } else {
    throw "errorInternetNotAvailable";
  }
}

Future handleResponse(Response response) async {
  if (!await isNetworkAvailable()) {
    throw "errorInternetNotAvailable";
  }
  if (response.statusCode == 401) {
    throw TokenException('Token Expired');
  }

  if (response.statusCode == 200) {
    print("handleResponse------${jsonDecode(response.body)}");
    return response.body;
  } else {
    try {
      var body = jsonDecode(response.body);
      throw "msgmsg";
    } on Exception catch (e) {
      log(e.toString());
      throw "errorSomethingWentWrong";
    }
  }
}

//region Common
enum HttpMethod { GET, POST, DELETE, PUT }

class TokenException implements Exception {
  final String message;

  const TokenException([this.message = ""]);

  String toString() => "FormatException: $message";
}
//endregion

Future<MultipartRequest> getMultiPartRequest(String endPoint) async {
  log('Url $mBaseUrl$endPoint');
  return MultipartRequest('POST', Uri.parse('$mBaseUrl$endPoint'));
}
