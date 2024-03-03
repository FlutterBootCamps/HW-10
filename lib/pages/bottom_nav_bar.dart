import 'package:amc_applicaition/bloc/nav_bloc/navigation_bloc.dart';
import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/pages/daera_page.dart';
import 'package:amc_applicaition/pages/food_drinks_page.dart';
import 'package:amc_applicaition/pages/home_page.dart';
import 'package:amc_applicaition/pages/offers_page.dart';
import 'package:amc_applicaition/pages/our_cinemas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
    const OurCinemasPage(),
    const OffersPage(),
    const FoodDrinkPage(),
    const DaeraPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
              body: _pages[state.currentIndex],
              bottomNavigationBar: Container(
                child: BottomNavigationBar(
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedFontSize: 9,
                  selectedFontSize: 9,
                  showUnselectedLabels: true,
                  currentIndex: state.currentIndex,
                  backgroundColor: blackColor,
                  selectedItemColor: whiteColor,
                  unselectedItemColor: greyColor,
                  onTap: (index) {
                    context
                        .read<NavigationBloc>()
                        .add(ChangeThePageEvent(currentIndex: index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: blackColor,
                      icon: const Icon(FluentIcons.ticket_diagonal_28_regular),
                      label: ("SEE A MOVIE"),
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: blackColor,
                        icon: const Icon(Icons.location_on_outlined),
                        label: "OUR CINEMAS"),
                    BottomNavigationBarItem(
                        backgroundColor: blackColor,
                        icon: const Icon(Icons.local_offer_outlined),
                        label: "AMC OFFERS"),
                    BottomNavigationBarItem(
                        backgroundColor: blackColor,
                        icon: const Icon(Icons.fastfood_outlined),
                        label: "FOOD & DRINKS"),
                    BottomNavigationBarItem(
                      backgroundColor: blackColor,
                      icon: const Icon(Icons.circle_outlined),
                      label: "AMC DAERA",
                    )
                  ],
                ),
              ));
        }
        return const Text("Error");
      },
    );
  }
}
