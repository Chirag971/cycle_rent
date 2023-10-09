import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_ranting/firebase/firebase_auth/firebase_auth_services.dart';
import 'package:cycle_ranting/pages/bottomnavi_page.dart';
import 'package:cycle_ranting/pages/login_page.dart';
import 'package:cycle_ranting/pages/regesteration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  // Create TextEditingController for email and password fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final box = GetStorage();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Create a GlobalKey to identify the form for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to handle the login button press
  void _handleRegistration() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      // For demonstration, we'll just print the email and password
      _signUp();

      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sign UP'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Username';
                      }
                      // You can add more email validation logic here if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more email validation logic here if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      // You can add more password validation logic here if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _handleRegistration,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text.toString();
    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Container(
                child: Center(
              child: CircularProgressIndicator(),
            )));

    User? user = await _auth.singUpWithEmailAndPassword(email, password);
    CollectionReference docUser =
        FirebaseFirestore.instance.collection('cycle');

    if (user != null) {
      await docUser
          .doc(user.uid)
          .set({'userName': username, 'balance': 0, 'email': email});
      box.write('uid', '${user.uid}');
      Navigator.of(context).pop();

      print("User is SuccessFully SignedIn");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    } else {
      Navigator.of(context).pop();
      print("Some Error uccered");
    }
  }
}
