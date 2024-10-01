import 'package:flutter_test/flutter_test.dart';
import 'package:frpc_gui/main.dart';
import 'package:frpc_gui/src/rust/frb_generated.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => RustLib.init());
  testWidgets('Can call rust function', (WidgetTester tester) async {
    await tester.pumpWidget(const FrpcApp());
    expect(find.textContaining('Result: `Hello, Tom!`'), findsOneWidget);
  });
}
