// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:vgv_coffee/app/app.dart';
import 'package:vgv_coffee/bootstrap.dart';

void main() {
  final coffeeRepository =
      CoffeeRepository('https://coffee.alexflipnote.dev/random.json');

  bootstrap(
    () => App(
      coffeeRepository: coffeeRepository,
    ),
  );
}
