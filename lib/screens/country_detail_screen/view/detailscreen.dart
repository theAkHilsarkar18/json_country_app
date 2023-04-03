import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../country_screen/provider/countryprovider.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  Countryprovider? countryproviderTrue;
  Countryprovider? countryproviderFalse;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Countryprovider>(context, listen: false)
        .CountryDataJsonParshing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    countryproviderFalse = Provider.of(context, listen: false);
    countryproviderTrue = Provider.of(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                      border: Border(bottom: BorderSide(color: Colors.black,width: 1.5))
                        ),
                    child: Image.network("${countryproviderTrue!.countryJsonList[index].flagModel!.png!}",fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${countryproviderTrue!.countryJsonList[index].nameModel!.common!}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.verified, color: Colors.green, size: 18),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].timezones![0]}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].capital![0]}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.green, size: 15),
                            Icon(Icons.star, color: Colors.green, size: 15),
                            Icon(Icons.star, color: Colors.green, size: 15),
                            Icon(Icons.star, color: Colors.green, size: 15),
                            Icon(Icons.star_half, color: Colors.green, size: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "${countryproviderTrue!.countryJsonList[index].region!} - ${countryproviderTrue!.countryJsonList[index].subregion!}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Country Status  :  ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].status!}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.green.shade700,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Continents          :  ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].continents![0]}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.green.shade700,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Independent      :  ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].independent!?"Yes":"No"}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.green.shade700,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Population          :  ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${countryproviderTrue!.countryJsonList[index].population!}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.green.shade700,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
                    child: Text(
                        "${countryproviderTrue!.countryJsonList[index].nameModel!.official!}",
                        style: GoogleFonts.poppins(
                            letterSpacing: 1, color: Colors.green.shade700,fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                        "${countryproviderTrue!.countryJsonList[index].flagModel!.alt!}",
                        style: GoogleFonts.poppins(
                            letterSpacing: 1, color: Colors.grey.shade700)),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     height: 55,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(left: 10),
            //           child: Icon(Icons.sort, size: 28, color: Colors.grey),
            //         ),
            //         Spacer(),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 10),
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border:
            //                     Border.all(color: Colors.green, width: 1.5)),
            //             child: CircleAvatar(
            //               radius: 18,
            //               backgroundImage: AssetImage("assets/img/person..jpg"),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
