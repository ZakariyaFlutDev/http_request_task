import 'package:http_request_task/model/employee_model.dart';

class EmpOne{

  String? status;
  String? message;
  Employee? data;

  EmpOne({required this.status, required this.message, required this.data});

  EmpOne.fromJson(Map<String, dynamic> json)
    :  status = json['status'],
       message = json['message'],
       data = Employee.fromJson(json['data']);

  Map<String,dynamic> toJson() => {
    "status" : status,
    "message" : message,
    "data" : data!.toJson(),
  };

}