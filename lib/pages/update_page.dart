import 'package:flutter/material.dart';
import 'package:http_request_task/model/empUpdate_model.dart';
import 'package:http_request_task/model/employee_model.dart';
import 'package:http_request_task/services/http_service.dart';
class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  static const String id ="update_page";

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  late EmpUpdate _empUpdate;

  _apiEmpUpdate(Employee employee){
    Network.PUT(Network.API_UPDATE+employee.employee_id.toString(), Network.paramsUpdateTask(employee)).then((response) => {
      _showResponse(response!),
      print(response),
    });
  }

  _showResponse(String response){
    EmpUpdate empUpdate = Network.parseEmpUpdate(response);

    setState(() {
      _empUpdate = empUpdate;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var employee = Employee(employee_id: 1, employee_name: "Update Name", employee_age: 22, employee_salary: 25000, employee_image: "");
    _apiEmpUpdate(employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Status: " + _empUpdate.status.toString()),
            Text("Data: " + _empUpdate.data.toString()),
            Text("Message: " + _empUpdate.message.toString()),
          ],
        )
      ),
    );
  }

}
