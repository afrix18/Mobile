import 'package:flutter/material.dart';
import 'package:helloworld/ui/produk_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: ProdukForm(),
    );
  }
}
