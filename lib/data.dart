import 'package:http/http.dart';

class Beers {
  final String price;
  final String name;
  final BeerRating rating;
  final String image;
  final int id;

  Beers({
    required this.price,
    required this.name,
    required this.rating,
    required this.image,
    required this.id,
  });
}

class BeerRating {
  final double average;
  final int reviews;

  BeerRating({
    required this.average,
    required this.reviews,
  });
}


        