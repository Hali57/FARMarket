import 'dart:io';
import 'package:flutter/material.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/produce_model.dart';
import '../providers/produce_provider.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedCategory;
  File? _image;
  bool _isSubmitting = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_isSubmitting) return;

    if (_formKey.currentState!.validate() &&
        _image != null &&
        _selectedCategory != null) {
      setState(() {
        _isSubmitting = true;
      });

      final newProduce = Produce(
        imageUrl: _image!.path,
        description: _descriptionController.text,
        location: _locationController.text,
        price: double.parse(_priceController.text),
        category: _selectedCategory!,
      );

      try {
        // Add or update produce in Firestore
        await Provider.of<ProduceProvider>(context, listen: false)
            .addProduce(newProduce, context);

        // Navigate back to the previous screen
        await Future.delayed(Duration(seconds: 1)); // Simulating some delay
        if (!mounted) return;
        Navigator.of(context).pop();
      } catch (e) {
        // Handle errors in the provider or Firestore operation
        print('Error submitting form: $e');
        _showErrorDialog(
            context, 'Failed to submit the form. Please try again later.');
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    } else {
      // Handle form validation errors or missing image/category
      _showErrorDialog(
          context, 'Please fill in all required fields and select an image.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 239, 225),
        title: Center(child: Text('Post Your Produce for Sale', style: TextStyle(color: Color(0xff3FA843)),)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: _image == null
                        ? Center(child: Text('Tap to add image'))
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 113, 74, 60),
                              width: 4)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: 'Description'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 113, 74, 60),
                              width: 4)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: 'Location'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 113, 74, 60),
                              width: 4)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 113, 74, 60),
                              width: 4)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: 'Category'),
                  items:
                      ['Fruit', 'Vegetables', 'Grain'].map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (_selectedCategory == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffED7E0D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
