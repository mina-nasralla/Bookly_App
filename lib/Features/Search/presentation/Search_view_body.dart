// ignore_for_file: avoid_print

import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Core/utilites/widgets/Error_widget.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Search/data/Cubit/search_cubit.dart';
import 'package:booklyapp/Features/Search/presentation/views/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search_view_body extends StatelessWidget {
  const Search_view_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<HomeRepoEmpl>()),
      child: BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .25,
                      ),
                      const Text(
                        'Search',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search, color: Colors.white),
                          ),
                          Expanded(
                            child: TextField(
                              onSubmitted: (valou) {
                                SearchCubit.get(context)
                                    .fetchSearchedBooks(Search: valou);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SuccessSearch) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 1.5,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Search_List_View_Items(
                                bookModel: state.Books[index],
                                imgurl: state.Books[index].volumeInfo.imageLinks
                                        ?.thumbnail ??
                                    '',
                              ),
                            ),
                            itemCount: state.Books.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    Divider(height: 18,),
                          ),
                        );
                      } else if (state is ErrorSearch) {
                        return CustomErrorWidget(
                          Errormssg: state.Error,
                        );
                      } else if (state is LoadingSearch) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Search Now',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, SearchState state) {},
      ),
    );
  }
}
