import 'package:flutter/material.dart';
import 'menu_item.dart';

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const search = MenuItem('Search', Icons.search);
  static const saved = MenuItem('Saved', Icons.save);
  static const profile = MenuItem('Profile', Icons.account_box);

  static const all = <MenuItem>[
    home,
    search,
    saved,
    profile,
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(21, 153, 84, 1),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 80.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_orLK7yEay_HJnmJTWymHI848UNyuemtmNA&usqp=CAU'),
                  radius: 40.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        child: ListTile(
          selectedColor: Colors.black54,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}
