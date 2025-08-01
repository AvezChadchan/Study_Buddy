import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top curved background
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              // width: 400,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(180),
                  bottomRight: Radius.circular(180),
                ),
              ),
            ),
          ),

          // Bottom curve with Sign In link
          Positioned(
            bottom: -15,
            right: -10,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80.0, left: 85),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 50,
            child: Row(
              children: [
                Text(
                  'Create \nAccount',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Container(
                // child: Image.network(
                // 'https://undraw.co/api/illustrations/e41e1adf-0c6e-4fdc-b62a-b46d36b39c32', // Use your own illustration
                // height: 120,
                // ),
                // ) //add image here
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                SizedBox(height: 330),
                myTextField(
                  controller: _nameController,
                  label: 'Name',
                  isPass: false,
                ),
                SizedBox(height: 30),
                myTextField(
                  controller: _emailController,
                  label: 'Email',
                  isPass: false,
                ),
                SizedBox(height: 30),
                myTextField(
                  controller: _passwordController,
                  label: 'Password',
                  isPass: true,
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myTextField({
    required TextEditingController controller,
    required String label,
    required bool isPass,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 3),
        ),
      ),
      obscureText: isPass,
    );
  }
}
