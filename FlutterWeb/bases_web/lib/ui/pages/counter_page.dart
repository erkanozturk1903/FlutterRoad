import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomappMenu(),
          const Spacer(),
          const Text(
            "Durum Bilgisi",
            style: TextStyle(fontSize: 20),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Counter: $counter",
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: 'Increment',
                onPressed: () => setState(() => counter++),
              ),
              CustomFlatButton(
                text: 'Decrement',
                onPressed: () => setState(() => counter--),
              )
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
