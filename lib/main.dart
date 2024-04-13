import 'package:booklyapp/Core/bloc_observer.dart';
import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Newset_Books_Cubit/newset_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/Home.dart';
import 'package:booklyapp/Features/splach/presentation/views/splash_screen.dart';
import 'package:booklyapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupGititLocaator();
  runApp(const Bookly());
  Bloc.observer = SimpleBlocObserver();

}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoEmpl>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
            create: (context) => NewsetBooksCubit(getIt.get<HomeRepoEmpl>())..fetchNewsetBooks(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookly App',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Kprimarycolor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            )),
        home: const SplashScreen(),
      ),
    );
  }
}
