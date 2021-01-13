import 'package:c_e_commerce/models/Complaint.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/widgets/mytextfield.dart';
import 'homepage.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/constants.dart';

class Complaint extends StatefulWidget {
  static String id = 'Complaint';

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    bool isguest = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
        title: new Text("Hello. What can we help you with?"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(
              context,
              HomePage.id,
              arguments: isguest,
            );
          },
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            // ===========first row=========
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: SizedBox.fromSize(
                    size: Size(170, 170),
                    // button width and height

                    child: ClipOval(
                      child: Material(
                        color: Colors.purpleAccent, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendComplaint()),
                            );
                          }, // button pressed

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.airport_shuttle,
                                size: 50,
                              ),
                              // icon
                              Text(
                                "Your Orders",
                                style: new TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: SizedBox.fromSize(
                    size: Size(170, 170), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.lightBlueAccent, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendComplaint()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.assignment_return,
                                size: 50,
                              ),
                              // icon
                              Text(
                                "Returns & Refunds",
                                style: new TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // ==========Second Row===========
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: SizedBox.fromSize(
                    size: Size(170, 170), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.lightGreen, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendComplaint()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.device_unknown,
                                size: 50,
                              ), // icon
                              Text(
                                "Digital Services",
                                style: new TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: SizedBox.fromSize(
                    size: Size(170, 170), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.orangeAccent, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // splash color
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendComplaint()),
                            );
                          }, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.payment,
                                size: 50,
                              ), // icon
                              Text(
                                "Payment problem",
                                style: new TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.black,
                    width: 3,
                  )),
              child: SizedBox.fromSize(
                size: Size(170, 170), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.yellowAccent, // button color
                    child: InkWell(
                      splashColor: Colors.redAccent, // splash color
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendComplaint()));
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.call,
                            size: 50,
                          ),
                          // icon
                          Text(
                            "Other Problem",
                            style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

class SendComplaint extends StatefulWidget {
  @override
  _SendComplaintState createState() => _SendComplaintState();
}

class _SendComplaintState extends State<SendComplaint> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email, _phone, _description;
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.purpleAccent,
        title: new Text("Send your complaints"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Complaint()),
            );
          },
        ),
      ),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Mytextwidget(
              hint: 'enter your email',
              onClick: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _phone = value;
                });
              },
              hint: 'enter your phone',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _description = value;
                });
              },
              hint: 'tell us what happened',
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();

                  _store.addcomplaint(Complaint_model(
                    email: _email,
                    phone: _phone,
                    description: _description,
                  ));
                }
              },
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
