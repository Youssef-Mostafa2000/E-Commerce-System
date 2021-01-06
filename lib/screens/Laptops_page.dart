import 'package:c_e_commerce/screens/complaints.dart';
import 'package:c_e_commerce/screens/favourites.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:c_e_commerce/components/horizontel_listview.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:c_e_commerce/components/products.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/screens/login_screen.dart';
import 'package:c_e_commerce/screens/signup_screen.dart';
import 'package:c_e_commerce/services/google_auth.dart';
import 'package:c_e_commerce/services/auth.dart';
import 'cart.dart';
import 'package:c_e_commerce/services/classify_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:c_e_commerce/constants.dart';
import 'Clothes_page.dart';
import 'Mobiles_page.dart';
import 'Laptops_page.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c_e_commerce/screens/product_details.dart';
import 'package:c_e_commerce/screens/homepage.dart';

class Laptop extends StatefulWidget {
  @override
  _LaptopState createState() => _LaptopState();
}

class _LaptopState extends State<Laptop> {
  final _auth = Auth();
  FirebaseUser _loggedUser;
  int _tabBarIndex = 0;
  int _bottomBarIndex = 0;
  final _store = Store();
  List<Product> _products;
  var Mobile_product_list = [
    {
      "name": "Apple laptops",
      "picture": "images/products/apple_laptops.jpg",
      "old_price": 1350,
      "price": 1300,
    },
    {
      "name": "HPSpectreX360",
      "picture": "images/products/HPSpectreX360-15.jpg",
      "old_price": 700,
      "price": 699,
    },
    {
      "name": "HPSpectreX360 min",
      "picture": "images/products/HP-Spectre-x360.jpg",
      "old_price": 500,
      "price": 499,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('Laptops'),
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
              onPressed: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      // Drawwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwer
      drawer: MultiLevelDrawer(
        backgroundColor: Colors.white,
        rippleColor: Colors.white,
        subMenuBackgroundColor: Colors.grey.shade100,
        header: Container(
          height: 150,
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Yasser Ahmed"),
              Text('_loggedUser.email')
            ],
          )),
        ),
        children: [
          MLMenuItem(
              leading: Icon(
                Icons.home,
              ),
              content: Text(
                "home page",
              ),
              onClick: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => new HomePage()));
              }),
          MLMenuItem(
              leading: Icon(
                Icons.shopping_basket,
              ),
              content: Text(
                "My orders",
              ),
              onClick: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
          MLMenuItem(
              leading: Icon(
                Icons.dashboard,
              ),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Categoris",
              ),
              subMenuItems: [
                MLSubmenu(
                    onClick: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => new Laptop()));
                    },
                    submenuContent: Text("Lap Top")),
                MLSubmenu(
                    onClick: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => new Mobiles()));
                    },
                    submenuContent: Text("Mobile")),
                MLSubmenu(
                  onClick: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => new clothes()));
                  },
                  submenuContent: Text("Clothes"),
                ),
              ],
              onClick: () {}),
          MLMenuItem(
              leading: Icon(
                Icons.favorite,
              ),
              content: Text(
                "Favorite",
              ),
              onClick: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => new Favourite()));
              }),
          MLMenuItem(
              leading: Icon(
                Icons.error,
              ),
              content: Text(
                "Complaints",
              ),
              onClick: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => new Complaint()));
              }),
          MLMenuItem(
              leading: Icon(
                Icons.logout,
              ),
              content: Text(
                "Log Out",
              ),
              onClick: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, loginscreen.id);
              }),
        ],
      ),

      body: new ListView(
        children: <Widget>[
          // image carouseeeeeeeeeeeeeeeel
          image_carousel,

          // griiiiiiiiiiiiiiiiiiiiiid

          Container(
            height: 430.0,
            child: productview(),
          ),
        ],
      ),
    );
  }

  Widget productview() {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> products = [];
          for (var doc in snapshot.data.documents) {
            var data = doc.data;
            products.add(Product(
                pId: doc.documentID,
                pPrice: data[cProductPrice],
                pName: data[cProductName],
                pDescription: data[cProductDescription],
                pLocation: data[cProductLocation],
                pCategory: data[cProductCategory]));
          }
          _products = [...products];
          products.clear();
          products = getProductByCategory(claptops, _products);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetails.id,
                      arguments: products[index]);
                },
                /*=> Navigator.of(context).push(new MaterialPageRoute(
                    // passing value from here to product deatils page
                    builder: (context) => new ProductDetails(
                        product_detail_name: products[index].pName,
                        product_detail_new_price: products[index].pPrice,
                        product_detail_old_price: products[index].pPrice,
                        product_detail_picture: products[index].pLocation,
                        product_detail_description:
                            products[index].pDescription))),*/
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(products[index].pLocation),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  products[index].pName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('\$ ${products[index].pPrice}')
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            itemCount: products.length,
          );
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }
}
