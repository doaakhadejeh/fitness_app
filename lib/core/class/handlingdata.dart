import 'package:fitnessapp/core/class/stateerror.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final Stateerr stateerr;
  final Widget child;
  const Handlingdataview(
      {super.key, required this.stateerr, required this.child});

  @override
  Widget build(BuildContext context) {
    return stateerr == Stateerr.loding
        ? Center(
            child: Lottie.asset(Lotticonst.loding, width: 250, height: 250),
          )
        : stateerr == Stateerr.offline
            ? Center(
                child:
                    Lottie.asset(Lotticonst.offline, width: 250, height: 250),
              )
            : stateerr == Stateerr.serverfailuer
                ? Center(
                    child: Lottie.asset(Lotticonst.serverfail,
                        width: 250, height: 250),
                  )
                : stateerr == Stateerr.failure
                    ? Center(
                        child: Lottie.asset(Lotticonst.failure,
                            width: 250, height: 250),
                      )
                    : child;
  }
}

class Handlingdatarequest extends StatelessWidget {
  final Stateerr stateerr;
  final Widget child;
  const Handlingdatarequest(
      {super.key, required this.stateerr, required this.child});

  @override
  Widget build(BuildContext context) {
    return stateerr == Stateerr.loding
        ? Center(
            child: Lottie.asset(Lotticonst.loding, width: 250, height: 250),
          )
        : stateerr == Stateerr.offline
            ? Center(
                child:
                    Lottie.asset(Lotticonst.offline, width: 250, height: 250),
              )
            : stateerr == Stateerr.serverfailuer
                ? Center(
                    child: Lottie.asset(Lotticonst.serverfail,
                        width: 250, height: 250),
                  )
                : child;
  }
}
