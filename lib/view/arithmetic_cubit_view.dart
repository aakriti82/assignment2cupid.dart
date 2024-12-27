import 'package:class_assignment2/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ArithmeticCubicView extends StatelessWidget {
  ArithmeticCubicView({super.key});

  // Controllers for TextFormField
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aakriti_Arithmetic Cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNumberController,
                decoration: const InputDecoration(
                  hintText: 'First Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _secondNumberController,
                decoration: const InputDecoration(
                  hintText: 'Second Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<ArithmenticCubit, int>(
                builder: (context, result) {
                  return Text(
                    "Result: $result",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      final firstNumber =
                          int.parse(_firstNumberController.text);
                      final secondNumber =
                          int.parse(_secondNumberController.text);
                      context
                          .read<ArithmenticCubit>()
                          .add(firstNumber, secondNumber);
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      final firstNumber =
                          int.parse(_firstNumberController.text);
                      final secondNumber =
                          int.parse(_secondNumberController.text);
                      context
                          .read<ArithmenticCubit>()
                          .subtract(firstNumber, secondNumber);
                    }
                  },
                  child: const Text("Subtract"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      final firstNumber =
                          int.parse(_firstNumberController.text);
                      final secondNumber =
                          int.parse(_secondNumberController.text);
                      context
                          .read<ArithmenticCubit>()
                          .multiply(firstNumber, secondNumber);
                    }
                  },
                  child: const Text("Multiply"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
