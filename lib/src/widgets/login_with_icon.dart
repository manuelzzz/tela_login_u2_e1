import 'package:flutter/material.dart';

class LoginWithIcon extends StatelessWidget {
  final String uri;
  final VoidCallback? onPressed;

  const LoginWithIcon({super.key, required this.uri, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.network(uri, height: 50),
    );
  }
}
