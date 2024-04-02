import 'package:booklyapp/Features/Home/presentation/views/widgets/BestSellerListViewItems.dart';
import 'package:flutter/material.dart';

class BestSellersListView extends StatelessWidget {
  const BestSellersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
       const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BestSellerListViewItems(),
      ),
      itemCount: 10,
    );
  }
}
