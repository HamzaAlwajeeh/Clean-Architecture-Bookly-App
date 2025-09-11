import 'package:bookly_app/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/Home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/Search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/controllers/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/set_up_service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailsView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => SimilarBooksCubit(
                    FetchSimilarBooksUseCase(
                      homeRepos: getIt.get<HomeRepoImpl>(),
                    ),
                  ),
              child: BookDetailsView(book: state.extra as BookEntity),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
