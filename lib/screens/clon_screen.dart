import 'package:flutter/material.dart';
import 'package:proyecto1/models/clon.dart';
import 'package:proyecto1/utils/colors_settings.dart';
import 'package:toastification/toastification.dart';
import '../views/clone_card_view.dart';

class CloneScreen extends StatefulWidget {
  const CloneScreen({super.key});

  @override
  State<CloneScreen> createState() => _CloneScreenState();
}
class _CloneScreenState extends State<CloneScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  double pageOffset = 0;
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
    pageController = PageController(viewportFraction: .8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtén el tamaño de la pantalla
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildToolbar(),
            buildLogo(size),
            buildPager(size),
            buildPageIndecator(),
          ],
        ),
      ),
    );
  }

  Widget buildToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                return Transform.translate(
                  offset: Offset(-200*(1-animation.value).toDouble(), 0),
                  child: Tooltip(
                    message: 'Mapa de Sucursales',
                    child: Image.asset(
                      'assets/coffeApp/location.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                );
              }
          ),
          Spacer(),
          AnimatedBuilder(
              animation: animation,
              builder: (context, snapshot) {
                return Transform.translate(
                  offset: Offset(-200*(1-animation.value).toDouble(), 0),
                  child: Image.asset(
                    'assets/coffeApp/drawer.png',
                    width: 30,
                    height: 30,
                  ),
                );
              }
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget buildLogo(Size size) {
    return Positioned(
        top: 10,
        right: size.width / 2 - 25,
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, snapshot) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0,size.height/2*(1-animation.value))
                  ..scale(1+(1-animation.value)),
                origin: Offset(25, 25),
                child: InkWell(
                  onTap: () {
                    if(controller.isCompleted){
                      controller.reverse();
                      toastification.show(
                        context: context,
                        style: ToastificationStyle.flatColored,
                        type: ToastificationType.success,
                        title: Text('¡Hasta la próxima!'),
                        autoCloseDuration: const Duration(seconds: 4),
                        closeButtonShowType: CloseButtonShowType.onHover,
                        showProgressBar: false,
                        alignment: Alignment.topCenter,
                      );
                    } else {
                      controller.forward();
                    }
                  },
                  child: Image.asset(
                    'assets/coffeApp/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              );
            }
        )
    );
  }

  Widget buildPager(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      height: size.height - 50,
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, snapshot) {
            return Transform.translate(
              offset: Offset(400*(1-animation.value).toDouble(),0),
              child: PageView.builder(
                  controller: pageController,
                  itemCount: getDrinks().length,
                  itemBuilder: (context, index) =>
                      CloneCardView(getDrinks()[index], pageOffset, index)),
            );
          }
      ),
    );
  }

  List<Clone> getDrinks() {
    List<Clone> list = [];
    list.add(Clone(
        'Tirami',
        'Sù',
        'assets/coffeApp/blur_image.png',
        'assets/coffeApp/bean_top.png',
        'assets/coffeApp/bean_small.png',
        'assets/coffeApp/bean_blur.png',
        'assets/coffeApp/cup.png',
        'then top with whipped cream and mocha drizzle to bring you endless \njava joy',
        ColorsSettings.mBrownLight,
        ColorsSettings.mBrown));
    list.add(Clone(
        'Green',
        'Tea',
        'assets/coffeApp/green_image.png',
        'assets/coffeApp/green_top.png',
        'assets/coffeApp/green_small.png',
        'assets/coffeApp/green_blur.png',
        'assets/coffeApp/green_tea_cup.png',
        'milk and ice and top it with sweetened whipped cream to give you \na delicious boost\nof energy.',
        ColorsSettings.greenLight,
        ColorsSettings.greenDark));
    list.add(Clone(
        'Triple',
        'Mocha',
        'assets/coffeApp/mocha_image.png',
        'assets/coffeApp/chocolate_top.png',
        'assets/coffeApp/chocolate_small.png',
        'assets/coffeApp/chocolate_blur.png',
        'assets/coffeApp/mocha_cup.png',
        'layers of whipped cream that’s infused with cold brew, white chocolate mocha and dark \ncaramel.',
        ColorsSettings.mBrownLight,
        ColorsSettings.mBrown));
    return list;
  }

  Widget buildPageIndecator() {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, snapshot) {
          return Positioned(
            bottom: 10,
            left: 10,
            child: Opacity(
                opacity: controller.value,
                child: Row(children: List.generate(getDrinks().length, (index)=>buildContainer(index)),)
            ),
          );
        }
    );
  }

  Widget buildContainer(int index) {
    double animate = pageOffset-index;
    double size = 10;
    animate = animate.abs();
    Color color = Colors.grey;
    if(animate <= 1 && animate >= 0){
      size = 10+10*(1-animate);
      color = ColorTween(begin: Colors.grey, end: ColorsSettings.mAppGreen).transform((1-animate))!;
    }
    return Container(
      margin: EdgeInsets.all(4),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
