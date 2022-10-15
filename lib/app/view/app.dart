// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vgv_coffee/coffee/view/coffee_page.dart';
import 'package:vgv_coffee/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key, required CoffeeRepository coffeeRepository})
      : _coffeeRepository = coffeeRepository;

  final CoffeeRepository _coffeeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CoffeeRepository>.value(
      value: _coffeeRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF895637)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF895637),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CoffeePage(),
      ),
    );
  }
}
