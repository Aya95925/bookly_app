import 'package:flutter/widgets.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
