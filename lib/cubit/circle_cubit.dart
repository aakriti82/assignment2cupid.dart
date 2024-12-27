import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0.0);

  // Method to calculate the area of a circle
  void calculateArea(double radius) {
    // Formula: π * r^2
    final area = 3.14159 * radius * radius;
    emit(area);
  }
}
