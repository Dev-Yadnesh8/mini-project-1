import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String lable;
  final bool? isLoading;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, required this.lable,this.isLoading,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return isLoading == true ?  CircularProgressIndicator() : ElevatedButton(
      onPressed: onPressed, child: Text(lable));
  }
}