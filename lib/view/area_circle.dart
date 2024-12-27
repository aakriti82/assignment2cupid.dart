import 'package:class_assignment2/cubit/circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AreaOfCircleView extends StatelessWidget {
  AreaOfCircleView({super.key});

  // Controller for the radius input field
  final _radiusController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aakriti_Area of Circle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _radiusController,
                decoration: const InputDecoration(
                  hintText: 'Enter Radius',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a radius';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, area) {
                  return Text(
                    "Area: ${area.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final radius = double.parse(_radiusController.text);
                      context.read<AreaOfCircleCubit>().calculateArea(radius);
                    }
                  },
                  child: const Text("Calculate Area"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
