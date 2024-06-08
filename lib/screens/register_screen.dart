import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Added Form key for validation

  String? _validateEmail(String email) {
    // Email validation logic
    if (email.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null; // No error
  }

  String? _validatePassword(String password) {
    // Password validation logic (e.g., minimum length, complexity)
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null; // No error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // Wrap all input fields with Form widget
              key: _formKey, // Assign the form key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                            child: Text('Create New Account',
                                style: TextStyle(
                                  color: Color(0xffED7E0D),
                                  fontSize: 38,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                          SizedBox(height: 5.0),
                          const Center(
                              child: Text('Already have an Account? Login ',
                                  style: TextStyle(
                                    color: Color(0xffED7E0D),
                                    fontSize: 12,
                                  ))),
                    ],
                  ),
                  SizedBox(height:15),
                  TextFormField(
                    // Use TextFormField for validation
                    style: TextStyle(color:Colors.white, fontSize: 30),
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'FullName',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Full Name is required';
                      }
                      return null; // No error
                    },
                  ),
                  SizedBox(height:10),
                  TextFormField(
                    style: TextStyle(color:Colors.white, fontSize: 30),
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Location', 
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Location is required';
                      }
                      return null; // No error
                    },
                  ),
                  SizedBox(height:10),
                  TextFormField(
                    style: TextStyle(color:Colors.white, fontSize: 30),
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),),
                    validator: (value) {
                      _validateEmail;
                    }, // Use the validation function
                  ),
                  SizedBox(height:10),
                  TextFormField(
                    style: TextStyle(color:Colors.white, fontSize: 30),
                    controller: _idController,
                    decoration: InputDecoration(labelText: 'National ID',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'National ID is required';
                      }
                      return null; // No error
                    },
                  ),
                  SizedBox(height:10),
                  TextFormField(
                    style: TextStyle(color:Colors.white, fontSize: 30),
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),),
                    obscureText: true, // Password field should be hidden
                    validator: (value) {
                      _validatePassword;
                    }, // Use the validation function
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                                // Define your button styles here
                                foregroundColor: Colors.white, // Text color
                                backgroundColor:
                                    Color(0xffED7E0D), // Button color
                                shape: RoundedRectangleBorder(
                                  // Border shape
                                  borderRadius: BorderRadius.circular(10.0),
                                ) // Rounded corner
                                ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with registration logic
                        Navigator.pushReplacementNamed(context, '/homepage');
                      } else {
                        // Show error message or handle invalid form
                      }
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
