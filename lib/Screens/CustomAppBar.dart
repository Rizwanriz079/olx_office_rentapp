import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search.dart'; // Import the search page

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasSearch;
  final Function onFilter;

  CustomAppBar({
    required this.title,
    this.hasSearch = false,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0B3760),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            if (hasSearch)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(SearchPage());
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 1, right: 4, bottom: 0, left: 4),
                            child: TextFormField(
                              controller: searchController,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Location",
                                hintStyle: GoogleFonts.aBeeZee(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                                prefixIcon: const Icon(Icons.location_on,color: Color(0xFF0B3760),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu_rounded,
                          size: 45, color: Colors.white),
                      onPressed: () => onFilter(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hasSearch ? 124.0 : kToolbarHeight);
}
