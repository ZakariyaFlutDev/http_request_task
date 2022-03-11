import 'package:http_request_task/model/user_model.dart';

class EmpCreate{
  String? status;
  String? message;
  User ? data;

  EmpCreate({required this.status, required this.message, required this.data});

  EmpCreate.fromJson(Map<String,dynamic> json)
    : status = json['status'],
      message = json['message'],
      data = User.fromJson(json['data']);

  Map<String,dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data!.toJson()
  };
}