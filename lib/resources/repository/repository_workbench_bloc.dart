import 'dart:async';

import 'package:http/http.dart';

import '../api_provider.dart';



class RepositoryWorkbenchBloc<T> {
  final apiProvider = ApiProvider<T>();



  Future fetchShowGroupByDate(String apiAddress, Map<String, String> body,
      Function(String data) returnType, Function(Response)? fullResponse) =>
      apiProvider.fetchDataPOSTAuth(apiAddress, body, returnType, fullResponse);



  Future fetchShowDetail(String apiAddress, Map<String, String> body,
      Function(String data) returnType, Function(Response)? fullResponse) =>
      apiProvider.fetchDataPOSTAuth(apiAddress, body, returnType, fullResponse);



  Future fetchStore(String apiAddress, Map<String, String> body,
      Function(String data) returnType, Function(Response)? fullResponse) =>
      apiProvider.fetchDataPOSTAuth(apiAddress, body, returnType, fullResponse);



}
