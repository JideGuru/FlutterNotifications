import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String header;
  Home({Key key, this.header}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final TextEditingController _messageControl = new TextEditingController(

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      //AppBar
      appBar: AppBar(
        title: Text(
          widget.header,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),

        actions: <Widget>[
          IconButton(
              icon:Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              onPressed: () => _showAlertInfo(context)
          ),

//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () => debugPrint("1PRESSED!!!"),
//            color: Colors.blue,
//          )
        ],
      ),


      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Theme(
                data: ThemeData(
                  primaryColor: Colors.blueAccent,
                  primaryColorDark: Colors.blue,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: TextField(
                    controller: _messageControl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      hintText: "Message",
                      labelText: "Message",
//                      helperText: 'Registered Emails Only',

                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 30.0),
                height: 50.0,
                child: RaisedButton(
                  elevation: 8.0,
                  color: Colors.blue,
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: (){
                    print("pressed");
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }



  //Function to Show Alert Dialog for showing app details
  void _showAlertInfo(BuildContext context){
    var alert = new AlertDialog(
      title: Text("Info"),
      content: Text("Made With Flutter by JideGuru"),

      actions: <Widget>[

        FlatButton(
          onPressed: (){Navigator.pop(context);},
          child: Text("OK"),
        )
      ],
    );

    showDialog(context: context, builder: (context)=> alert);
  }
}
