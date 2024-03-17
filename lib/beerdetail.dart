import 'package:flutter/material.dart';
import 'beerdetail.dart';
import 'data.dart';

class ProductDetailsPage extends StatelessWidget {
  final Beers product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        color: Colors.grey, 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.network(
                  product.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown[100], // สีพื้นหลังของกล่องข้อความ
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Price:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Average Rating:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.rating.average.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Number of Reviews:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.rating.reviews.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}