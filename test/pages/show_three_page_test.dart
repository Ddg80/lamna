import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lamna/pages/auth/login_page.dart';
import 'package:lamna/pages/teaser/show_three_page.dart';
import 'package:lamna/utils/widgets/Indicators/indicators_sliders.dart';
import 'package:lamna/utils/widgets/buttons/button_next_page_new_vision.dart'; // Assuming the path to the widget

void main() {
  testWidgets('ShowThreePage basic UI test', (WidgetTester tester) async {
    // Pump the widget into the test environment
    await tester.pumpWidget(const MaterialApp(home: ShowThreePage()));

    // Assertions to verify the UI elements
    expect(find.text('lämna'), findsOneWidget); // AppBar title
    expect(find.byType(IndicatorsSliders), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(TravelTitle), findsOneWidget);
    expect(find.byType(ButtonNextPageNewVison), findsOneWidget);
    expect(find.text('Terminer'), findsOneWidget);
  });

  testWidgets('Button navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ShowThreePage()));

    final button = find.byType(ButtonNextPageNewVison);
    await tester.tap(button);
    await tester.pumpAndSettle(); // Wait for navigation to happen

    // Verify that you've navigated to the LoginPage
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('Image loading', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ShowThreePage()));

    final image = find.byType(Image);
    expect(image, findsOneWidget);
    expect(image, isNotNull); // Check if the image provider is set
  });
}
