import 'package:flutter/material.dart';

class LoadingModal extends StatelessWidget {
  final String? loadingMessage;

  const LoadingModal({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(loadingMessage ?? 'Carregando...'),
            ],
          ),
        ),
      ],
    );
  }
}
