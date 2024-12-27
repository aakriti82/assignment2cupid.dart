import 'package:class_assignment2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SimpleInterestView extends StatelessWidget {
  SimpleInterestView({super.key});

  // Controllers for the input fields
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anita_Simple Interest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Principal Input
              TextFormField(
                controller: _principalController,
                decoration: const InputDecoration(
                  hintText: 'Enter Principal Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the principal amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Rate Input
              TextFormField(
                controller: _rateController,
                decoration: const InputDecoration(
                  hintText: 'Enter Rate of Interest (%)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rate of interest';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Time Input
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  hintText: 'Enter Time (Years)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Result Display
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, interest) {
                  return Text(
                    "Simple Interest: ${interest.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final principal = double.parse(_principalController.text);
                      final rate = double.parse(_rateController.text);
                      final time = double.parse(_timeController.text);

                      context
                          .read<SimpleInterestCubit>()
                          .calculateSimpleInterest(principal, rate, time);
                    }
                  },
                  child: const Text("Calculate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
