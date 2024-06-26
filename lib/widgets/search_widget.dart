import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return TextField(
      style: TextStyle(fontSize: bodyFontSize),
      decoration: InputDecoration(
        prefixIcon: Container(
          width: 60,
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ),
        hintText: 'ค้นหา',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
