import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});

  final String label ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            Colors.purple.shade700,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
