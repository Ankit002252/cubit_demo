import 'package:connectivity_plus/connectivity_plus.dart';

String mBaseUrl = 'https://reqres.in/api/';
String baseurl2="https://api.imgflip.com/";
Future<bool> isNetworkAvailable() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}