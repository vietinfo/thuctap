import 'dart:convert';
import 'thirdsrceen.dart';
import 'package:flutter/material.dart';
import '../../repositories/Services.dart';
import '../../models/Users.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Users _users;
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  List<Users> _lsusers;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    aBC();
    super.initState();
  }

  void aBC() {
    _loading = true;
    Services.getUsers().then((users) {
      _lsusers = users;
      _loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Username'),
                controller: usernameController,
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Fullname'),
                controller: fullnameController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String fullname = fullnameController.text;
                    Users data = await postData(username, fullname);
                    setState(() {
                      _users = data;
                    });
                  },
                  child: Text("Submit")),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: _lsusers?.length ?? 0,
                    itemBuilder: (context, index) {
                      Users user = _lsusers[index];
                      return ListTile(
                        onTap: () => goPage(_lsusers[index]),
                        title: Text(user.userName),
                        subtitle: Text(user.fullName),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goPage(Users data) {}

  // Post DATA
  Future<Users> postData(String username, String fullname) async {
    var response = await http.post(
        Uri.parse('http://demo.vietinfo.tech:8091/api/user/Demo_Insert'),
        body: jsonEncode({'username': username, 'fullname': fullname}),
        headers: {'Content-Type': 'application/json'});
    var users = response.body;
    print(users);
    if (response.statusCode == 200) {
      String responseString = response.body;
      aBC();
    } else {
      throw Exception('Failed to submit user.');
    }
  }
}

class Object {
  int id = 0;
}

