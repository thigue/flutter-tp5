// Aluno: THIAGO GUERRA SOARES
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tp5/main.dart';

void main() {
  testWidgets('Exibe a apresentação inicial e o nome do aluno', (tester) async {
    await tester.pumpWidget(const AplicativoMusical());
    expect(find.text(Principal.nomeAluno), findsOneWidget);
    expect(find.text('Preferências Musicais'), findsOneWidget);
  });
}
