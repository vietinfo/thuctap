import 'dart:async';
import 'package:demo3/models/Users.dart';
import 'package:demo3/repositories/Services.dart';
import 'package:demo3/src/base.dart';

enum BaseEvent { Get, Post, Clean }

class HomeBloc extends BaseBloc {
  Services _services = Services();

  StreamController<List<Users>> getUserStreamController =
      StreamController<List<Users>>.broadcast();

  StreamController<Users> getInfoStreamController =
      StreamController<Users>.broadcast();

  Future eventHandle(BaseEvent event) async {
    switch (event) {
      case BaseEvent.Get:
        // TODO: Handle this case.
        var value = await _services.getUsers();
        if (value != null) {
          getUserStreamController.sink.add(value);
          getInfoStreamController.sink.add(value[5]);
        }
        break;
      case BaseEvent.Post:
        // TODO: Handle this case.
        break;
      case BaseEvent.Clean:
        // TODO: Handle this case.
        getUserStreamController..sink.add([]);
        break;
    }
  }

  void dispose() {
    getUserStreamController.close();
    getInfoStreamController.close();
  }
}
