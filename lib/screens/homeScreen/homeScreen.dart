import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_predictor/screens/NavBar/NavBar.dart';
// ignore: unused_import
import 'package:stock_predictor/screens/about/aboutScreen.dart';



class homeScreen extends StatefulWidget {
  static const String routeName = '/intro';
  
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _AppState();
}

class _AppState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.black, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image:AssetImage('assets/images/three.jpg'),
              fit: BoxFit.fill
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Stock', style: TextStyle(color: Colors.white, fontSize: 30),) ,
                  SizedBox(height: 2,),
                  Text('Predictor', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      prefixIcon:   Icon(Icons.search, color: Colors.white,),
                      hintText: "Search your stock here...",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                  ),
                ] 
              ),
            )
          ],
        ),
      ),
    );  
  }
  
}
