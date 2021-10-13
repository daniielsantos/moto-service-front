import 'package:flutter/material.dart';
import 'package:moto_services/main/main_screens.dart';
import 'package:moto_services/models/bike.dart';
import 'package:moto_services/provider/bikes.dart';
import 'package:provider/provider.dart';

class BikeForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Bike bike) {
    _formData['id'] = bike.id;
    _formData['name'] = bike.name;
    _formData['model'] = bike.model;
    _formData['brand'] = bike.brand;
    _formData['year'] = bike.year;
    _formData['tumbnailUrl'] = bike.tumbnailUrl;
  }

  @override
  Widget build(BuildContext context) {
    final bike = ModalRoute.of(context)!.settings.arguments;

    if (bike != null) {
      _loadFormData(bike as Bike);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Moto"),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();

                Provider.of<Bikes>(context, listen: false).put(
                  Bike(
                    id: _formData['id'] ?? "0",
                    name: _formData['name'] ?? "",
                    model: _formData['model'] ?? "",
                    brand: _formData['brand'] ?? "",
                    year: _formData['year'] ?? "",
                    tumbnailUrl: "",
                  ),
                );
     
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sucesso!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(index: 1),
                  ),
                );
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome invalido';
                  }
                  if (value.trim().length < 3) {
                    return "No minimo 3 letras";
                  }
                },
                onSaved: (String? value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['model'],
                decoration: const InputDecoration(labelText: 'Modelo'),
                onSaved: (String? value) => _formData['model'] = value!,
              ),
              TextFormField(
                initialValue: _formData['brand'],
                decoration: const InputDecoration(labelText: 'Marca'),
                onSaved: (String? value) => _formData['brand'] = value!,
              ),
              TextFormField(
                initialValue: _formData['year'],
                decoration: const InputDecoration(labelText: 'Ano'),
                onSaved: (String? value) => _formData['year'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
