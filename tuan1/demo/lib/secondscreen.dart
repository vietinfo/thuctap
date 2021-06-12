import 'dart:convert';
import 'package:flutter/material.dart';
import 'Services.dart';
import 'Users.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter Username'),
                controller: usernameController,
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter Fullname'),
                controller: fullnameController,
              ),
              ElevatedButton(onPressed: () async{
                String username = usernameController.text;
                String fullname = fullnameController.text;

                Users data = await postData(username, fullname);
                setState(() {
                  _users = data;
                });
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}

// Post DATA
Future<Users> postData(String username, String fullname) async {
  var response = await http.post(Uri.parse('http://demo.vietinfo.tech:8091/api/user/Demo_Insert'),
    body: {'username': username, 'fullname': fullname});
    var users = response.body;
    print(users);

  if (response.statusCode == 200) {
    String responseString = response.body;
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to submit user.');
  }
}


//Get DATA
class TestData extends StatefulWidget {
  const TestData({Key key}) : super(key: key);

  @override
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  List<Users> _users;
  bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    Services.getUsers().then((users){
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0: _users.length,
            itemBuilder: (context, index){
          Users user = _users[index];
          return ListTile(
            title: Text(user.userName),
            subtitle: Text(user.fullName),
          );
        }),
      ),
    );
  }
}




