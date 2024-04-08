import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Featuredbooksitem extends StatelessWidget {
  const Featuredbooksitem({
    super.key, required this.imgurl,
  });
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AspectRatio(
            aspectRatio: 2.6 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                image: DecorationImage(
                  image: NetworkImage(
                    imgurl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GlassContainer(
          //     blur: 15,
          //     border: BorderSide.strokeAlignCenter,
          //     borderRadius: BorderRadius.circular(35),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         CupertinoIcons.play_arrow_solid,
          //         size: 18,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
