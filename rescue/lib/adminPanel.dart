import 'package:flutter/material.dart';

class AdminSignInPage extends StatefulWidget {
  @override
  _AdminSignInPageState createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {
  final TextEditingController passwordController = TextEditingController();

  // Define a FocusNode to track the text field focus
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // Dispose of the FocusNode when the widget is disposed
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
        backgroundColor: Color(0xffd54339),
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Password*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff000000)),
                    ),
                  ),
                  focusNode: passwordFocus,
                  cursorColor:
                      Color(0xff000000), // Set the cursor color to green
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final enteredPassword = passwordController.text;
                    if (enteredPassword == 'admin') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDashboardPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Incorrect password. Please try again.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffd54339),
                    minimumSize: Size(220, 70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xffd54339),
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: Center(
          child: Text('Welcome to the Admin Dashboard!'),
        ),
      ),
    );
  }
}
