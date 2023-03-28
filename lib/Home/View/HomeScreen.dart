import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_paesing/Home/Provider/HomeScreenProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider? homeScreenProviderTrue;
  HomeScreenProvider? homeScreenProviderFalse;

  @override
  void initState() {
    super.initState();

    Provider.of<HomeScreenProvider>(context, listen: false).JsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    homeScreenProviderFalse =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProviderTrue =
        Provider.of<HomeScreenProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemCount: homeScreenProviderFalse!.ProfileList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white30,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "${homeScreenProviderFalse!.ProfileList[index]['id']}",
                      style: GoogleFonts.neuton(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: [
                        Text(
                          "${homeScreenProviderFalse!.ProfileList[index]['name']}",
                          style: GoogleFonts.neuton(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "${homeScreenProviderFalse!.ProfileList[index]['username']}",
                          style: GoogleFonts.neuton(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
