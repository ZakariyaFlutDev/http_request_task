import 'package:flutter/material.dart';
import 'package:http_request_task/model/emp_one_model.dart';
import 'package:http_request_task/model/employee_model.dart';
import 'package:http_request_task/services/http_service.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const String id = "detail_page";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late EmpOne _empOne;

  _apiEmpOne(int id){
    Network.GET_ONE(Network.API_EMP+id.toString(), Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
      // print(response)
    });
  }

  _showResponse(String response){
    EmpOne empOne = Network.parseEmpOne(response);
    setState(() {
      _empOne = empOne;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpOne(1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_empOne.data!.employee_name.toString() + "("+_empOne.data!.employee_age.toString() + ")", style: TextStyle(fontSize: 30),),
            Text(_empOne.data!.employee_salary.toString()),
          ],
        ),
      ),
    );
  }
}
