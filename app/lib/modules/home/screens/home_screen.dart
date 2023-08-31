import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home"),
            // SizedBox(height: 10),
            // OutlinedButton.icon(
            //   icon: const Icon(Icons.list),
            //   label: const Text("Barbearias"),
            //   onPressed: () {
            //     Modular.to.navigate('./company/');
            //   },
            // ),
            // SizedBox(height: 10),
            // OutlinedButton.icon(
            //   icon: const Icon(Icons.list),
            //   label: const Text("Barbearias favoritas"),
            //   onPressed: () {
            //     Modular.to.navigate('./bookmark/');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
