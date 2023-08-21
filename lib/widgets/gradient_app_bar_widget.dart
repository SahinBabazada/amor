import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(0, 83, 40, 1), Color.fromRGBO(1, 134, 63, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 130,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8fDA%3D&w=1000&q=80', // Replace with your image URL
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
