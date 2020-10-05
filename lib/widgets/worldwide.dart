import 'package:flutter/material.dart';

class WorldWide extends StatelessWidget {
  final  Map worldData;
  const WorldWide({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:   2,
          childAspectRatio: 2,
        ),

        children: [

          StatusPanel(
            title: 'CONFIRMED',
            textColor: Colors.white,
            panelColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            textColor: Colors.white,
            panelColor: Colors.orange,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            textColor: Colors.white,
            panelColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'TOTAL DEATH',
            textColor: Colors.white,
            panelColor: Colors.blueGrey[500],
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({
    Key key,
    this.panelColor,
    this.textColor,
    this.title,
    this.count
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: panelColor,
      ),
      margin: EdgeInsets.all(10),

      height: 80,
      width: width/2,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          ),

          Text(count,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
            color: textColor,
          ),
          ),
        ],
      ),
    );
  }
}

