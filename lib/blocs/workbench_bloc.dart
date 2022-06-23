import 'dart:async';
import 'dart:convert';

import 'package:flutter_template/models/workbensh_model.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';
import '../resources/bloc_check.dart';
import '../resources/repository/repository_workbench_bloc.dart';


class WorkbenchBloc<T> {
  RepositoryWorkbenchBloc _repository = RepositoryWorkbenchBloc<T>();

  PublishSubject<T> _publishSubject = PublishSubject<T>();

  Stream<T> get actions => _publishSubject.stream;




  Future fetchShowGroupByDate({
    required String apiAddress,
    required Map<String, String> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await _repository.fetchShowGroupByDate(apiAddress, body, (res) {

      if (BlocCheck.hasError(res) == "null") {

        if (directResult != null) directResult(res);
        return WorkbenchModelList.fromJson(json.decode(res));
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



  Future fetchShowDetail({
    required String apiAddress,
    required Map<String, String> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await _repository.fetchShowDetail(apiAddress, body, (res) {

      if (BlocCheck.hasError(res) == "null") {

        if (directResult != null) directResult(res);
        return WorkbenchModelList.fromJson(json.decode(res));
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




  Future fetchStore({
    required String apiAddress,
    required Map<String, String> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await _repository.fetchStore(apiAddress, body, (res) {

      if (BlocCheck.hasError(res) == "null") {

        if (directResult != null) directResult(res);
        return res.toString();
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

final workbenchBlocShowGroupByDate = WorkbenchBloc<WorkbenchModelList>();
final workbenchBlocShowDetail = WorkbenchBloc<WorkbenchModelList>();
final workbenchBlocStore = WorkbenchBloc<dynamic>();

