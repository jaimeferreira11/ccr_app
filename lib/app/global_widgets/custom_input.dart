import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'custom_decoration_inputs.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? hint;
  final String? value;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? obscureText, borderEnabled;
  final double? fontSize;
  final IconData? icon;
  final void Function(String text) onChanged;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? placeholder;
  final bool? enabled;
  final bool readOnly;
  final InputBorder? border;
  final IconButton? suffixIcon;
  final TextInputAction textInputAction;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CustomInput(
      {required this.label,
      required this.onChanged,
      this.validator,
      this.hint = 'Escriba aquí',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnabled = true,
      this.fontSize,
      this.enabled = true,
      this.readOnly = false,
      this.icon,
      this.value,
      this.maxLength,
      this.maxLines,
      this.inputFormatters,
      this.border,
      this.suffixIcon,
      this.placeholder = "Escriba aqui",
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return _getSlider(context);
  }

  Widget _getSlider(BuildContext context) {
    Map<String, dynamic> inputsValues = {};
    Map<String, FocusNode> inputsFocusNodes = {};
    Map<String, TextEditingController> inputsValuesControllers = {};

    // final responsive = Responsive.of(context);

    var fSize = context.textTheme.bodySmall?.fontSize;
    if (fontSize != null) fSize = fontSize!;

    String keyInputValue = "$key";
    bool existeValor = inputsValues.containsKey(keyInputValue);
    bool existeNodo = inputsFocusNodes.containsKey(keyInputValue);
    bool existeController = inputsValuesControllers.containsKey(keyInputValue);
    if (existeValor) {
      //DO NOTHING
    } else {
      inputsValues[keyInputValue] = "";
    }
    if (existeNodo) {
      //NOTHING
    } else {
      inputsFocusNodes[keyInputValue] = FocusNode();
    }
    if (existeController) {
      //NOTHING
    } else {
      inputsValuesControllers[keyInputValue] = TextEditingController();
    }
    inputsValuesControllers[keyInputValue]!.text = value ?? "";

    return TextFormField(
        enabled: enabled,
        readOnly: readOnly,
        onFieldSubmitted: onFieldSubmitted ??
            (value) {
              FocusScope.of(context).unfocus();
              if (inputsFocusNodes.containsKey("$key")) {
                FocusScope.of(context).requestFocus(inputsFocusNodes["$key"]);
              } else {}
            },
        onChanged: (valor) {
          inputsValues[keyInputValue] = valor;
          onChanged(valor);
        },
        enableSuggestions: false,
        autocorrect: false,
        validator: validator,
        maxLength: maxLength,
        maxLines: maxLines,
        // focusNode: inputsFocusNodes[keyInputValue] ?? FocusNode(),
        controller: inputsValuesControllers[keyInputValue],
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: inputFormatters ?? [],
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(
          // fontWeight: FontWeight.w300,
          //color: Colors.black,
          fontSize: fSize,
        ),
        decoration: suffixIcon != null
            ? CustomDecorationInputs.searchInputDecoration(
                hint: hint ?? "", icon: icon!, suffixIcon: suffixIcon)
            : icon == null
                ? CustomDecorationInputs.formInputDecoration(
                    border: border,
                    hint: hint ?? "",
                    label: label,
                    fontSize: fontSize)
                : CustomDecorationInputs.formInputDecoration(
                    border: border,
                    hint: hint ?? "",
                    label: label,
                    icon: icon,
                    fontSize: fontSize));
  }
}
