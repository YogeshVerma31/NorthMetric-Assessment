import 'package:flutter/material.dart';
import 'package:testing_assessment/utils/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  Function()? onPressed;
  bool? isLoading;
  bool isBorderRequired;
  Widget? leadingWidget;
  Color? backgroundColor;

  CustomButton({
    this.onPressed,
    this.isLoading = false,
    this.isBorderRequired = false,
    this.leadingWidget,
    this.backgroundColor = primaryColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: isBorderRequired ? Colors.white : backgroundColor,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingWidget ?? const SizedBox.shrink(),
          Text(
            text,
            style: TextStyle(
                color: backgroundColor!.computeLuminance() > 0.5
                    ? primaryColor
                    : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
