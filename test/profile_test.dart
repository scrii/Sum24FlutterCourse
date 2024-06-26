import 'dart:collection';

import 'package:education/templates/lab6/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget testableWidget() {
  return MaterialApp(
    home: Scaffold(
      body: ProfileCard(
        imageUrl:
            "https://basket-12.wbcontent.net/vol1873/part187359/187359145/images/big/2.webp",
        name: "picture",
        description: "description",
      ),
    ),
  );
}

void main() {
  testWidgets('ProfileCard displays correct information',
      (WidgetTester tester) async {
    // Arrange
    const imageUrl = 'https://example.com/image.jpg';
    const name = 'John Doe';
    const description = 'Software Developer';

    await mockNetworkImagesFor(() async => await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ProfileCard(
                imageUrl: imageUrl,
                name: name,
                description: description,
              ),
            ),
          ),
        ));

    expect(find.text(name), findsAny);
    expect(find.text(description), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(Text), findsNothing);
    expect(find.byType(Image), findsNothing);

    // Test using flutter test test/custom_button_test.dart
  });
}
