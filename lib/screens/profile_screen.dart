// ignore_for_file: library_private_types_in_public_api

import 'package:amor/screens/profile_details.dart';
import 'package:amor/screens/save_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/random_emoji_widget.dart';
import 'help_center_screen.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'search_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  RandomEmojiGenerator random = RandomEmojiGenerator();

  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var emoji = random.getRandomEmoji();
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: Text(' My \n Profile  $emoji',
                  style: const TextStyle(
                    fontFamily: 'GoogleSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    height: 1.75,
                  )),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 40),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 30),
                  child: Container(
                    width: 154.0,
                    height: 154.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(21, 153, 84, 1),
                        width: 6.0,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 75,
                        foregroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85, left: 20),
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: ImageIcon(
                        const AssetImage('assets/icons/profilepage/arrows.png'),
                        size: 24,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 11, bottom: 25),
                child: Text(
                  'Kristen Stewart',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xfff5f5f5))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const ProfileDetails();
                                },
                              ));
                            },
                            child: const Row(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                      'assets/icons/profilepage/iconperson1big.png'),
                                  size: 24,
                                  color: Color.fromRGBO(21, 153, 84, 1),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Account Information',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 15),
                        child: Builder(
                          builder: (BuildContext context) {
                            return ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xfff5f5f5)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const NotificationScreen();
                                  },
                                ));
                              },
                              child: const Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/profilepage/iconnotif.png'),
                                    size: 24,
                                    color: Color.fromRGBO(21, 153, 84, 1),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    ' Notification',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 15),
                        child: Builder(
                          builder: (BuildContext context) {
                            return ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xfff5f5f5),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const HelpCenterScreen();
                                  },
                                ));
                              },
                              child: const Row(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                        'assets/icons/profilepage/iconhelp.png'),
                                    size: 24,
                                    color: Color.fromRGBO(21, 153, 84, 1),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    ' Help Center',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 15),
                        child: Builder(
                          builder: (BuildContext context) {
                            return ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xfff5f5f5),
                                ),
                              ),
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) {
                                //     return const CreditCardScrenn();
                                //   },
                                // ));
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.credit_card,
                                      size: 24,
                                      color: Color.fromRGBO(21, 153, 84, 1)),
                                  SizedBox(width: 10),
                                  Text(
                                    ' Card details',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(
                        searchString: "",
                      ),
                    ),
                  );
                },
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SaveScreen(
                        searchString: "",
                      ),
                    ),
                  );
                },
                icon: const FaIcon(FontAwesomeIcons.solidHeart)),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.solidUser),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class RandomEmojiWidget extends StatefulWidget {
  const RandomEmojiWidget({super.key});

  @override
  _RandomEmojiWidgetState createState() => _RandomEmojiWidgetState();
}

class _RandomEmojiWidgetState extends State<RandomEmojiWidget> {
  final RandomEmojiGenerator emojiGenerator = RandomEmojiGenerator();
  String randomEmoji = '';

  @override
  void initState() {
    super.initState();
    generateRandomEmoji();
  }

  void generateRandomEmoji() {
    setState(() {
      randomEmoji = emojiGenerator.getRandomEmoji();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            randomEmoji,
            style: const TextStyle(fontSize: 64),
          ),
        ],
      ),
    );
  }
}
