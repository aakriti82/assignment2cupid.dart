import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmenticCubit extends Cubit<int> {
  ArithmenticCubit() : super(0);

  void add(int firstNumber, int secondNumber) {
    emit(firstNumber + secondNumber);
  }

  void subtract(int firstNumber, int secondNumber) {
    emit(firstNumber - secondNumber);
  }

  void multiply(int firstNumber, int secondNumber) {
    emit(firstNumber * secondNumber);
  }
}
