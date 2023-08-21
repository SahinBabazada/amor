import 'package:flutter/material.dart';
import '../widgets/gradient_app_bar_widget.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: GradientAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 40, right: 35),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  labelText: 'Kristen Stewart',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GoogleSans',
                  )),
              readOnly: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40, right: 35),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.female,
                    color: Colors.purple,
                  ),
                  labelText: 'Female',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GoogleSans',
                  )),
              readOnly: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40, right: 35),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  labelText: 'kristenstewart1@gmail.com',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GoogleSans',
                  )),
              readOnly: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40, right: 35),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.purple,
                  ),
                  labelText: '+994 50 999 99 99',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GoogleSans',
                  )),
              readOnly: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40, right: 35),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_pin,
                    color: Colors.purple,
                  ),
                  labelText: 'Azerbaijan, Baku',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GoogleSans',
                  )),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}

