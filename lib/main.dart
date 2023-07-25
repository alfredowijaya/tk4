import 'package:flutter/material.dart';
import 'package:tp2/maps.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  String name = "";

  final _formKey = GlobalKey<FormState>();
  final hobbyController = TextEditingController();
  final nameController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget formWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                const Text("Nama : "),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi nama terlebih dahulu';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Hobby : "),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: hobbyController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi hobby terlebih dahulu';
                      } else {
                        setState(() {
                          name = nameController.text;
                        });
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            TextButton(
              style: ButtonStyle(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  name,
                ),
              ),
            ),
          ],
        ),
        body: _selectedIndex == 0
            ? const Center(
                child: Text(
                  'Selamat Datang!',
                  style: optionStyle,
                ),
              )
            : _selectedIndex == 1
                ? formWidget()
                : const MapsWidget(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Form',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
