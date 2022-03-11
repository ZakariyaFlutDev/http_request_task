import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_request_task/model/empCreate_model.dart';
import 'package:http_request_task/model/empDelete_model.dart';
import 'package:http_request_task/model/empList_model.dart';
import 'package:http_request_task/model/empUpdate_model.dart';
import 'package:http_request_task/model/emp_one_model.dart';
import 'package:http_request_task/model/employee_model.dart';
import 'package:http_request_task/model/user_model.dart';

class Network{

  static String BASE = "dummy.restapiexample.com";

  static Map<String,String> headers = {'Content-type': 'application/json; charset=UTF-8',};

  static String API_LIST = "/api/v1/employees";
  static String API_EMP = "/api/v1/employee/";//{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/";//{id}
  static String API_DELETE = "/api/v1/delete/";//{id}

  static Future<String?> GET(String api, Map<String, String> params) async{
    var url = Uri.http(BASE, api, params);
    var response = await get(url, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> GET_ONE(String api, Map<String, String> params) async{
    var url = Uri.http(BASE, api, params);
    var response = await get(url, headers: headers);
    if(response.statusCode ==200 || response.statusCode ==201){
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String,String> params) async{
    var url = Uri.http(BASE,api);
    var response = await post(url,body: jsonEncode(params), headers: headers);
    if(response.statusCode ==200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String,String> params) async{
    var url = Uri.http(BASE, api);
    var response = await put(url, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String,String> params) async{
    var url = Uri.https(BASE, api, params);
    var response = await delete(url, headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = new Map();
    return params;
  }

  static Map<String,String> paramsCreate(User user){
    Map<String,String> params = new Map();
    params.addAll({
      'name' : user.name.toString(),
      'age' : user.age.toString(),
      'salary' : user.salary.toString(),
    });
    return params;
  }

  static Map<String,String> paramsUpdate(Employee emp){
    Map<String,String> params = new Map();
    params.addAll({
      'id' : emp.employee_id.toString(),
      'name' : emp.employee_name.toString(),
      'age' : emp.employee_age.toString(),
      'salary' : emp.employee_salary.toString(),
      'image' : emp.employee_image.toString(),
    });
    return params;
  }

  static Map<String,String> paramsUpdateTask(Employee emp){
    Map<String,String> params = new Map();

    return params;
  }

  /* Http Parse */

  static EmpList parseEmpList(String response){
    dynamic json = jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String response){
    dynamic json = jsonDecode(response);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpCreate parseEmpCreate(String response){
    dynamic json = jsonDecode(response);
    var data = EmpCreate.fromJson(json);
    return data;
  }

  static EmpUpdate parseEmpUpdate(String response){
    dynamic json = jsonDecode(response);
    var data = EmpUpdate.fromJson(json);
    return data;
  }

  static EmpDelete parseEmpDelete(String response){
    dynamic json = jsonDecode(response);
    var data = EmpDelete.fromJson(json);
    return data;
  }


}