import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class IconsMenu extends StatelessWidget {
  const IconsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {  }, icon: Icon(Iconsax.home),),
          IconButton(onPressed: () {  }, icon: Icon(Iconsax.home),),
          IconButton(onPressed: () {  }, icon: Icon(Iconsax.home),),
          IconButton(onPressed: () {  }, icon: Icon(Iconsax.home),),
        ],
      ),
    );
  }
}
