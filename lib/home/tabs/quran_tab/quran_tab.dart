import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/tabs/quran_tab/sura_item_horizontal.dart';
import 'package:islami/home/tabs/quran_tab/sura_name_item.dart';
import 'package:islami/models/sura_model.dart';
import 'package:islami/sura_details/sura_details_screen.dart';

// ignore: must_be_immutable
class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  var searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(_onSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _searchItem(),
            const SizedBox(height: 20),
            Text(
              'Most Recently',
              style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            searchResult.isEmpty
                ? SizedBox(
                    //decoration:
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: suraNamesAr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SuraItemHorizontal(
                            suraModel: getSuraModel(index));
                      },
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 8),
            Text(
              'Suras List',
              style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 16),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  endIndent: 40,
                  indent: 40,
                ),
                itemCount: searchResult.isEmpty
                    ? suraNamesAr.length
                    : searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                          arguments: getSuraModel(index));
                    },
                    child: SuraNameItem(
                      suraModel: searchResult.isEmpty
                          ? getSuraModel(index)
                          : getSearchedSuraModel(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchItem() {
    return TextField(
      style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 20),
      controller: searchController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: const ImageIcon(
          AssetImage('assets/images/search_icon.png'),
          color: AppColors.primary,
        ),
        hintText: 'Sura Name',
        hintStyle: GoogleFonts.elMessiri(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 3)),
      ),
    );
  }

  _onSearch() {
    searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in suraNamesEn) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          searchResult.add(data);
        }
      }
    }
    setState(() {});
  }
}
