import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Horizontellist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/Caregory/tshirt.png',
            image_caption: 'shirt',
          ),
          Category(
            image_location: 'images/Caregory/dress.png',
            image_caption: 'dress',
          ),
          Category(
            image_location: 'images/Caregory/trousers.png',
            image_caption: 'trousers',
          ),
          Category(
            image_location: 'images/Caregory/hat.png',
            image_caption: 'hat',
          ),
          Category(
            image_location: 'images/Caregory/seperated_swimming_suit.png',
            image_caption: 'swimming suit',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  const Category({Key key, this.image_location, this.image_caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              child: Text(image_caption),
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
