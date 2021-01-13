import 'package:flutter/material.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/models/cart_item.dart';
import 'package:c_e_commerce/providers/cart_item.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return single_cart_product(
          cart_product_name: products[index].pName,
          cart_product_color: products[index].pColor,
          cart_product_quantity: products[index].pQuantity,
          cart_product_size: products[index].pSize,
          cart_product_price: products[index].pPrice,
          cart_product_pic: products[index].pLocation,
        );
      },
    );
  }
}

class single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_pic;
  final cart_product_size;
  final cart_product_color;
  final cart_product_price;
  final cart_product_quantity;

  const single_cart_product({
    Key key,
    this.cart_product_name,
    this.cart_product_pic,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_price,
    this.cart_product_quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    Product _product = ModalRoute.of(context).settings.arguments;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 12),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius:
          BorderRadius.all(Radius.circular(8))),
      child: ListTile(
        ////leading picccccc
        leading: new Image.network(
          cart_product_pic,
          width: 70,
          height: 70,
        ),
        // title nameeeeeeeeee
        title: new Text(cart_product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                // sizeeeeeeeeeeeeeee
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text("Size",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size.toString(),

                    style:  TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                //colorrrrrrrrrrrr
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: new Text("Color",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_color.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15
                    ,color: Colors.purpleAccent),
                  ),
                ),
              ],
            ),
            // priceeeeeeeeeeeeeeeee
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                //(cart_product_quantity != null)
                'quantity:$cart_product_quantity',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                // : '0',


                  color: Colors.purpleAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
