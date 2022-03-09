import 'package:flutter/material.dart';
import 'package:mzlibsample/Model/jsonresponsestaus_error.dart';
import 'package:mzlibsample/service/authservice.dart';
// import 'package:mezzofylib/mezzofylib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mezzofy lib',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() async{
   AuthenticationService authenticationService=new AuthenticationService();
  //  try{
  //  String response=await authenticationService.getAuthenticationToken("DPF2FNJSFVWPO8TD", "EEYK");
  //  debugPrint('response   '+response);
  //  }on JsonResponseStatusException catch (e) {
  //     debugPrint('Error Exception' + (e.message));
  //  }
 try{
   String response=await authenticationService.getCouponlistByStatus(0, 20, "R","ONQ4NG" , "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkRQRjJGTkpTRlZXUE84VEQiLCJwYXNzd29yZCI6IkVFWUsiLCJpYXQiOjE2NDY3NDA1NjMsImV4cCI6MTY0Njc2OTM2M30.vgGn9dLY7gpZ__u7RBpsfoo6aMyQ-YQFE-p0SYFFyhQ");
   debugPrint('response   '+response);
   }on JsonResponseStatusException catch (e) {
      debugPrint('Error Exception' + (e.message));
   }
   super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
