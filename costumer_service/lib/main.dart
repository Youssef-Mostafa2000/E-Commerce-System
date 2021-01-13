import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
)
);

    class Home extends StatefulWidget {
      @override
      _HomeState createState() => _HomeState();
    }

    class _HomeState extends State<Home> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(

          title : Text('Costumer Service'),
              centerTitle: true ,
            backgroundColor: Colors.black54,
          ),
        body:

        Padding(
          padding: const EdgeInsets.fromLTRB(10,100,10,0.0),
          child: Column(

            children: [
              CircleAvatar( backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
radius: 50,backgroundColor: Colors.white,
              )
              ,TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your Name'
              ),
            ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter your Complain'
                ),
              ),
              RaisedButton.icon(
                  onPressed: (){} ,
                  icon: Icon(
                      Icons.mail_rounded
                  ),
                  label: Text('Send')
                  ,color: Colors.blue[200],

              )

            ],
          ),
        ),
        );
      }
    }
