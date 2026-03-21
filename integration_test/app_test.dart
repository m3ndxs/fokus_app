import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fokus/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Modo Foco', () {
    testWidgets(
      'Fluxo completo: Navegando da Home para o Timer em modo Foco (Iniciar / Pausar / Continuar)',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.text('Modo Foco'), findsOneWidget);

        await tester.tap(find.text('Modo Foco'));
        await tester.pumpAndSettle();

        expect(find.text('00:00'), findsOneWidget);

        final initFinder = find.textContaining('Iniciar');
        expect(initFinder, findsOneWidget);
        await tester.tap(initFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final pauseFinder = find.textContaining('Pausar');
        expect(pauseFinder, findsOneWidget);
        await tester.tap(pauseFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final continueFinder = find.textContaining('Continuar');
        expect(continueFinder, findsOneWidget);
        await tester.tap(continueFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:02'), findsOneWidget);
      },
    );
  });

  group('Pausa Longa', () {
    testWidgets(
      'Fluxo completo: Navegando da Home para o Timer em pausa longa (Iniciar / Pausar / Continuar)',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Pausa Longa'));
        await tester.pumpAndSettle();

        expect(find.text('00:00'), findsOneWidget);

        final initFinder = find.textContaining('Iniciar');
        expect(initFinder, findsOneWidget);
        await tester.tap(initFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final pauseFinder = find.textContaining('Pausar');
        expect(pauseFinder, findsOneWidget);
        await tester.tap(pauseFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final continueFinder = find.textContaining('Continuar');
        expect(continueFinder, findsOneWidget);
        await tester.tap(continueFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:02'), findsOneWidget);
      },
    );
  });

  group('Pausa Curta', () {
    testWidgets(
      'Fluxo completo: Navegando da Home para o Timer em modo Foco (Iniciar / Pausar / Continuar)',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        expect(find.text('Pausa Curta'), findsOneWidget);

        await tester.tap(find.text('Pausa Curta'));
        await tester.pumpAndSettle();

        expect(find.text('00:00'), findsOneWidget);

        final initFinder = find.textContaining('Iniciar');
        expect(initFinder, findsOneWidget);
        await tester.tap(initFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final pauseFinder = find.textContaining('Pausar');
        expect(pauseFinder, findsOneWidget);
        await tester.tap(pauseFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:01'), findsOneWidget);

        final continueFinder = find.textContaining('Continuar');
        expect(continueFinder, findsOneWidget);
        await tester.tap(continueFinder);
        await tester.pump(Duration(seconds: 1));
        expect(find.text('00:02'), findsOneWidget);
      },
    );
  });
}
