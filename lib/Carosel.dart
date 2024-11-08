import 'package:flutter/material.dart';
class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: CarouselView(
          itemExtent: 330,
          shrinkExtent: 200,
          children: List<Widget>.generate(20, (int index) {
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
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Image.network(fit: BoxFit.cover,'https://scontent.fpnq10-1.fna.fbcdn.net/v/t1.6435-9/53453763_2084151951672068_4637023830097788928_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=127cfc&_nc_ohc=YwI27d48KTgQ7kNvgEYfurv&_nc_zt=23&_nc_ht=scontent.fpnq10-1.fna&_nc_gid=AZbGhjKC3zPNHWEZHZjm0bj&oh=00_AYBei3vLMAdBVu5Zei1SdA_6wnDnWkXuGd9tbIxQKGTMQQ&oe=67556DFB')
      ),
    );
  }
}
