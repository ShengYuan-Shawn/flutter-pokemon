import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreCubit extends Cubit<int> {
  ScoreCubit() : super(0);

  void _increment() {
    emit(state + 1);
  }
}
