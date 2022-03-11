import 'package:flutter/material.dart';
import 'package:http_request_task/model/empList_model.dart';
import 'package:http_request_task/model/emp_one_model.dart';
import 'package:http_request_task/model/employee_model.dart';
import 'package:http_request_task/services/http_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id ="home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late EmpList _empList;

  _apiEmployeeList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
      print(response),
    });
  }

  // _apiEmpCreate(Employee emp){
  //   Network.POST(Network.API_CREATE, Network.paramsCreate(emp)).then((response) => {
  //     _showResponse(response!),
  //     print(response)
  //   });
  // }

  _apiEmpUpdate(Employee emp){
    Network.PUT(Network.API_UPDATE+emp.employee_id.toString(), Network.paramsUpdate(emp)).then((response) => {
      _showResponse(response!),
      print(response),
    });
  }

  _apiEmpDelete(Employee emp){
    Network.DEL(Network.API_DELETE+emp.employee_id.toString(), Network.paramsEmpty()).then((response) => {
      // _showResponse(response!),
      print(response),
    });
  }

  _showResponse(String response){
    EmpList empList = Network.parseEmpList(response);
    setState(() {
      _empList = empList;
    });
    // print(_empOne.data.toString());
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmployeeList();


    var emp = Employee(employee_id: 1, employee_name: "Zakariya", employee_age: 23, employee_salary: 12000, employee_image: "");
    // _apiEmpCreate(emp);
    // _apiEmpUpdate(emp);
    // _apiEmpDelete(emp);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(_empList.data!.last.employee_name.toString()),
      ),
    );
  }
}
