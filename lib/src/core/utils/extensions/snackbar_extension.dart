import 'package:flutter/material.dart';
import 'package:riverpod_boilerplate/src/core/core.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar({
    required String message,
    bool isError = true,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        content: Row(
          children: [
            Icon(
              isError
                  ? Icons.error_outline_rounded
                  : Icons.check_circle_outline_rounded,
              color:
                  isError ? Theme.of(this).coreRed : Theme.of(this).coreGreen,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(this)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(this).coreBlack),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(this).coreWhite,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
