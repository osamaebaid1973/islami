import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String sebha = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style:
                  GoogleFonts.elMessiri(color: Colors.white, fontSize: 36.0)),
          const SizedBox(height: 16),
          InkWell(
            onTap: _onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/sebha_tab.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: setSebhaColumnChildren(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onTap() {
    if (counter == 100) {
      counter = 0;
    } else {
      counter++;
    }
    setState(() {});
  }

  List<Widget> setSebhaColumnChildren() {
    if (counter == 0) {
      return [];
    } else if (counter == 100) {
      return [
        Container(
          margin: EdgeInsets.only(top: 136, left: 8),
          width: 240,
          height: 240,
          child: Text(
            textAlign: TextAlign.center,
            'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير',
            style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 24.0),
          ),
        )
      ];
    } else {
      if (counter <= 33) {
        sebha = 'سبحان الله';

        return [
          Text(sebha,
              style:
                  GoogleFonts.elMessiri(color: Colors.white, fontSize: 24.0)),
          const SizedBox(height: 16),
          Text(counter.toString(),
              style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 24.0))
        ];
      } else if (counter > 33 && counter <= 66) {
        sebha = 'الحمد لله';
        return tasbeeh(sebha);
      } else {
        sebha = 'الله اكبر';
        return tasbeeh(sebha);
      }
    }
  }

  tasbeeh(String sebha) {
    return [
      Text(sebha,
          style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 24.0)),
      const SizedBox(height: 16),
      Text(counter.toString(),
          style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 24.0))
    ];
  }
}
