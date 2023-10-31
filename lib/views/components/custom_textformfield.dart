import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData iconData;
  final String label;
  final bool visibility;
  final TextInputType keyboardType;
  final String? initalValue;
  const CustomTextFormField(
      {super.key,
      required this.iconData,
      required this.label,
      this.visibility = false,
      this.initalValue,
      this.keyboardType = TextInputType.text});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isobscure = false;

  @override
  void initState() {
    super.initState();

    isobscure = widget.visibility;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: widget.initalValue,
        obscureText: isobscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          isDense: true,
          label: Text(widget.label),
          prefixIcon: Icon(widget.iconData),
          suffixIcon: widget.visibility
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isobscure = !isobscure;
                    });
                  },
                  icon:
                      Icon(isobscure ? Icons.visibility : Icons.visibility_off))
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide:
                  const BorderSide(color: Colors.deepPurpleAccent, width: 2)),
        ),
      ),
    );
  }
}
