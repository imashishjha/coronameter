import 'dart:convert';
import 'package:corona_meter/datasource.dart';
import 'package:corona_meter/widgets/worldwide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/info_panel.dart';
import 'widgets/mostAffectedPanel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;

  fetchWorlWideData()async{
    http.Response response=await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData= json.decode(response.body);
    });
  }

  List countryData;

  fetchcountryData()async{
    http.Response response=await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countryData= json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorlWideData();
    fetchcountryData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        title: Text('COVID -19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              color: Colors.grey[200],
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage('https://indiainternationaltimes.com/wp-content/uploads/2020/08/coronavirus-620x330.jpg'),
                  ),
                  Positioned(
                      left: (MediaQuery.of(context).size.width)/34,
                      top: (MediaQuery.of(context).size.width)/6,
                      child: Container(
                        height: 70,
                        width: 400,
                        child: Text(DataSource.quote,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      ),
                  )
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WorldWide',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('Regional',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

           worldData==null?CircularProgressIndicator(): WorldWide(worldData: worldData,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Text('Affected Countries',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),

            SizedBox(height: 10,),
            countryData==null?Container():MostAffectedCon(countryData: countryData,),

            SizedBox(height: 15,),

            InfoPanel(),

            SizedBox(height: 30,),

            Center(child: Text('"Lets defeat CoronaVirus by staying home"',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]
            ),)),
            SizedBox(height: 10,),
            Center(
              child: Text('App By ASHISH',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
