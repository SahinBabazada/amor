import 'package:amor/screens/categories_screen.dart';
import 'package:amor/services/get_categories.dart';
import 'package:flutter/material.dart';

class CategoriesSliderWidget extends StatelessWidget {
  const CategoriesSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('Data not found');
          }

          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 0, 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 24.0, 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CategoryScreen(categoryName: "all"),
                              ),
                            );
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                                color: Color.fromRGBO(46, 163, 102, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                    categoryName: snapshot.data![index].name),
                              ),
                            );
                          },
                          child: Container(
                            width: 120,
                            height: 120,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(246, 246, 246, 1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data![index].name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
