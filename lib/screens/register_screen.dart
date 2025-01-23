//lib/screen/register_screen.dart
import 'package:flutter/material.dart';
import '../api/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _registerCleaner() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _apiService.postData("/cleaners/register", {
          "name": _nameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
          "latitude": double.tryParse(_latitudeController.text) ?? 0.0,
          "longitude": double.tryParse(_longitudeController.text) ?? 0.0,
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registro exitoso"),
            content: Text("ID del limpiador: ${response['id']}"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Limpiador"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nombre"),
                validator: (value) =>
                    value!.isEmpty ? "El nombre es obligatorio" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Correo"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? "El correo es obligatorio" : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Contraseña"),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "La contraseña es obligatoria" : null,
              ),
              TextFormField(
                controller: _latitudeController,
                decoration: const InputDecoration(labelText: "Latitud"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "La latitud es obligatoria" : null,
              ),
              TextFormField(
                controller: _longitudeController,
                decoration: const InputDecoration(labelText: "Longitud"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "La longitud es obligatoria" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerCleaner,
                child: const Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
