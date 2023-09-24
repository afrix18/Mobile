import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<String> nama = [
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
      "Smurf Cat",
    ];
    String jabatan = "Jabatan : Business Owner";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Test(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: Icon(Icons.home),
          title: Text(
            "Uji Coba",
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(right: 16.0), // Adjust the value as needed
              child: Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff83c1ca),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: nama.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th?id=OIF.HT7li4Rh%2f19gXeO8kCJUgQ&w=245&h=180&c=7&r=0&o=5&pid=1.7"),
                  ),
                  title: Text(
                    nama[index],
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Text(
                    jabatan,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }),
        )),
      ),
    );
  }
}
