import 'package:flutter/material.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/ui/pages/home_page/components/home_page_header/components/home_profile_menu.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    Key? key,
    required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);
  final HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: CommonColors.kBlackIconColor,
                size: 18.toHeight,
              ),
            ),
            Text(
              "Back",
              style: TextStyle(
                fontFamily: CommonFonts.Poppins,
                fontWeight: FontWeight.w400,
                fontSize: 15.toFont,
              ),
            )
          ],
        ),
        GestureDetector(
          //On Tap of profile Button
          onTap: () {
            showDialog(
              context: context,
              builder: ((context) {
                return HomeProfileMenu(
                  homeBloc: _homeBloc,
                );
              }),
            );
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: 18.toHeight,
                backgroundColor: CommonColors.kTextColorLight,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 17.toHeight,
                    backgroundColor: CommonColors.kTextWhiteColor,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle,
                    color: CommonColors.kTextColorLight,
                    size: 35.5.toHeight,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
