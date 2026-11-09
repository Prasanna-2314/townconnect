// Widget tests for Village Connect app.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:village_connect/main.dart';

void main() {
  testWidgets('App launches and shows login screen', (WidgetTester tester) async {
    // Build the app wrapped in ProviderScope (required by Riverpod).
    await tester.pumpWidget(
      const ProviderScope(child: VillageConnectApp()),
    );
    await tester.pumpAndSettle();

    // Verify the Login screen is shown with key text.
    expect(find.text('Village Connect'), findsOneWidget);
    expect(find.text('Log In as Customer'), findsOneWidget);
    expect(find.text('Log In as Worker'), findsOneWidget);
  });

  testWidgets('Tapping Log In as Customer navigates to customer home', (WidgetTester tester) async {
    // Use a larger test surface so all widgets are on-screen.
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const ProviderScope(child: VillageConnectApp()),
    );
    await tester.pumpAndSettle();

    // Scroll to ensure the button is visible, then tap it.
    await tester.ensureVisible(find.text('Log In as Customer'));
    await tester.tap(find.text('Log In as Customer'));
    await tester.pumpAndSettle();

    // Verify customer home screen appears (greeting text is unique to that screen).
    expect(find.text('Good morning, Sarah'), findsOneWidget);
  });
}
