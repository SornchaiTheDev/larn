import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/font_size.dart';
import 'package:larn/constants/theme.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/back_button_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double subHeadingFont =
        Provider.of<SettingStore>(context).subHeadingFontSize;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonWidget(),
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.gear),
                      const SizedBox(width: 8),
                      Text(
                        "ตั้งค่า",
                        style: TextStyle(
                          fontSize: subHeadingFont,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "ขนาดตัวอักษร",
                style: TextStyle(
                  fontSize: subHeadingFont,
                ),
              ),
              const SizedBox(height: 24),
              Flexible(
                flex: 2,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    FontSizeWidget(
                      fontSize: FontSize.small,
                    ),
                    FontSizeWidget(
                      fontSize: FontSize.medium,
                    ),
                    FontSizeWidget(
                      fontSize: FontSize.large,
                    ),
                    FontSizeWidget(
                      fontSize: FontSize.extraLarge,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สีแอป",
                      style: TextStyle(
                        fontSize: subHeadingFont,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Row(
                      children: [
                        ColorPaletteWidget(
                          theme: greenTheme,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ColorPaletteWidget(
                          theme: amberTheme,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ColorPaletteWidget(
                          theme: purpleTheme,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef AppTheme = Map<String, Color>;

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({
    super.key,
    required this.theme,
  });

  final AppTheme theme;

  final double boxSize = 46.0;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    bool isActive = Provider.of<SettingStore>(context).theme == theme;

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      onTap: () =>
          Provider.of<SettingStore>(context, listen: false).setTheme(theme),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                color: isActive ? primaryColor : Colors.black12,
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: boxSize,
                  height: boxSize,
                  color: Colors.white,
                ),
                Container(
                  width: boxSize,
                  height: boxSize,
                  color: theme["primary"],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FontSizeWidget extends StatelessWidget {
  const FontSizeWidget({
    super.key,
    required this.fontSize,
  });

  final FontSize fontSize;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    bool isActive =
        Provider.of<SettingStore>(context).activeFontSize == fontSize;

    double localFontSize = 0;

    switch (fontSize) {
      case FontSize.small:
        localFontSize = 16;
      case FontSize.medium:
        localFontSize = 18;
      case FontSize.large:
        localFontSize = 24;
      case FontSize.extraLarge:
        localFontSize = 32;
    }

    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      onTap: () => Provider.of<SettingStore>(context, listen: false)
          .setFontSize(fontSize),
      splashColor: isActive ? primaryColor.withOpacity(0.8) : Colors.black12,
      child: Ink(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? primaryColor : Colors.black12,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text("A", style: TextStyle(fontSize: localFontSize)),
        ),
      ),
    );
  }
}
