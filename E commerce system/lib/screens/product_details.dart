import 'package:c_e_commerce/components/cart_componant.dart';
import 'package:c_e_commerce/providers/favourite_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/constants.dart';

class ProductDetails extends StatefulWidget {
  static String id = 'Product Details';
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  final product_detail_description;

  const ProductDetails(
      {Key key,
      this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture,
      this.product_detail_description})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    //bool isguest = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('E_commerce App'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(product.pLocation),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    product.pName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${product.pPrice}",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${product.pPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          // rating barrrrrrrrrrrrrrrrrr
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          // +++first buttons++++
          Row(
            children: <Widget>[
              //+++  size++++
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: TextField(
                            onChanged: (String textTyped) {
                              setState(() {
                                product.pSize = int.parse(textTyped);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(hintText: 'Enter the size'),
                          ),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.1,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //+++  size++++
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: TextField(
                              onChanged: (String textTyped) {
                                setState(() {
                                  product.pQuantity = int.parse(textTyped);
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter the quantity'),
                            ),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.1,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //+++  size++++
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: TextField(
                              onChanged: (String textTyped) {
                                setState(() {
                                  product.pColor = textTyped;
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: 'Enter the color'),
                            ),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.1,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // +++second buttons++++
          Row(
            children: <Widget>[
              //+++  size++++
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showCustomDialog(product, context);
                  },
                  color: Colors.purpleAccent,
                  textColor: Colors.black,
                  elevation: 0.1,
                  child: new Text("Buy now"),
                ),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.purple,
                  onPressed: () {
                    addToCart(context, product);
                  },
                ),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.purple,
                  onPressed: () {
                    addtofavourite(context, product);
                  },
                ),
              ),
              /*new IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.purple,
                onPressed: () {
                  addtofavourite(context, product);
                },
              ),*/
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(product.pDescription),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: new Text(product.pName),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: new Text("brand"),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: new Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: new Text("condition"),
              )
            ],
          ),
          Divider(),

          new TextField(
            decoration: InputDecoration(
              hintText: "write your comment",
              labelText: "Comment",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
              filled: true,
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }

  void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.pName == product.pName) {
        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('you\'ve added this item before'),
      ));
    } else {
      cartItem.addProduct(product);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
      ));
    }
  }

  void addtofavourite(context, product) {
    Favouriteitem favouriteitem =
        Provider.of<Favouriteitem>(context, listen: false);
    bool exist = false;
    try {
      var productsInFavourite = favouriteitem.products;
      for (var productInFavourite in productsInFavourite) {
        if (productInFavourite.pName == product.pName) {
          exist = true;
        }
      }
      if (exist) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('you\'ve added this item before'),
        ));
      } else {
        favouriteitem.addProduct(product);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Added to Favourite'),
        ));
        print(product.pLocation);
      }
    } on Error catch (ex) {
      print(ex);
    }
  }

  void showCustomDialog(product, context) async {
    var price = getTotallPrice(product);
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            try {
              Store _store = Store();
              _store.storeOrder(
                  {cTotallPrice: price, cAddress: address}, product);

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Orderd Successfully'),
              ));
              Navigator.pop(context);
            } catch (ex) {
              print(ex.message);
              print(product.psize);
            }
          },
          child: Text('Confirm'),
        )
      ],
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter your Address'),
      ),
      title: Text('Totall Price  = \$ $price'),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  getTotallPrice(product) {
    var price = 0;
    if (product.pQuantity == null) product.pQuantity = 0;
    price += product.pQuantity * int.parse(product.pPrice);
    return price;
  }
}
