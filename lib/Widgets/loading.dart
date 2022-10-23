import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.red,
    );
  }
}

class ErrorInternet extends StatelessWidget {
  const ErrorInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.wifi,
          size: 30,
          color: Colors.red,
        ),
        Text(
          'Brak internetu!',
          style: TextStyle(color: Colors.red),
        ),
      ],
    ));
  }
}
