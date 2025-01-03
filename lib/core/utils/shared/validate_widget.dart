import 'package:flutter/material.dart';

/// this widget will be used to apply validation on different widgets which doesn't support [FormFieldState]
///
/// [T] is the State of the widget
class ValidateWidget<T> extends StatelessWidget {
  /// this widget will be used to apply validation on different widgets which doesn't support [FormFieldState]
  const ValidateWidget({
    super.key,
    required this.builder,
    this.validator,
    this.errorBorderColor,
    this.errorTextStyle,
  });

  /// this builder will be used to pass the widget to the FormField and apply it the validation
  ///
  /// [FormFieldState] this is the state of the FormField will be updated to new value
  ///
  /// example:
  /// ```dart
  /// ValidateWidget<Strnig>(
  ///   validator: (value) {
  ///     if (value == null || value.isEmpty) {
  ///       return "This field is required";
  ///     }
  ///     return null;
  ///   },
  ///   builder: (state) {
  ///     return CustomDropDownMenu(
  ///     items: const <String>{
  ///       "فندق",
  ///       "موتيلات",
  ///       "مبيت",
  ///       "شقة"
  ///     },
  ///     onSelected: (selectedType) {
  ///       locations.elementAtOrNull(index) == null
  ///           ? locations.add(
  ///               AccommodationModel(type: selectedType))
  ///           : locations[index].type = selectedType;
  ///       // here you can update the state
  ///       fieldState.didChange(selectedType);
  ///     },
  ///     );
  ///   },
  /// ),
  /// ```
  final Widget Function(FormFieldState<T?>) builder;

  /// this validator will be used to validate the field
  final String? Function(T?)? validator;

  /// this color will be used to style the error border
  final Color? errorBorderColor;

  /// this style will be used to style the error text
  final TextStyle? errorTextStyle;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                border: state.hasError
                    ? Border.all(
                        color: errorBorderColor ?? Colors.red[800]!,
                      )
                    : null,
              ),
              child: builder(state),
            ),
            if (state.hasError)
              Text(
                state.errorText!,
                style: errorTextStyle ?? TextStyle(color: Colors.red[800]!),
              ),
          ],
        );
      },
    );
  }
}

