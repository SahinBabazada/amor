import 'package:amor/services/get_categories.dart';
import 'package:amor/services/search_by_category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late String category;

  @override
  void initState() {
    super.initState();
    setState(() {
      category = widget.categoryName;
    });
  }

  void setCategory(String newCategoy) {
    setState(() {
      category = newCategoy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search by category")),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: FutureBuilder(
              future: getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(21, 153, 84, 1),
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('Data not found');
                }

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  (snapshot.data![index].name == category)
                                      ? const Color.fromRGBO(21, 153, 84, 1)
                                      : Colors.white,
                                ),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 175, 175, 175)),
                                  ),
                                )),
                            onPressed: () {
                              setCategory(snapshot.data![index].name);
                            },
                            child: Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                  color:
                                      (snapshot.data![index].name == category)
                                          ? Colors.white
                                          : Colors.black87),
                            )),
                      );
                    });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getProductByCategory(category),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(21, 153, 84, 1),
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('Data not found');
                }

                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
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
                                    icon: const FaIcon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 16,
                                        color: Colors.red),
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
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
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
                                        icon: const FaIcon(
                                            FontAwesomeIcons.solidStar,
                                            size: 12,
                                            color: Colors.orange),
                                      ),
                                    ),
                                    Text(
                                        snapshot.data![index].rating
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                            color: Colors.black26,
                                            fontSize: 12))
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
