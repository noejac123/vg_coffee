// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee/app/app.dart';
import 'package:vgv_coffee/coffee/view/coffee_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      final coffeeRepository = CoffeeRepository('');
      await tester.pumpWidget(App(
        coffeeRepository: coffeeRepository,
      ));
      expect(find.byType(CoffeePage), findsOneWidget);
    });
  });
}
