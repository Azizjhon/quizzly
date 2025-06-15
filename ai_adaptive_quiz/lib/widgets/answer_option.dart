import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.option,
    required this.isSelected,
    this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;

    if (isSelected) {
      backgroundColor = Colors.blue.shade50;
      borderColor = Colors.blue;
    }

    if (isCorrect != null) {
      if (isCorrect!) {
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = Colors.red.shade50;
        borderColor = Colors.red;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16,
                  color: isCorrect != null && isSelected
                      ? isCorrect!
                            ? Colors.green.shade800
                            : Colors.red.shade800
                      : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                isCorrect != null
                    ? isCorrect!
                          ? Icons.check_circle
                          : Icons.cancel
                    : Icons.radio_button_checked,
                color: isCorrect != null
                    ? isCorrect!
                          ? Colors.green
                          : Colors.red
                    : Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}
