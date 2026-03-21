import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/shared/enums/timer_type.dart';
import 'package:fokus/app/view/pages/timer_page.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

class MockTimerViewModel extends Mock implements TimerViewModel {}

void main() {
  late MockTimerViewModel mockTimerViewModel;

  Widget createWidget({TimerType timerType = TimerType.focus}) {
    return ChangeNotifierProvider<TimerViewModel>.value(
      value: mockTimerViewModel,
      child: MaterialApp(
        home: Scaffold(body: TimerPage(timerType: timerType)),
      ),
    );
  }

  setUpAll(() {
    registerFallbackValue(ValueNotifier<bool>(false));
  });

  setUp(() {
    mockTimerViewModel = MockTimerViewModel();

    when(() => mockTimerViewModel.isPlaying).thenReturn(false);
    when(() => mockTimerViewModel.duration).thenReturn(Duration.zero);
  });

  group('TimerPage UI - ', () {
    group('TimerType - Focus', () {
      testWidgets(
        'deve exibir um tempo inicial formatado corretamente e o botão iniciar',
        (tester) async {
          await tester.pumpWidget(createWidget());

          expect(find.text('00:00'), findsOneWidget);
          expect(find.text('Iniciar'), findsOneWidget);
        },
      );

      testWidgets('deve chamar o startTimer ao clicar em Iniciar', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(() => mockTimerViewModel.startTimer(25, any())).called(1);
      });

      testWidgets('mostrar Pausar após iniciar a contagem', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Inciar'), findsNothing);
        });
      });

      testWidgets('mostrar Continuar após iniciar a pausar a contagem', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('deve chamar stopTime ao clicar em Parar', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.stopTime()).called(1);
        });
      });
    });

    group('TimerType - longBreak', () {
      testWidgets(
        'deve exibir um tempo inicial formatado corretamente e o botão iniciar',
        (tester) async {
          await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

          expect(find.text('00:00'), findsOneWidget);
          expect(find.text('Iniciar'), findsOneWidget);
        },
      );

      testWidgets('deve chamar o startTimer ao clicar em Iniciar', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(() => mockTimerViewModel.startTimer(15, any())).called(1);
      });

      testWidgets('mostrar Pausar após iniciar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Inciar'), findsNothing);
        });
      });

      testWidgets('mostrar Continuar após iniciar a pausar a contagem', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('deve chamar stopTime ao clicar em Parar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.stopTime()).called(1);
        });
      });
    });

    group('TimerType - shortBreak', () {
      testWidgets(
        'deve exibir um tempo inicial formatado corretamente e o botão iniciar',
        (tester) async {
          await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

          expect(find.text('00:00'), findsOneWidget);
          expect(find.text('Iniciar'), findsOneWidget);
        },
      );

      testWidgets('deve chamar o startTimer ao clicar em Iniciar', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(() => mockTimerViewModel.startTimer(5, any())).called(1);
      });

      testWidgets('mostrar Pausar após iniciar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Inciar'), findsNothing);
        });
      });

      testWidgets('mostrar Continuar após iniciar a pausar a contagem', (
        tester,
      ) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('deve chamar stopTime ao clicar em Parar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.stopTime()).called(1);
        });
      });
    });
  });
}
