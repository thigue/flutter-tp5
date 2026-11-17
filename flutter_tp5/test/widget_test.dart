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
}
