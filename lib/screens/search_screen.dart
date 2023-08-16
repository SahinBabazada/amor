import 'package:amor/services/search_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.searchString});
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchProducts(searchString),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('Data not found');
        }

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              snapshot.data![index].thumbnail,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.solidHeart,
                                  size: 16, color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           SizedBox(
                              width: 105,
                              child: Text(
                                snapshot.data![index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              )),
                          Row(
                            children: [
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: const FaIcon(FontAwesomeIcons.solidStar,
                                      size: 12, color: Colors.orange),
                                ),
                              ),
                               Text(snapshot.data![index].rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                      color: Colors.black26, fontSize: 12))
                            ],
                          )
                        ],
                      ),
                      Text("\$${snapshot.data![index].price}")
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
