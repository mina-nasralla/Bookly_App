import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Search/data/Cubit/search_cubit.dart';
import 'package:booklyapp/Features/Search/presentation/Search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      SearchCubit(getIt.get<HomeRepoEmpl>()),
      child:const Scaffold(
        body: Search_view_body(),
      ),
    );
  }
}
