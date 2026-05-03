import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/cubit/fetch_featured_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/cubit/fetch_newest_books/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_app/core/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..loadFeaturedBooks(),
          ),

          BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())..loadNewestBooks(),
          ),
        ],

        child: HomeViewBody(),
      ),
    );
  }
}
