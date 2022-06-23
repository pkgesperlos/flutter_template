import 'package:flutter_template/models/user_model.dart';

class  WorkbenchModel{

  var id, createdAt, updatedAt,description, time, date, percentage,count;
  UserModel? userModel = UserModel();

  WorkbenchModel.fromJson(dynamic json) {



    id = json['_id'].toString();
    time = json['time'].toString();
    date = json['date'].toString();
    description = json['description'].toString();
    percentage = json['percentage'].toString();
    count = json['count'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    userModel = json['user'] == null? null:UserModel.fromJson(json['user']);
  }

}





class  WorkbenchModelList {

  List<WorkbenchModel> list = [];

  WorkbenchModelList.fromJson(res){

    List data = res;

    for( int i = 0 ; i<data.length ; i++){

      print("sadsad");
      print(data[i]);
      WorkbenchModel _result =  WorkbenchModel.fromJson(data[i]);

      list.add(_result);
    }


  }
}