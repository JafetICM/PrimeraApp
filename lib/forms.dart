//forms.dart
import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  String _text = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _text = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField with Focus
            const Text("Focus a TextField Programmatically:"),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Autofocus TextField'),
            ),
            const SizedBox(height: 10),
            TextField(
              focusNode: _focusNode,
              decoration: const InputDecoration(labelText: 'Tap the Button Below'),
            ),
            ElevatedButton(
              onPressed: () => _focusNode.requestFocus(),
              child: const Text("Focus the TextField"),
            ),
            const SizedBox(height: 20),

            // TextField with Controller
            const Text("Retrieve TextField Value:"),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: 'Enter some text'),
            ),
            Text("Entered text: $_text"),
            const SizedBox(height: 20),

            // TextField with onChanged
            const Text("Handle Text Changes:"),
            TextField(
              onChanged: (value) {
                print("Current text: $value");
              },
              decoration: const InputDecoration(labelText: 'Type something'),
            ),
            const SizedBox(height: 20),

            // Styled TextField
            const Text("Styled TextField:"),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
                labelText: 'Styled TextField',
              ),
            ),
            const SizedBox(height: 20),

            // Form with Validation
            const Text("Form with Validation:"),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Enter your username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
