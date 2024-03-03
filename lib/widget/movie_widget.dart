import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/movie_model.dart';
import 'package:amc_applicaition/pages/details_movie_page.dart';
import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  MovieWidget({super.key, required this.movie});
  NewMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsMoviePage(
                    movieModel: movie,
                  ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 300,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    fit: BoxFit.cover,
                    height: 290,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor),
                            color: Colors.black45,
                          ),
                          // child: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     movie.adult!,
                          //     style:
                          //         const TextStyle(fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      movie.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
