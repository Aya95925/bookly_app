import 'package:bookly_app/Features/home/presentation/maneger/fetch_featured_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/maneger/fetch_newest_books/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<FeaturedBooksCubit>()..fetchFeaturedBooks(),
        ),

        BlocProvider(
          create: (context) => getIt<NewestBooksCubit>()..featchNewestBooks(),
        ),
      ],
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
