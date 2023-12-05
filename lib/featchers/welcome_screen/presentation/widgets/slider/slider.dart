import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({Key? key}) : super(key: key);

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  final InfiniteScrollController _controller = InfiniteScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // Replace this list with your actual list of widgets representing carousel items
  List<Widget> carouselItems = [
    const CircularBorderButton(
      icon1: Icons.cabin,
      icon2: Icons.cabin,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.abc,
      icon2: Icons.e_mobiledata,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.tab,
      icon2: Icons.abc_outlined,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.access_alarm,
      icon2: Icons.zoom_in,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.ac_unit_rounded,
      icon2: Icons.cabin,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.r_mobiledata,
      icon2: Icons.macro_off,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.macro_off,
      icon2: Icons.mail,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.vaccines,
      icon2: Icons.r_mobiledata,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.baby_changing_station,
      icon2: Icons.qr_code,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon1: Icons.dangerous,
      icon2: Icons.one_x_mobiledata,
      page: "Cartable",
    ),
    const CircularBorderButton(
      icon2: Icons.zoom_in,
      icon1: Icons.man_2,
      page: "Cartable",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.red, width: 2)),

            height: 200, // Adjust the height of the carousel items
            child: InfiniteCarousel.builder(
              controller: _controller,

              itemCount: carouselItems.length,
              itemExtent: 90, // Adjust the width of the carousel items
              itemBuilder: (context, itemIndex, realIndex) {
                return carouselItems[itemIndex];
              },
            ),
          ),
        ),
        SizedBox(
          height: 190,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      // Animate to the previous item
                      _controller.previousItem();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 40,
                      color: Colors.white,
                    )),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      _controller.nextItem();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 40,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CircularBorderButton extends StatelessWidget {
  const CircularBorderButton({
    required this.icon1,
    required this.icon2,
    required this.page,
    Key? key,
  }) : super(key: key);

  final IconData icon1;
  final IconData icon2;

  final String page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 70, minHeight: 70),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.amber,
                width: 2.0,
              ),
            ),
            child: MaterialButton(
              onPressed: () {},
              hoverColor: Colors.amber,
              shape: const CircleBorder(),
              child: Icon(
                icon1,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 70, minHeight: 70),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.amber,
                width: 2.0,
              ),
            ),
            child: MaterialButton(
              onPressed: () {},
              hoverColor: Colors.amber,
              shape: const CircleBorder(),
              child: Icon(
                icon2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
