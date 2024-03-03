import 'package:amc_applicaition/bloc/cinema_bloc/bloc/cinema_bloc.dart';
import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/widget/appbar_row.dart';
import 'package:amc_applicaition/widget/our_cinemas_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class OurCinemasPage extends StatefulWidget {
  const OurCinemasPage({super.key});

  @override
  State<OurCinemasPage> createState() => _OurCinemasPageState();
}

class _OurCinemasPageState extends State<OurCinemasPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CinemaBloc>(context).add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RowAppBar(
              pageName: "Our Cinemas",
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/redblack.jpg',
                      ))),
              child: GlassContainer(
                blur: 0,
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.zero,
                shadowColor: Colors.black.withOpacity(0.24),
                child: SingleChildScrollView(
                  child: BlocBuilder<CinemaBloc, CinemaState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return Column(
                          children: [
                            for (LocationData locationData
                                in state.locationList)
                              OurCinemasRow(locationData: locationData)
                          ],
                        );
                      } else {
                        return const Text("Error");
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
