import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 1, 111, 236),
        ),
      ),
      home: const MyHomePage(title: 'Asset Barang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final List<String> kategoriList = ["selection"];
  String? selectedKategori = "selection";
  int _counter = 0;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF3558D3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 14),

            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pilih Foto dari galeri"),
            ),
            SizedBox(height: 14),
            _image == null
                ? Text(
                  'Tidak ada foto yang dipilih',
                  style: TextStyle(fontSize: 20),
                )
                : Image.file(_image!),

            // Tambahkan di atas dalam class _MyHomePageState
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                //   borderSide: BorderSide(
                //     color: Color(0xFF3558D3), // warna border
                //     width: 10.0, // ketebalan border
                //   ),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(17),
                //   borderSide: BorderSide(
                //     color: Color(0xFF3558D3), // warna border sama
                //     width: 3.8, // ketebalan sama
                //   ),
                // ),
                hintText: "Product",
                labelText: "Product Name",
                icon: Icon(Icons.widgets),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Specification",
                labelText: "Specification",
                icon: Icon(Icons.info_outline_rounded),
              ),
            ),

            SizedBox(height: 14),
            // Dropdown Kategori
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.category_rounded,
                ), // <-- ini yang benar supaya di luar kotak
                labelText: "Category",
                hintText: "Category Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              value: selectedKategori,
              onChanged: (value) {
                setState(() {
                  selectedKategori = value;
                });
              },
              borderRadius: BorderRadius.circular(17),
              items:
                  kategoriList.map((kategori) {
                    return DropdownMenuItem<String>(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),
            ),

            SizedBox(height: 14),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                icon: Icon(Icons.label),
                labelText: "Unit",
                hintText: "Unit Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              value: selectedKategori,
              onChanged: (value) {
                setState(() {
                  selectedKategori = value;
                });
              },
              borderRadius: BorderRadius.circular(17),
              items:
                  kategoriList.map((kategori) {
                    return DropdownMenuItem<String>(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),
            ),

            SizedBox(height: 14),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                icon: Icon(Icons.school),
                labelText: "Study",
                hintText: "Study Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              value: selectedKategori,
              onChanged: (value) {
                setState(() {
                  selectedKategori = value;
                });
              },
              borderRadius: BorderRadius.circular(17),
              items:
                  kategoriList.map((kategori) {
                    return DropdownMenuItem<String>(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),
            ),

            SizedBox(height: 14),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                icon: Icon(Icons.meeting_room),
                labelText: "Room",
                hintText: "Room name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              value: selectedKategori,
              onChanged: (value) {
                setState(() {
                  selectedKategori = value;
                });
              },
              borderRadius: BorderRadius.circular(17),
              items:
                  kategoriList.map((kategori) {
                    return DropdownMenuItem<String>(
                      value: kategori,
                      child: Text(kategori),
                    );
                  }).toList(),
            ),

            // SizedBox(height: 14),
            // TextFormField(
            //   keyboardType: TextInputType.text,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(17),
            //     ),
            //     hintText: "Room",
            //     labelText: "Room",
            //     icon: Icon(Icons.meeting_room),
            //   ),
            // ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Tahun Pembelian",
                labelText: "Tahun Pembelian",
                icon: Icon(Icons.event),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Quantity",
                labelText: "Quantity",
                icon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Unit Price",
                labelText: "Unit Price",
                icon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Funding Source",
                labelText: "Funding Source",
                icon: Icon(Icons.account_balance),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Condition",
                labelText: "Condition",
                icon: Icon(Icons.build),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Status",
                labelText: "Status",
                icon: Icon(Icons.insert_chart),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Notes",
                labelText: "Notes",
                icon: Icon(Icons.file_copy_rounded),
              ),
            ),
            SizedBox(height: 14),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: "Code",
                labelText: "Masukkan code",
                icon: Icon(Icons.code),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
