import 'package:http_request_task/model/employee_model.dart';

class EmpUpdate{
  String? status;
  String? message;
  List data;

  EmpUpdate({this.status, this.message, required this.data});

  EmpUpdate.fromJson(Map<String,dynamic> json)
    : status = json['status'],
      message = json['message'],
      data = json['data'];

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data,
  };
}