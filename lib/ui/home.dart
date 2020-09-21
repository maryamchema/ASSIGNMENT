
import 'package:asignment/models/sider_model.dart';
import 'package:asignment/ui/detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:asignment/bloc/slider_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  @override 
  void initState() {
    super.initState();
    var data = sliderBloc.getSliderData();
    print("data=-=-=-=6-0-0-0-0-0-0-0-0-0$data");
    cityBloc.getCitiesData();
    catogoryBloc.getCatData();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        body:  ListView(
          children: <Widget>[
            StreamBuilder(
              stream:  sliderBloc.sliderdata,
              builder: (context, AsyncSnapshot<SliderModel> snapshotSlider) {
                if(snapshotSlider.hasData) {
                 return sliderWidget(snapshotSlider.data.getSlidersData);
                }
                return Container(
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                );
              }
            ),
          ],
        )
    );
  }
  
  Widget sliderWidget(data) {
    return  Column(
      children: <Widget>[
        Stack(
          children: <Widget>[        
            carousel(data['sliders']),                    
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Popular Services"),
              dropDown()               
            ],
          ),
          showItems()      
      ],
    );
  }
  Widget showItems()  {
    return StreamBuilder(
      stream: catogoryBloc.catdata,
      builder: (context, AsyncSnapshot<CatogoriesModel> snapshotCat) {
        if(snapshotCat.hasData){
          var dataToShow = snapshotCat.data.getCAtData['categories'];
          return Container(
            margin: EdgeInsets.only(left:10,right:10),
            height: MediaQuery.of(context).size.height/1.90,
            child: Container(
              height: 30,
              child:  GridView.count(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 3.1),
                children: dataToShow.map<Widget>((data){
                  return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(detail:data)));
                  },
                  child:  Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Center(
                          child: Image.network("https://wedo-api.technationme.com${data['image']}",height: 50,)
                        ),
                        Text(data["title"])
                      ]
                    )
                  ),
                );
                }).toList(),         
              )
            )                       
          );         
        }
        return Container(
          child: Center(
            child: Text('')
          ),
        );
      });   
  }
  Widget dropDown() {
    String values = "select city";
    return StreamBuilder(
      stream:  cityBloc.citydata,
      builder: (context, AsyncSnapshot<CitiesModel> snapshotcity) {   
        if(snapshotcity.hasData) {
          List city = snapshotcity.data.getCitiesData['cities'];        
          return Container(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(                
                items: city.map((val){
                  return DropdownMenuItem(
                    value: val['name'],
                    child: new Text(val['name'].toString(),style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    values = val;
                  });
                  cityBloc.getCitiesData();
                },
                hint: Row(                
                  children: <Widget>[
                    Icon(FontAwesomeIcons.locationArrow,color: Colors.green,),
                    Text(values,style: TextStyle(color: Colors.black,fontSize: 10)),
                  ],
                ),
            ) ),
          );
        }
        return Container(
          child: Center(
            child: Text('')
          ),
        );
      }
    );     
  }
  Widget carousel(imageData) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          // height:MediaQuery.of(context).size.height/1.7,
          scrollDirection: Axis.horizontal,                   
          enableInfiniteScroll: false,
          viewportFraction: 1.2,
          enlargeCenterPage: true,
          aspectRatio: MediaQuery.of(context).size.aspectRatio/0.4,
          initialPage: 0,   
          reverse: false,
          ),
          itemCount: imageData.length,       
          itemBuilder: (context, i){ 
            return Image.network("https://wedo-api.technationme.com${imageData[i]['image']}",fit: BoxFit.cover, width: 1000);    
          }    
      ),
    ); 
  }
}