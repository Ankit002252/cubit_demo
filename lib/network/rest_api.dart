import 'network_utils.dart';

Future getUserList() async {
  return await handleResponse(
      await buildHttpResponse('users?page=2', method: HttpMethod.GET,burl: false));
}

Future getMemesList() async {
  print("Memesssssss----");
  return await handleResponse(
      await buildHttpResponse('get_memes', method: HttpMethod.GET,burl: true));
}
