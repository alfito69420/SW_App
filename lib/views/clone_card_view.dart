import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:proyecto1/models/clon.dart';

import '../utils/colors_settings.dart';

class CloneCardView extends StatelessWidget {
  Clone clone;
  double pageOffset;
  late double animation;
  double animate = 0;
  double rotate = 0;
  double columnAnimation = 0;
  int index;

  CloneCardView(this.clone, this.pageOffset, this.index);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 60;
    double cardHeight = size.height * .55;
    double count = 0;
    double page;
    rotate = index - pageOffset;
    for (page = pageOffset; page > 1;) {
      page--;
      count++;
    }
    animation = Curves.easeOutBack.transform(page);
    animate = 100 * (count + animation);
    columnAnimation = 50 * (count + animation);
    for (int i = 0; i < index; i++) {
      animate -= 100;
      columnAnimation -= 50;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        buildTopText(),
        buildBackgroundImage(cardWidth, cardHeight, size),
        buildAboveCard(cardWidth, cardHeight, size),
        buildCupImage(size),
        buildBlurImage(cardWidth, size),
        buildSmallImage(size),
        buildTopImage(cardWidth, size, cardHeight),
      ],
    );
  }

  Widget buildTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Text(
            clone.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: clone.lightColor),
          ),
          Text(
            clone.conName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: clone.darkColor),
          )
        ],
      ),
    );
  }

  Widget buildBackgroundImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            clone.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildAboveCard(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: clone.darkColor.withOpacity(.50),
            borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.all(20),
        child: Transform.translate(
          offset: Offset(-columnAnimation, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Yakult',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: ColorsSettings.mAppGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '\$ 4',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '.70',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                clone.description,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
              const Spacer(),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Image.asset('assets/coffeeChallenge/cup_L.png'),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Image.asset('assets/coffeeChallenge/cup_M.png'),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Image.asset('assets/coffeeChallenge/cup_s.png'),
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   height: 40,
              //   decoration: BoxDecoration(
              //       color: mAppGreen, borderRadius: BorderRadius.circular(20)),
              //   child: const Center(
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: <Widget>[
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Text(
              //           '\$',
              //           style: TextStyle(fontSize: 20, color: Colors.white),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           '4.',
              //           style: TextStyle(fontSize: 19, color: Colors.white),
              //         ),
              //         Text(
              //           '70',
              //           style: TextStyle(fontSize: 14, color: Colors.white),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCupImage(Size size) {
    return Positioned(
        bottom: 50,
        right: -size.width * .3 / 3 + 30,
        child: Transform.rotate(
          angle: math.pi / 14 * rotate,
          child: Image.asset(
            clone.cupImage,
            height: size.height * .50 - 55,
          ),
        ));
  }

  Widget buildBlurImage(double cardWidth, Size size) {
    return Positioned(
      right: cardWidth / 2 - 67 + animate,
      bottom: size.height * .10,
      child: Image.asset(clone.imageBlur),
    );
  }

  Widget buildSmallImage(Size size) {
    return Positioned(
      right: -10 + animate,
      top: size.height * .3,
      child: Image.asset(clone.imageSmall),
    );
  }

  Widget buildTopImage(double cardWidth, Size size, double cardHeight) {
    return Positioned(
      left: cardWidth / 4 - animate,
      bottom: size.height * .15 + cardHeight - 25,
      child: Image.asset(clone.imageTop),
    );
  }
}
