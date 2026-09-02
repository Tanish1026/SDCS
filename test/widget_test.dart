import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SDCS app renders the landing experience', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('SDCS'),
                Text('Empowering Cooperatives with AI-Assisted Workforce Management'),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('SDCS'), findsWidgets);
    expect(find.text('Empowering Cooperatives with AI-Assisted Workforce Management'), findsOneWidget);
  });
}
