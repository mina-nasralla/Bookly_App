import 'package:booklyapp/Core/utilites/App_Styles/style.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_Books_List.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('BooKly',style: TextStyle(fontSize: 35),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 35,))
                ],
              ),
            ),
            const FeaturedBooksList(),
            const SizedBox(height: 35,),
            const Text('Best Seller',style: Style.title,),
            const BestSellerListViewItems()
          ],
        ),
      ),
    );
  }
}

class BestSellerListViewItems extends StatelessWidget {
  const BestSellerListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          const SizedBox(width: 30,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Soul ',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              const Text('Olivia Wilson ',style: TextStyle(fontSize: 20,color: Colors.white70),),
              Row(
                children: [
                  const Text('19.99 ',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                  const Text('€',style: TextStyle(fontSize: 17),),
                  SizedBox(width: MediaQuery.sizeOf(context).width * .14,),
                  const Icon(Icons.star,color: Colors.yellow,size: 20,),
                  const Text('4.8',style: TextStyle(fontSize: 17),),
                  const SizedBox(width: 8,),
                  const Text('( 2631 )',style: TextStyle(fontSize: 15,color: Colors.grey),),
                ],
              ),


            ],
          ),
      
        ],
      ),
    );
  }
}



