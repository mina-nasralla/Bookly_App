import 'package:booklyapp/Core/utilites/App_Styles/style.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/BestSellersListView.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_Books_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'BooKly',
                            style: TextStyle(fontSize: 30),
                          ),
                          // Animated logo
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                    const FeaturedBooksList(),
                    const SizedBox(
                      height: 35,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Best Seller',
                        style: Style.title,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SliverFillRemaining(
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BestSellersListView(),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            child: GlassContainer(
              borderRadius: BorderRadius.circular(40),
              border: BorderSide.strokeAlignCenter,
              blur: 10,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.book_solid,size: 25,)),
                    IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.bookmark_fill,size: 25,)),
                    IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.music_albums_fill,size: 25,)),
                    GlassContainer(
                      width: 50,
                      height: 60,
                      borderRadius: BorderRadius.circular(35),
                      child: Image(image: AssetImage('assets/images/1.jpg'),fit: BoxFit.cover,),
                    )
               ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

