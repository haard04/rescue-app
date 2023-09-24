import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rescue/signup.dart';

class AgencySignInPage extends StatefulWidget {
  @override
  _AgencySignInPageState createState() => _AgencySignInPageState();
}

class _AgencySignInPageState extends State<AgencySignInPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isMobileValid = true; // Initially set to true
  bool isPasswordValid = true; // Initially set to true

  void validateFields() {
    setState(() {
      isMobileValid = mobileController.text.isNotEmpty &&
          mobileController.text.length == 10; // Check for 10 digits
      isPasswordValid = passwordController.text.isNotEmpty;
    });
  }

  void navigateToNewPage(BuildContext context) {
    if (isMobileValid && isPasswordValid) {
      // Handle sign-in logic here
      // You can check the mobile number and password entered by the user
      // and navigate to the appropriate page if successful.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Sign In'),
        backgroundColor: const Color(0xffd54339),
      ),
      body: Container(
        color:
            const Color(0xffffffff), // Set your desired background color here
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Mobile Number*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: mobileController,
                  onChanged: (value) {
                    validateFields();
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile number',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff000000)),
                    ),
                    errorText: isMobileValid
                        ? null
                        : 'Enter a valid 10-digit mobile number',
                  ),
                  cursorColor: Color(0xff000000),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Password*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    validateFields();
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff000000)),
                    ),
                    errorText: isPasswordValid ? null : 'Password is required',
                  ),
                  cursorColor: Color(0xff000000),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    validateFields();
                    navigateToNewPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffd54339),
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffd54339),
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
        backgroundColor: const Color(0xffd54339),
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: const Center(
          child: Text('You have successfully signed in!'),
        ),
      ),
    );
  }
}