// Aluno: THIAGO GUERRA SOARES
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tp5/main.dart';

void main() {
  testWidgets('Exibe os seis gêneros e altera cada Switch separadamente', (
    tester,
  ) async {
    await tester.pumpWidget(const AplicativoMusical());
    expect(find.text(Principal.nomeAluno), findsOneWidget);
    for (final nome in [
      'Rock',
      'Pop',
      'Sertanejo',
      'Samba',
      'MPB',
      'Eletrônica',
    ]) {
      expect(find.text(nome), findsOneWidget);
    }

    await tester.tap(find.byType(Switch).first);
    await tester.pump();
    expect(tester.widget<Switch>(find.byType(Switch).first).value, isTrue);
    expect(tester.widget<Switch>(find.byType(Switch).at(1)).value, isFalse);

    await tester.tap(find.byType(Switch).first);
    await tester.pump();
    expect(tester.widget<Switch>(find.byType(Switch).first).value, isFalse);
  });

  testWidgets(
    'Configura um gênero, confirma e preserva os valores em memória',
    (tester) async {
      await tester.pumpWidget(const AplicativoMusical());
      await tester.tap(find.text('Rock'));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(Slider), const Offset(75, 0));
      await tester.pump();
      final volume = tester.widget<Slider>(find.byType(Slider)).value;
      expect(volume, greaterThan(50));
      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      await tester.tap(find.text('Salvar Preferências'));
      await tester.pump();
      expect(find.text('Preferências de Rock salvas!'), findsOneWidget);

      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Rock'));
      await tester.pumpAndSettle();
      expect(tester.widget<Slider>(find.byType(Slider)).value, volume);
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);

      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pop'));
      await tester.pumpAndSettle();
      expect(tester.widget<Slider>(find.byType(Slider)).value, 50);
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isFalse);
    },
  );
}
