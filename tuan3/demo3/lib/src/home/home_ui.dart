import 'package:demo3/models/Users.dart';
import 'package:demo3/src/home/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI();

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  HomeBloc _bloc = HomeBloc();
  List<Users> user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              _bloc.eventHandle(BaseEvent.Get);
            },
            child: Text('GetData'),
          ),
          MaterialButton(
            onPressed: () {
              _bloc.eventHandle(BaseEvent.Clean);
            },
            child: Text('Clean Data'),
          ),
          Expanded(
            child: StreamBuilder(
                stream: _bloc.getUserStreamController.stream,
                builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return SizedBox.shrink();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      // TODO: Handle this case.
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (conet, index) {
                              return Text(snapshot.data[index].fullName);
                            });
                      }
                      return SizedBox.shrink();
                    default:
                      return SizedBox.shrink();
                  }
                }),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    _bloc.getInfoStreamController.stream.listen((event) {
      print(event.fullName);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }
}
