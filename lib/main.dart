// import 'dart:ffi';
import 'package:homework5/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'beerdetail.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

List<Beers> menu = [];
String url = 'https://api.sampleapis.com/beers/ale';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Beers> beers = jsonData.map((item) {
        return Beers(
          price: item['price'],
          name: item['name'],
          rating: BeerRating(
            average: item['rating']['average'],
            reviews: item['rating']['reviews'],
          ),
          image: item['image'],
          id: item['id'],
        );
      }).toList();

      setState(() {
        menu = beers;
        print(menu.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Beer Menu'),
        ),
        body: ListView.builder(
  itemCount: menu.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(menu[index].name),
      subtitle: Text('Price: ${menu[index].price}'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(menu[index].image),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: menu[index]),
          ),
        );
      },
    );
  },
),

      ),
    );
  }
}