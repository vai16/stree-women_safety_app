import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String prefixText;
  final String hintText;
  final String initialValue;
  final bool multiLines;
  final int maxLines;
  final int maxLength;
  final TextInputType inputType;
  const CustomTextField(
      {Key key,
      this.multiLines = false,
      this.maxLength,
      this.prefixText,
      this.hintText,
      this.inputType,
      this.onChanged,
      this.onSaved,
      this.initialValue,
      this.validator,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(
      //boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)]),
      child: TextFormField(
        inputFormatters: (maxLength == null)
            ? null
            : [
                LengthLimitingTextInputFormatter(maxLength),
              ],
        initialValue: initialValue ?? null,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        showCursor: false,
        style: TextStyle(
          height: 1.5,
        ),
        maxLength: null,
        keyboardType: inputType ?? null,
        maxLines: (multiLines)
            ? (maxLines != null)
                ? maxLines
                : null
            : 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? null,
          prefix: (prefixText != null) ? Text(prefixText) : null,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 15.0, 13.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white10),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
