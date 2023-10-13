import 'package:flutter/material.dart';
import 'package:helloworld/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final String? fullName;
  final String? email;
  final String? addres;

  const ProdukDetail({
    Key? key,
    this.fullName,
    this.email,
    this.addres,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    String allData = "${widget.fullName}\n${widget.email}\n${widget.addres}";

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLargeTextField(allData),
        ],
      ),
    );
  }

  Widget _buildLargeTextField(String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: data,
          readOnly: true,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProdukForm()),
          );
        },
      ),
      backgroundColor: Colors.white,
      title: Text(
        'List Personal Data',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
