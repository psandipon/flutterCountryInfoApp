import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class Country extends StatelessWidget {
  static const routeName = 'country';

//  final Map country;
//  Country(this.country);

  _randomFlipDirection() {
    return (Random().nextInt(10) >= 5)
        ? FlipDirection.VERTICAL
        : FlipDirection.HORIZONTAL;
  }

  @override
  Widget build(BuildContext context) {
    final Map country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(country['name']),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              FlipCard(
                direction: _randomFlipDirection(), // default
                front: Container(
                  child: CountryCard(text: 'Capital'),
                ),
                back: Container(
                  child: CountryDetailCard(text: country['capital']),
                ),
              ),
              FlipCard(
                direction: _randomFlipDirection(), // default
                front: Container(
                  child: CountryCard(text: 'Region'),
                ),
                back: Container(
                  child: CountryDetailCard(text: country['region']),
                ),
              ),
              FlipCard(
                direction: _randomFlipDirection(), // default
                front: Container(
                  child: CountryCard(text: 'Population'),
                ),
                back: Container(
                  child:
                      CountryDetailCard(text: country['population'].toString()),
                ),
              ),
              FlipCard(
                direction: _randomFlipDirection(), // default
                front: Container(
                  child: CountryCard(text: 'Native Name'),
                ),
                back: Container(
                  child: CountryDetailCard(text: country['nativeName']),
                ),
              ),
              FlipCard(
                direction: _randomFlipDirection(), // default
                front: Container(
                  child: CountryCard(text: 'Currency'),
                ),
                back: Container(
                  child:
                      CountryDetailCard(text: country['currencies'][0]['name']),
                ),
              ),
              FlipCard(
                direction: _randomFlipDirection(),
                front: CountryCard(text: 'Flag'),
                back: Card(
                  color: Colors.amberAccent,
                  elevation: 15,
                  child: Center(
                    child: SvgPicture.network(
                      country['flag'],
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CountryCard extends StatelessWidget {
  final String text;
  const CountryCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

class CountryDetailCard extends StatelessWidget {
  final String text;
  const CountryDetailCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
