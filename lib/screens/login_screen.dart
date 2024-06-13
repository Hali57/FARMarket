import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        // Use Firebase Authentication to sign in with email and password
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Fetch additional user data from Firestore if needed
        final User? user = userCredential.user;
        if (user != null) {
          // Example: Fetch user document from Firestore
          DocumentSnapshot<Map<String, dynamic>> snapshot =
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .get();

          // Navigate to homepage or another screen upon successful login
          Navigator.pushReplacementNamed(context, '/homepage');
        }
        // this is the failure logic
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
                child: Text(
              'User Not Found',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            content:
                Text('Please check on the email / password and try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Center(
                    child: Text(
                  'OK',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
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
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Column(
                        children: [
                          Center(
                            child: Text('Login',
                                style: TextStyle(
                                  color: Color(0xffED7E0D),
                                  fontSize: 38,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                          SizedBox(height: 5.0),
                          Center(
                              child: Text('Sign In to continue',
                                  style: TextStyle(
                                    color: Color(0xffED7E0D),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 4)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2.0),
                            ),
                            labelText: 'Email Address',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(color: Colors.white)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _email = val!),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 113, 74, 60),
                                  width: 4)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(color: Colors.white),
                          suffixIcon: const Icon(Icons.visibility_off),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _password = val!),
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xffED7E0D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: _loginUser,
                            child: const Text('Login'),
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
