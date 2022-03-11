import 'package:flutter/material.dart';
import 'package:http_request_task/model/empDelete_model.dart';
import 'package:http_request_task/model/employee_model.dart';
import 'package:http_request_task/services/http_service.dart';
class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  static const String id = "delete_page";

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  late EmpDelete _empDelete;

  _apiEmpDelete(Employee emp){
    Network.DEL(Network.API_DELETE+emp.employee_id.toString(), Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
      print(response),
    });
  }

  _showResponse(String response){
    EmpDelete empDelete = Network.parseEmpDelete(response);
    setState(() {
      _empDelete = empDelete;
    });
    print(_empDelete.data);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var emp = Employee(employee_id: 1, employee_name: "Zakariya", employee_age: 23, employee_salary: 12000, employee_image: "");
     _apiEmpDelete(emp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Status: " + _empDelete.status.toString()),
            Text("Data: " + _empDelete.data.toString()),
            Text("Message: " + _empDelete.message.toString())
          ],
        ),
      ),
    );
  }
}
