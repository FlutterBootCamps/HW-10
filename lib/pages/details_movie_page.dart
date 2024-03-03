import 'package:amc_applicaition/bloc/cinema_bloc/bloc/cinema_bloc.dart';
import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/models/movie_model.dart';
import 'package:amc_applicaition/widget/available_location_widget.dart';
import 'package:amc_applicaition/widget/glass_container_widget.dart';
import 'package:amc_applicaition/widget/title_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/icons8.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';


class DetailsMoviePage extends StatefulWidget {
  const DetailsMoviePage({super.key, required this.movieModel});
  final NewMovieModel movieModel;

  @override
  State<DetailsMoviePage> createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CinemaBloc>(context).add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    final shadow = [
      const Shadow(
        color: Colors.black,
        blurRadius: 3,
      )
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: blackColor,
        body: Column(children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500${widget.movieModel.posterPath}"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: whiteColor,
                            shadows: shadow,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.movieModel.title!,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  shadows: shadow,
                                ),
                              ),
                              Text(
                                widget.movieModel.originalTitle!,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  shadows: shadow,
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.share_outlined,
                                  color: blueColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: whiteColor)),
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: whiteColor,
                        shadows: shadow,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('"https://image.tmdb.org/t/p/w500${widget.movieModel.posterPath}'),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      GlassContainerWidget(
                        child: TabBar(
                            indicatorColor: blueColor,
                            dividerHeight: 0,
                            indicatorWeight: 3,
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: greyColor,
                            labelColor: whiteColor,
                            labelStyle: const TextStyle(fontSize: 15),
                            tabs: const [
                              Tab(
                                text: "SHOWTIMES",
                              ),
                              Tab(text: "MOVIE DETAILS"),
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Column(
                            children: [
                              GlassContainerWidget(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(Icons.date_range_outlined,
                                            color: whiteColor),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Sat, Mar 02",
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Iconify(
                                            '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round"><path d="M5 12V4m14 16v-3M5 20v-4m14-3V4m-7 3V4m0 16v-9"/><circle cx="5" cy="14" r="2"/><circle cx="12" cy="9" r="2"/><circle cx="19" cy="15" r="2"/></g></svg>',
                                            color: whiteColor),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Filter",
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                              BlocBuilder<CinemaBloc, CinemaState>(
                                builder: (context, state) {
                                  if (state is SuccessState) {
                                    return Expanded(
                                      child: GlassContainerWidget(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              for (LocationData locationData
                                                  in state.locationList)
                                                AvailableLocationWidget(
                                                  locationData: locationData,
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Text("error");
                                  }
                                },
                              )
                            ],
                          ),
                          GlassContainerWidget(
                              isTransprant: true,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleSubtitleWidget(
                                      title: "Subtitle",
                                      subtitle: widget.movieModel.originalTitle!,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    titleSubtitleWidget(
                                      title: "Release Date",
                                      subtitle: widget.movieModel.releaseDate!,
                                    ),
                                    // const SizedBox(
                                    //   height: 30,
                                    // ),
                                    // titleSubtitleWidget(
                                    //   title: "Cast & Crew",
                                    //   subtitle: widget.movieModel.castCrew!,
                                    // ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    titleSubtitleWidget(
                                      title: "Synopsis",
                                      subtitle: widget.movieModel.overview!,
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
