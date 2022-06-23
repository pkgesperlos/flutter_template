import 'dart:async';

import 'package:http/http.dart';

import '../api_provider.dart';



class RepositoryLoginBloc<T> {
  final apiProvider = ApiProvider<T>();


  Future fetchLogin(String apiAddress, Map<String, String> body,
      Function(String data) returnType, Function(Response)? fullResponse) =>
      apiProvider.fetchDataPOST(apiAddress, body, returnType, fullResponse);


  Future fetchAuthenticate(String apiAddress, Map<String, String> body,
      Function(String data) returnType, Function(Response)? fullResponse) =>
      apiProvider.fetchDataPOSTAuth(apiAddress, body, returnType, fullResponse);



}
