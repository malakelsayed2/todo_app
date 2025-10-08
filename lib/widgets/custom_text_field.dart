import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({super.key, required this.icon, required this.hintText, this.obsText = false, required this.validator , required this.controller});

  final IconData icon ;
  final String hintText ;
  bool obsText ;
  final String? Function(String?)? validator ;
  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ,
      obscureText: obsText,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        prefixIcon: Icon(icon, color: Colors.grey.shade700),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.purple.shade700,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
