import 'dart:async';
import 'dart:convert';



import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';
import '../resources/bloc_check.dart';
import '../resources/repository/repository_login_bloc.dart';
import '../resources/save.dart';


class LogInBloc<T> {
  RepositoryLoginBloc _repository = RepositoryLoginBloc<T>();

  PublishSubject<T> _publishSubject = PublishSubject<T>();

  Stream<T> get actions => _publishSubject.stream;

  Future fetchLogin({
    required String apiAddress,
    required Map<String, String> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await _repository.fetchLogin(apiAddress, body, (res) {

      if (BlocCheck.hasError(res) == "null") {

        if (directResult != null) directResult(res);
        return UserModel.fromJson(json.decode(res));
      } else {
        _publishSubject.addError(BlocCheck.hasError(res));
        return null;
      }
    }, fullResponse);

    if (model != null) {
      _publishSubject.add(model);
    }
    return model;
  }


  Future fetchAuthenticate({
    required String apiAddress,
    required Map<String, String> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await _repository.fetchAuthenticate(apiAddress, body, (res) {

      if (BlocCheck.hasError(res) == "null") {

        if (directResult != null) directResult(res);
        return UserModel.fromJson(json.decode(res));
      } else {
        _publishSubject.addError(BlocCheck.hasError(res));
        return null;
      }
    }, fullResponse);

    if (model != null) {
      _publishSubject.add(model);
    }
    return model;
  }





}



final logInBlocLogin = LogInBloc<UserModel>();
final logInBlocAuthenticate = LogInBloc<UserModel>();

