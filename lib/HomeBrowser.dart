import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';

import 'Zarinpal.dart';





class HomeBrowser extends StatefulWidget {
  HomeBrowser({Key key, this.title}) : super(key: key);
  final String title;
  var authority;



  @override
  _HomeBrowserState createState() => _HomeBrowserState();
}

class _HomeBrowserState extends State<HomeBrowser> with WidgetsBindingObserver {


  String show = "تراکنش انجام نشده است";

  
  Zarinpal zarinpal=new Zarinpal();


zarinPalRequest(){


 zarinpal.setPaymentRequest(
    description: "test",
   amount: 1001,
   callBackURL: "retuern://zarinpalpayment",
   email: "0",
   mobile: "0",
   merchantID: "424baadf-ea4c-4744-b29e-5eb62a855821"
 );

  zarinpal.makePostRequest().then((value) =>setState((){
    show=value;
  }));


}

/*zarinPalRequestSandbox(){
  paymentRequestZarinpal.setPaymentRequestSandBox(
      description: "test",
      amount: 101,
      callBackURL: "retuern://zarinpalpayment",
      email: "",
      mobile: "",
      merchantID: "424baadf-ea4c-4744-b29e-5eb62a855821"
  );

  paymentRequestZarinpal.makePostRequestSandBox().then((value) =>setState((){
    if(value != null){
      show=value;

    }else {
      show ='null';
    }
  }));

}*/

zarinPalVerify(){

  zarinpal.makePostVerify().then((value) =>setState((){
   show=value;
    print(value);
  }));
}

/*zarinpalVerifySandBox(){

  paymentRequestZarinpal.makePostVerifySandBox().then((value) =>setState((){
  //  show=value;
   // print(value);
      show=value;

  }));
}*/




 @override
  void initState() {
    // TODO: implement initState

   setState(() {
   });

super.initState();
WidgetsBinding.instance.addObserver(this);

  }
  @override
  void onResumed() {
  zarinPalVerify();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
@override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    super.didChangeAppLifecycleState(state);
     switch(state){
       case AppLifecycleState.paused :

         break;
       case AppLifecycleState.resumed:

         setState(() {
         onResumed();
      });


         break;
       case AppLifecycleState.inactive:

         break;
       case AppLifecycleState.detached:

         break;
     }
  }
  @override
  Widget build(BuildContext context) {


    const String toLaunch = 'zarinpal flutter ';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(toLaunch),
              ),
              RaisedButton(
                onPressed: () => setState(() {
                  zarinPalRequest();

                }),
                child: const Text('zarinpal request'),
              ),


         Text(show),

            ],
          ),
        ],
      ),
    );
  }
}