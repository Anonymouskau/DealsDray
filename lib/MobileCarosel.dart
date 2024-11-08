import 'package:flutter/material.dart';
  class Mobilecarosel extends StatefulWidget {
    const Mobilecarosel({super.key});

    @override
    State<Mobilecarosel> createState() => _CarouselExampleState();
  }

class _CarouselExampleState extends State<Mobilecarosel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
      
        constraints: const BoxConstraints(maxHeight: 600),
        child: CarouselView(
          itemExtent: 330,
          shrinkExtent: 180,
          children: List<Widget>.generate(4, (int index) {
            return UncontainedLayoutCard();
          }),
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Image.network('https://5.imimg.com/data5/PX/WQ/MN/SELLER-38271709/mobile-1000x1000.png')
          ),
       Text("Nokia")
        ],
      ),
    );
  }
}