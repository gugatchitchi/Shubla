import 'package:flutter/material.dart';
import 'package:shubla/configs/configs.dart';

class CategoriesCard extends StatelessWidget {
  final String imageName;
  final String text;
  final Color color;
  final Function onTap;
  const CategoriesCard({
    Key key,
    @required this.imageName,
    @required this.text,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It let us use relative sizes, ex: 40% of the width
    SizeConfig().init(context);
    // Material app wraprs inkwell to give the background collor
    // InkWell returns the tapping feedback
    // Container is just to give image width and heigth options
    // Below them all is the category text
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          splashColor: Palette.bg,
          onTap: onTap,
          child: Column(
            children: [
              Container(
                // Image would stretch 40% of the device width
                width: SizeConfig.blockSizeHorizontal * 35,
                height: SizeConfig.blockSizeHorizontal * 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/$imageName.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
