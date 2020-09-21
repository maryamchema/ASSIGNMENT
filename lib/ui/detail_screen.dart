


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var detaill;
class DetailScreen extends StatefulWidget {
  final detail;
  DetailScreen({this.detail});
  @override
  Detail createState() => Detail();
}
class Detail extends State<DetailScreen> {
  @override
  void initState() {
   detaill  = widget.detail;
   print(detaill['rating']);
   super.initState();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text(detaill['title'],style: TextStyle(color:Colors.black),),
        centerTitle: true,
        iconTheme: IconTheme.of(context),
      ),
      body: ListView(
        padding: EdgeInsets.only(left:10,right:10),
        children:[
          Container(
            margin: EdgeInsets.only(top:10,bottom:10),
            height: 100,
            child:  Image.network("https://wedo-api.technationme.com${detaill['image']}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.green,
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top:10),               
                child: Column(
                  children: <Widget>[
                    Text(detaill['rating'].toString(),style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
                    Text("Rated by User",style: TextStyle(color:Colors.white,fontSize: 10))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                   color: Colors.black,
                ),
                margin: EdgeInsets.only(top:10),
                padding: EdgeInsets.all(10),                
                child: Column(
                  children: <Widget>[
                    Text(detaill['startingPrice'].toString(),style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
                    Text("Starting from",style: TextStyle(color:Colors.white,fontSize: 10))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top:10),               
                child: Column(
                  children: <Widget>[
                    Text(detaill['numberOfBookings'].toString(),style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),
                    Text("Done so far",style: TextStyle(color: Colors.white,fontSize: 10),)
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:15),
            child: Text("House cleaning includes:"),
          ),
          Column(
            children: des(detaill['description'])
          ),
          Container(
            margin: EdgeInsets.only(top:10,bottom:10,left:25,right: 25),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20),
                color: Colors.green,
            ),
            child: Text("Book this service",textAlign: TextAlign.center,)
          )
        ]
      ) ,
    );
  }
  List<Widget> des(data) {
    List<Widget> listdes = List<Widget>();
    for(int i =0; i< data.length; i++){
      listdes.add(       
        Row(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 10,right:10,top:10),
              child: Icon(FontAwesomeIcons.checkCircle,color: Colors.green,)),
            Text(data[i],style: TextStyle(color: Colors.black,fontSize: 10),)
          ]
        )
      );
    }
    return listdes;
  }
}