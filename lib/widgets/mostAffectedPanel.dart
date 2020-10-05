import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostAffectedCon extends StatelessWidget {
  final List countryData;

  const MostAffectedCon({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,

        itemCount: 100,
        itemBuilder: (BuildContext context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                    countryData[index]['countryInfo']['flag'],
                    height: 30 ,
                    width:  50,
                ),

                SizedBox(width: 20,),

                Text(countryData[index]['country'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
                ),

                SizedBox(width: 20,),

                Text('Deaths:'+ countryData[index]['deaths'].toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
