import 'package:booklyapp/Features/Home/presentation/views/Book_Detailes_View.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItems extends StatelessWidget {
  const BestSellerListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookDetailes()));
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/1.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * .5,
                      child: const Text(
                        'Harry Potter and the Goblet of Fire ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Olivia Wilson ',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    children: [
                      Text(
                        '19.99 ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '€',
                        style: TextStyle(fontSize: 17),
                      ),
                      // SizedBox(
                      //   width: MediaQuery.sizeOf(context).width * .15,
                      // ),
                      Spacer(),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '4.8',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '(2631)',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
