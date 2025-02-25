import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isOutlined;
  final Color? borderColor;
  final String? iconPath;
  final double width;
  final double height;
  final double fontSize;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.isOutlined = false,
    this.borderColor,
    this.iconPath,
    this.width = double.infinity, // Default full width
    this.height = 45, // ⬇ Reduced height
    this.fontSize = 14, // ⬇ Smaller font
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isOutlined ? Colors.white : (backgroundColor ?? Colors.blue),
          foregroundColor: textColor ?? Colors.white,
          side: isOutlined
              ? BorderSide(color: borderColor ?? Colors.blue)
              : BorderSide.none,
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 16), // ⬇ Reduced padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // ⬇ Smaller border radius
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              Image.asset(iconPath!, height: 20), // ⬇ Reduced icon size
              const SizedBox(width: 8), // Smaller spacing
            ],
            Text(
              text,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
