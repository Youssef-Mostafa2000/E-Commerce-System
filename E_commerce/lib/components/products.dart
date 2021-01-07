import 'package:c_e_commerce/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  var product_list = [
    {
      "name": "tshirt1",
      "picture": "images/products/tshirt1.jpg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "tshirt2",
      "picture": "images/products/tshirt2.jpg",
      "old_price": 130,
      "price": 100,
    },
    {
      "name": "tshirt3",
      "picture": "images/products/tshirt3.jpg",
      "old_price": 120,
      "price": 90,
    },
    {
      "name": "tshirt4",
      "picture": "images/products/tshirt4.jpg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "tshirt5",
      "picture": "images/products/tshirt5.jpg",
      "old_price": 120,
      "price": 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            product_name: product_list[index]['name'],
            product_pic: product_list[index]['picture'],
            product_oldprice: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_oldprice;
  final product_price;

  const Single_product(
      {Key key,
      this.product_name,
      this.product_pic,
      this.product_oldprice,
      this.product_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // passing value from here to product deatils page
                  builder: (context) => new ProductDetails(
                        product_detail_name: product_name,
                        product_detail_new_price: product_price,
                        product_detail_old_price: product_oldprice,
                        product_detail_picture: product_pic,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        product_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$product_price",
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$product_oldprice",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    product_pic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
