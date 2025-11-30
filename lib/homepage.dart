import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas8/theme_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late TextEditingController usernameController;
  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (_isFirstLoad && themeProvider.username.isNotEmpty) {
      usernameController.text = themeProvider.username;
      _isFirstLoad = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Tema'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mode Gelap',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                themeProvider.setUsername(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
