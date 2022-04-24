import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkar/delayed_animation.dart';
import 'package:linkar/confirm_immatriculation.dart';
import 'package:linkar/global.dart' as global;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp immatriculeRegex = RegExp(
      r"[A-Z]{2}[-][0-9]{3}[-][A-Z]{2}$"); // Format pour une immatriculation AB-123-AB

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white.withOpacity(0),
                titleTextStyle: const TextStyle(color: Colors.blue),
                centerTitle: false,
                elevation: 0,
                title: const Text(
                  "Annuler",
                ),
                leading: IconButton(
                    icon: const Icon(Icons.close, color: Colors.blue),
                    onPressed: () {})),
            body: SingleChildScrollView(
                child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(children: [
                      DelayedAnimation(
                          delay: 1000,
                          child: Container(
                              child: Column(children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Numéro d'immatriculation",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                )),
                          ]))),
                      DelayedAnimation(
                          delay: 1400,
                          child: Container(
                              height: 80,
                              child: Column(children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Étape 01/05",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold))),
                              ]))),
                      DelayedAnimation(
                          delay: 1800,
                          child: Container(
                            height: 80,
                            child: const Text(
                                "Pour ajouter un véhicule à votre profil nous allons avoir besoin de quelques renseignements. Dans un premier temps nous avons besoin du numéro d'immatriculation du véhicule."),
                          )),
                      DelayedAnimation(
                          delay: 2200,
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Champs obligatoire*",
                                      )),
                                  TextFormField(
                                    onChanged: (value) => setState(() => global
                                            .immatricule =
                                        value), // donne la valeur rentré à immatricule
                                    validator: (String? value) => value!
                                                .isEmpty ||
                                            !immatriculeRegex.hasMatch(value)
                                        ? 'Immatricule non valide'
                                        : null, // verifie si la condition pour la plaque est respecté
                                    decoration: const InputDecoration(
                                        hintText: "BA-123-AB",
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue))),
                                  )
                                ],
                              ))),
                      DelayedAnimation(
                          delay: 2600,
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                child: Text(
                                  "Votre immatriculation commence par un numéro ?",
                                  style: GoogleFonts.poppins(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () => print("Soon"),
                              ))),
                      DelayedAnimation(
                          //bouton pour passer à la page suivante
                          delay: 3000,
                          child: Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.symmetric(vertical: 200),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                ),
                                child: Text(
                                  "Suivant",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: !immatriculeRegex
                                        .hasMatch(global.immatricule)
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          // verifie si la key du form pour la plaque est valide
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      end_immatriculation()));
                                        }
                                      },
                              ))),
                    ])))));
  }
}
