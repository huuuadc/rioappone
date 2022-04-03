import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "https://toigingiuvedep.vn/wp-content/uploads/2021/01/anh-cute-anime-meo.jpg",
                fit: BoxFit.cover,
              );
            },
            itemCount: 3,
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ),
        ),
        ListTile(
          title: const Text("ABCD"),
          subtitle: const Text("Hahahahaha"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("ABCD"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("ABCD"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("ABCD"),
          onTap: () {},
        ),
        ListTile(
          title: const Text("ABCD"),
          onTap: () {},
        ),
      ],
    ));
  }
}
