import 'package:flutter/material.dart';
import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/home/home_events.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class HomeProfileMenu extends StatelessWidget {
  const HomeProfileMenu({
    Key? key,
    required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);
  final HomeBloc _homeBloc;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 42.toHeight,
          right: 42.toWidth,
          child: Container(
            decoration: BoxDecoration(
              color: CommonColors.kTextWhiteColor,
              borderRadius: BorderRadius.circular(6.toWidth),
            ),
            height: 120.toHeight,
            width: 100.toWidth,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.toWidth),
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CommonColors.kTableBorderColor,
                        ),
                      ),
                    ),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontSize: 16.toFont,
                        color: CommonColors.kTextColorLight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.toWidth),
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CommonColors.kTableBorderColor,
                        ),
                      ),
                    ),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontSize: 16.toFont,
                        color: CommonColors.kTextColorLight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6.toWidth),
                      bottomRight: Radius.circular(6.toWidth),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.toWidth),
                      alignment: Alignment.centerLeft,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: CommonColors.kSecondaryBLueColor,
                        border: Border(
                          bottom: BorderSide(
                            color: CommonColors.kSecondaryBLueColor,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      6.toWidth,
                                    ),
                                    color: Colors.white,
                                  ),
                                  height: 110.toHeight,
                                  width: 280.toWidth,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: double.maxFinite,
                                          width: double.maxFinite,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: CommonColors.kBorderLightGrey,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Log Out",
                                                style: TextStyle(
                                                  fontFamily: CommonFonts.Poppins,
                                                  color: CommonColors.kBlackIconColor,
                                                  fontSize: 17.toFont,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "Log out successful",
                                                style: TextStyle(
                                                  fontFamily: CommonFonts.Poppins,
                                                  color: CommonColors.kBlackIconColor,
                                                  fontSize: 14.toFont,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                color: CommonColors.kSecondaryBLueColor,
                                                fontFamily: CommonFonts.Poppins,
                                                fontSize: 17.toFont,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ).then((value) {
                            _homeBloc.add(LogOutButtonPressed());
                          });
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontFamily: CommonFonts.Poppins,
                            fontSize: 16.toFont,
                            color: CommonColors.kTextWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
