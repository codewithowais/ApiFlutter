import 'package:apii/services/single_user_by_id.dart';
import 'package:apii/services/user_service.dart';
import 'package:flutter/material.dart';

class SingleUser extends StatefulWidget {
  const SingleUser({Key? key}) : super(key: key);

  @override
  _SingleUserState createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  hello() {
    setState(() {
      hellooo = abc;
    });
  }

  var hellooo = "";
  String abc = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              onChanged: (value) {
                abc = value;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              hello();
            },
            child: const Text("Search"),
          ),
          FutureBuilder(
              future: getUserById(abc),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListTile(
                    leading: Text("${snapshot.data.id}"),
                    title: Text(snapshot.data.name),
                    subtitle: Text(snapshot.data.username),
                  );
                }
              }),
        ],
      ),
    );
  }
}
