import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


/// Flutter code sample for [showDialog].

void main() => runApp(const ShowDialogExampleApp());

class ShowDialogExampleApp extends StatelessWidget {
  const ShowDialogExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogExample(),
    );
  }
}

class DialogExample extends StatelessWidget {
  DialogExample({super.key});

  TextEditingController _textFieldController = TextEditingController();

  void _sendDataToServer() async {
    String inputValue = _textFieldController.text;
    var response = await http.post(
      Uri.parse('http://192.168.120.151:8080/predict'),
      body: {'inputValue': inputValue},
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('showDialog Sample')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _textFieldController,
              onTap: (){},
            ),
            Center(
              child: OutlinedButton(
                onPressed: (){
                  _sendDataToServer();
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

