import 'package:booklyapp/Core/utilites/App_Styles/style.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/BestSellersListView.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_Books_List.dart';
import 'package:booklyapp/Features/Search/presentation/views/Search_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'BooKly',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      // AnimatedTitle(),
                      // WaveAnimation(),
                      IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Search())),
                          icon: const Icon(
                            Icons.search,
                            size: 35,
                          )),
                    ],
                  ),
                ),
                const FeaturedBooksList(),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
          // Wrap BestSellersListView with SizedBox to limit height
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: BestSellersListView(),
            ),
          ),
        ],
      ),
    );
  }
}