import 'network_utils.dart';

Future getUserList() async {
  return await handleResponse(
      await buildHttpResponse('users?page=2', method: HttpMethod.GET));
}
