import 'package:flutter/material.dart';
import 'package:http_request_task/model/empCreate_model.dart';
import 'package:http_request_task/model/user_model.dart';
import 'package:http_request_task/services/http_service.dart';
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  static const String id = "create_page";

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  late EmpCreate _empCreate;

  _apiEmpCreate(User user){
    Network.POST(Network.API_CREATE, Network.paramsCreate(user)).then((response) => {
      _showResponse(response!),
      print(response)
    });
  }

  _showResponse(String response){
    EmpCreate empCreate = Network.parseEmpCreate(response);
    setState(() {
      _empCreate = empCreate;
    });
    print(_empCreate.data!.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var user = User(id: 1, name: "name", age: "12", salary: "12000");
    _apiEmpCreate(user);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_empCreate.data!.salary.toString()),
      ),
    );
  }
}
