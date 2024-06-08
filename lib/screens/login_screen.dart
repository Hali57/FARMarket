import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned(
          //   top: -58.5,
          //   left: -17.2,
          //   child: Image.asset(
          //     'assets/images/top.png',

          //     width: 297.8,
          //     height: 229,
          //   ),
          // ),
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          const Center(
                            child: Text('Login',
                                style: TextStyle(
                                  color: Color(0xffED7E0D),
                                  fontSize: 38,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                          SizedBox(height: 5.0),
                          const Center(
                              child: Text('Sign In to continue',
                                  style: TextStyle(
                                    color: Color(0xffED7E0D),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      
                      TextFormField(
                        style: TextStyle(color:Colors.white, fontSize: 30),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey, width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color:Colors.white),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.white)
                        ),
                        validator: (value) {
                          // Email validation (optional)
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _email = val!),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        style: TextStyle(color:Colors.white, fontSize: 30),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Color.fromARGB(255, 113, 74, 60), width:4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.white),
            
                          suffixIcon: const Icon(Icons.visibility_off),

                          // Optional: Password visibility toggle
                        ),
                        obscureText: true, // Hide password input
                        validator: (value) {
                          // Password validation (optional)
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _password = val!),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                _formKey.currentState!.save();
                                // Handle login logic here (e.g., call an API)
                                // print('Email: $_email, Password: $_password');
                                Navigator.pushReplacementNamed(
                                    context, '/homepage');
                              }
                            },
                            child: Text(
                              'Login',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
