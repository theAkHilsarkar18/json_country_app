import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_country_app/screens/country_screen/provider/countryprovider.dart';
import 'package:provider/provider.dart';

class Countryscreen extends StatefulWidget {
  const Countryscreen({Key? key}) : super(key: key);

  @override
  State<Countryscreen> createState() => _CountryscreenState();
}

class _CountryscreenState extends State<Countryscreen> {
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  countryproviderFalse!.CountryDataJsonParshing();
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.sort, size: 28, color: Colors.grey),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.green, width: 1.5)),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage("assets/img/person..jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Search",
                            style: GoogleFonts.mukta(
                                color: Colors.grey, fontSize: 16)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          child: Icon(Icons.filter_alt,
                              color: Colors.white, size: 25),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 28,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      alignment: Alignment.center,
                      child: Text("All",
                          style: GoogleFonts.mukta(color: Colors.white)),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white54,
                      ),
                      alignment: Alignment.center,
                      child: Text("Trending",
                          style: GoogleFonts.mukta(color: Colors.black45)),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white54,
                      ),
                      alignment: Alignment.center,
                      child: Text("Favourite",
                          style: GoogleFonts.mukta(color: Colors.black45)),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white54,
                      ),
                      alignment: Alignment.center,
                      child: Text("Visited",
                          style: GoogleFonts.mukta(color: Colors.black45)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 578,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) => countryBox(
                    countryproviderTrue!.countryJsonList[index].nameModel!.common!,
                    countryproviderTrue!.countryJsonList[index].timezones![0],
                    countryproviderTrue!.countryJsonList[index].capital![0],
                    countryproviderTrue!.countryJsonList[index].population!,
                    countryproviderTrue!.countryJsonList[index].flagModel!.png!,
                    index,
                  ),
                  itemCount: countryproviderTrue!.countryJsonList.length,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }

  Widget countryBox(String countryName, String timezone, String capitalName,
      int population, String countryImg,int index) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 290,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Image.network("${countryImg}", fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text(
                    "${countryName}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.verified, color: Colors.green, size: 15),
                ],
              ),
              Spacer(),
              Text(
                "${timezone}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "${capitalName}",
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Population : ${population}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),
              Spacer(),
              Text("4.2", style: TextStyle(color: Colors.black, fontSize: 11)),
              Icon(Icons.star_half, color: Colors.green, size: 18),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: index);
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text("Explore",
                      style: GoogleFonts.mukta(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
