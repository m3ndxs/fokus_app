import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';

void main() {
  group('TimerViewModel', () {
    late TimerViewModel viewModel;
    late ValueNotifier<bool> isPaused;

    // Inicia as variáveis para o teste
    setUp(() {
      viewModel = TimerViewModel();
      isPaused = ValueNotifier<bool>(false);
    });

    test('Inicia parado com duração zero', () {
      expect(viewModel.isPlaying, isFalse);
      expect(viewModel.duration, Duration.zero);
    });

    group('startTimer', () {
      test('liga o temporizador e zera a duração', () {
        viewModel.duration = Duration(minutes: 10);
        viewModel.startTimer(5, isPaused);

        expect(viewModel.isPlaying, isTrue);
        expect(viewModel.duration, Duration.zero);
      });

      test('incrementa a cada segundo quando não está pausado', () async {
        viewModel.startTimer(5, isPaused);
        await Future.delayed(Duration(seconds: 1));

        expect(viewModel.duration.inSeconds, 1);
      });

      test('não incrementa o valor quando está pausado', () async {
        isPaused.value = true;
        viewModel.startTimer(5, isPaused);
        await Future.delayed(Duration(seconds: 1));
        expect(viewModel.duration, Duration.zero);

        isPaused.value = false;
        await Future.delayed(Duration(seconds: 1));
        expect(viewModel.duration.inSeconds, 1);
      });
    });

    group('stopTime', () {
      test('desliga o temporizador', () {
        viewModel.startTimer(1, isPaused);
        expect(viewModel.isPlaying, isTrue);

        viewModel.stopTime();
        expect(viewModel.isPlaying, isFalse);
      });
    });
  }); 
}