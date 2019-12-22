import 'package:flutter/material.dart';
import 'package:flutter_app/screens/AllCountries.dart';

import 'Screens/Country.dart';

main() {
  runApp(
    new MaterialApp(
      home: new AllCountries(),
      routes: {Country.routeName: (context) => Country()},
    ),
  );
}
