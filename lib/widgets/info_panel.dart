
import 'package:corona_meter/datasource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryBlack,
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
            height: 50,


            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('FAQs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    launch('https://www.mohfw.gov.in/pdf/FAQ.pdf');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Icon(Icons.arrow_forward,
                    color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryBlack,
            ),
            margin: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
            height: 50,

            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('DONATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 2
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    launch('https://www.pmcares.gov.in/en/web/contribution/donate_india');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Icon(Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryBlack,
            ),
            margin: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
            height: 70,

            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text('HelpLine No : 011-22307145',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.5
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
