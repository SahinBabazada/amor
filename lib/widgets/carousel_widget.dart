import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() {
    return _CarouselSliderWidgetState();
  }
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List newsList = ["1", "2", "3"];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            disableCenter: true,
            enlargeCenterPage: false,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
            autoPlay: false,
            height: 180,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: sliderItems(newsList),
        ),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: newsList.length,
          effect: const ExpandingDotsEffect(
            expansionFactor: 2,
            offset: 16.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
            spacing: 4.0,
            radius: 8.0,
            strokeWidth: 1.0,
            dotColor: Color.fromRGBO(210, 210, 209, 1),
            activeDotColor: Color.fromRGBO(21, 153, 84, 1),
          ),
        ),
      ],
    );
  }
}

List<Container> sliderItems(List carouselItems) {
  return carouselItems
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
            child: Stack(
              children: [
                Image.network(
                  "https://assets.adidas.com/images/w_600,f_auto,q_auto/f9d52817f7524d3fb442af3b01717dfa_9366/Runfalcon_3_Cloudfoam_Low_Running_Shoes_Black_HQ3790_01_standard.jpg",
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 85, 85, 85).withOpacity(0.6),
                        const Color.fromARGB(255, 14, 13, 13),
                      ],
                      stops: const [
                        0.0,
                        1.0,
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  top: 20,
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Collection",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        Text(
                          "Discount 50% for the first transaction",
                          style: TextStyle(color: Colors.white54, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(21, 153, 84, 1).withAlpha(60),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: const Offset(
                          0.0,
                          10.0,
                        ),
                      ),
                    ]),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(21, 153, 84, 1),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(16, 4, 16, 4),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();
}
