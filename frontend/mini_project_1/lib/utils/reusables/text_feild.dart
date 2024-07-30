import 'package:flutter/material.dart';
import 'package:mini_project_1/utils/constants/colors/app_colors.dart';
import 'package:mini_project_1/utils/helpers/helper.dart';


class BeautifulTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int? maxLines;

  const BeautifulTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  _BeautifulTextFieldState createState() => _BeautifulTextFieldState();
}

class _BeautifulTextFieldState extends State<BeautifulTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MHelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            maxLines: _obscureText ? 1 : widget.maxLines,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.obscureText
                  ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,color: isDark ? AppColors.accent : AppColors.primary,
                ),
                onPressed: _togglePasswordVisibility,
              )
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
