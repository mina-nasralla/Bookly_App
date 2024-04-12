import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Core/utilites/widgets/Error_widget.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:booklyapp/Features/Search/data/Cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search_List extends StatelessWidget {
  const Search_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(getIt.get<HomeRepoEmpl>()),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SuccessSearch) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              child: ListView.builder(
                  itemCount: state.Books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Featuredbooksitem(
                      imgurl:
                          state.Books[index].volumeInfo.imageLinks?.thumbnail ??
                              '', bookModel: state.Books[index],)),
            );
          } else if (state is ErrorSearch) {
            return CustomErrorWidget(
              Errormssg: state.Error,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
