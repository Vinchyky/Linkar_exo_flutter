import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkar/delayed_animation.dart';
import 'package:linkar/global.dart' as globals;
import 'package:linkar/homepage.dart';

class end_immatriculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
                child: Column(children: [
                  DelayedAnimation(
                      delay: 1500,
                      child: Container(
                        height: 150,
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 150,
                        ),
                      )),
                  DelayedAnimation(
                    delay: 1500,
                    child: Container(
                        child: Text(
                      globals.immatricule,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                  DelayedAnimation(
                    delay: 1500,
                    child: Container(
                        child: Text(
                      "Véhicule ajouté à la liste",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DelayedAnimation(
                    delay: 1500,
                    child: Container(
                        child: Text(
                            "Félicitation! Un nouveau véhicule vient d'être ajouté à la liste de vos véhicules. Notre équipe étudie en ce moment la véracité de vos informations.")),
                  ),
                  DelayedAnimation(
                      delay: 3500,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 150,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                            ),
                            child: Text(
                              "Revenir à la liste des véhicules",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homepage()));
                            },
                          )))
                ]))));
  }
}
