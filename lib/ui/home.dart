import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dio/dio.dart';


class Home extends StatefulWidget {

  final String header;
  Home({Key key, this.header}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final TextEditingController _messageControl = new TextEditingController(

  );


  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');

//        Map json = jsonDecode(message.toString());
//        print(json['notification'].toString());
        _showNotif(context, "$message");
//        print(json['notification']['body']);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }


  void _sendNotif(){
    setState(() async {
      if(_messageControl.text.isEmpty){

      }else{
//        var DATA='{"notification": {"body": "this is a body","title": "this is a title"}, "priority": "high", "data": {"click_action": "FLUTTER_NOTIFICATION_CLICK", "id": "1", "status": "done"}, "to": "fEJLnLR2dc0:APA91bGI-YqNkQBfxmlqhzzCw0-8snQTza1i636RgKQecEY0_ymlm-wQD2mG-jk9c3Bpt6Jlw_HrrTR-O1PkZSRv369CtpFGv280H8OVWKk-ASVqfhc-LIYixmWiDOH9SwsI7VeaMNfk"}';
//        curl https://fcm.googleapis.com/fcm/send -H "Content-Type:application/json" -X POST -d "$DATA" -H "Authorization: key=AAAAP84W5NU:APA91bEP8tukYVX0HgLPlrJVffBY5urEoKCbNUWeQAgFhAbpOAJ0FUT9GSC-vF7mjyV0b4RXGUv8AJGiq_oaiShNHKIc0HtnodJyxIgDP5fYGcllc4xsRGpjiKDMJzfRggeb_BUJwDKO"
//        Response response;
//        Dio dio = new Dio();
//        response = await dio.post("https://fcm.googleapis.com/fcm/send", data: {"id": 12, "name": "wendu"});

      }
    });
  }

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
                    _sendNotif();
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

  void _showNotif(BuildContext context, String body){
    var alert = new AlertDialog(
      title: Text("Notification"),
      content: Text("$body"),

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
