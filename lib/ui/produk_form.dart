import 'package:flutter/material.dart';
import 'package:helloworld/ui/produk_detail.dart';

class ProdukForm extends StatefulWidget {
  final String? fullName;
  final String? email;
  final int? nohp;
  final int? personalID;
  final String? address;
  final String? selectDate;

  const ProdukForm({
    Key? key,
    this.fullName,
    this.email,
    this.nohp,
    this.personalID,
    this.address,
    this.selectDate,
  }) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class MyCheckboxListTile extends StatefulWidget {
  @override
  _MyCheckboxListTileState createState() => _MyCheckboxListTileState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _noHPTextboxController = TextEditingController();
  final _PersonalIDTextboxController = TextEditingController();
  final _AddressTextboxController = TextEditingController();
  final _selectDateTextboxController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Tanggal awal

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    // Inisialisasi data dengan data yang diterima
    _namaTextboxController.text = widget.fullName ?? '';
    _emailTextboxController.text = widget.email ?? '';
    _noHPTextboxController.text = widget.nohp?.toString() ?? '';
    _PersonalIDTextboxController.text = widget.personalID?.toString() ?? '';
    _AddressTextboxController.text = widget.address ?? '';
    _selectDateTextboxController.text = widget.selectDate ?? '';
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Personal Form',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(Icons.list_alt_outlined, color: Colors.black),
                  onPressed: () async {
                    final result =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProdukDetail(
                        fullName: _namaTextboxController.text,
                        email: _emailTextboxController.text,
                        addres: _AddressTextboxController.text,
                      ),
                    ));

                    // Setelah kembali dari "Detail Produk," Anda dapat melakukan sesuatu dengan 'result' jika diperlukan.
                    if (result != null) {
                      // Misalnya, Anda dapat memproses 'result' di sini.
                      print('Result: $result');
                    }
                  },
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _textboxfullname(),
                _textboxemail(),
                _textboxnoHP(),
                _textboxPersonalID(),
                _textboxAddress(),
                _textboxselectDate(),
                MyCheckboxListTile(),
                _tombolSimpan(),
              ],
            ),
          ),
        ));
  }

  _textboxfullname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan nama',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          controller: _namaTextboxController,
        ),
      ],
    );
  }

  _textboxemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          controller: _emailTextboxController,
        ),
      ],
    );
  }

  _textboxnoHP() {
    bool isVerified = false;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No HP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan no HP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: _noHPTextboxController,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  // Verifikasi apakah kolom No HP tidak kosong
                  if (_noHPTextboxController.text.isNotEmpty) {
                    // Kolom No HP tidak kosong, lakukan verifikasi
                    isVerified = true;
                  } else {
                    // Kolom No HP kosong, tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No HP tidak boleh kosong.'),
                      ),
                    );
                  }
                },
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _textboxPersonalID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal ID Number',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan Personal ID Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          controller: _PersonalIDTextboxController,
        ),
      ],
    );
  }

  _textboxAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan alamat',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          controller: _AddressTextboxController,
        ),
      ],
    );
  }

  _textboxselectDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Pilih Tanggal',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // Icon di sebelah kanan TextField
            suffixIcon: Icon(Icons.calendar_today),
          ),
          controller: TextEditingController(
            text: "${selectedDate.toLocal()}".split(' ')[0] ??
                '', // Menghindari null
          ),
          onTap: () {
            _selectDate(context);
          },
        ),
      ],
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          String fullName = _namaTextboxController.text;
          String email = _emailTextboxController.text;
          int nohp = int.parse(_noHPTextboxController
              .text); //parsing dari String ke int // pindah ke halaman
          int personalID = int.parse(_PersonalIDTextboxController.text);
          String addres = _AddressTextboxController.text;
          String selectdate = _selectDateTextboxController.text;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProdukDetail(
                    fullName: fullName,
                    email: email,
                    addres: addres,
                  )));
        },
        child: const Text('Simpan'));
  }
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Expanded(
            child: Text(
                'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content'),
          )
        ],
      ),
    ]);
  }
}
