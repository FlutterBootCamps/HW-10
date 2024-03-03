import 'package:amc_applicaition/bloc/movie_bloc/movie_bloc.dart';
import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/movie_model.dart';
import 'package:amc_applicaition/widget/appbar_row.dart';
import 'package:amc_applicaition/widget/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieBloc>(context).add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: blackColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: whiteColor,
          shape: const CircleBorder(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Iconify(
                '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="none" stroke="#b51a00" stroke-linecap="round"><path d="M5 12V4m14 16v-3M5 20v-4m14-3V4m-7 3V4m0 16v-9"/><circle cx="5" cy="14" r="2"/><circle cx="12" cy="9" r="2"/><circle cx="19" cy="15" r="2"/></g></svg>'),
            Text(
              "Filter",
              style: TextStyle(fontSize: 10, color: blackColor),
            )
          ]),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                RowAppBar(
                  pageName: "AMC Cinemas",
                ),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                    indicatorColor: blueColor,
                    dividerHeight: 0,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: greyColor,
                    labelColor: whiteColor,
                    labelStyle: const TextStyle(fontSize: 15),
                    tabs: const [
                      Tab(
                        text: "NOW PLAYING",
                      ),
                      Tab(text: "COMING SOON"),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: BlocBuilder<MovieBloc, MovieState>(
                          builder: (context, state) {
                            if (state is SuccessState) {
                              return Wrap(
                                children: [
                                  // to show the list of movies
                                  for (NewMovieModel movie in state.movieList)
                                    // if (movie.type == "now playing")
                                    MovieWidget(movie: movie)
                                ],
                              );
                            } else if (state is MovieLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return const Center(child: Text("Error"));
                            }
                          },
                        ),
                      ),
                      ListView(
                        children: [
                          SingleChildScrollView(
                            child: BlocBuilder<MovieBloc, MovieState>(
                              builder: (context, state) {
                                if (state is SuccessState) {
                                  return Wrap(
                                    children: [
                                      // to show the list of movies
                                      for (NewMovieModel movie
                                          in state.movieList)
                                        // if (movie.type == "coming soon")
                                        MovieWidget(movie: movie)
                                    ],
                                  );
                                } else {
                                  return const Text("Error");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
