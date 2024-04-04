import 'package:booklyapp/Features/Home/presentation/views/widgets/BestSellerListViewItems.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
              IconButton(
                onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.close),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width *.25,),
              const Text('Search',style: TextStyle(fontSize: 30),)
            ],),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  BestSellerListViewItems(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}