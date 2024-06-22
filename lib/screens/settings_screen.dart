import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';
import 'package:larn/constants/font_size.dart';
import 'package:larn/widgets/back_button_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: BackButtonWidget(),
                  ),
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.gear),
                      SizedBox(width: 8),
                      Text("ตั้งค่า", style: TextStyle(fontSize: 20)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "ขนาดตัวอักษร",
                style: TextStyle(fontSize: 24),
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
                      isActive: true,
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
              const Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สีแอป",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        ColorPaletteWidget(
                          accentColor: primaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ColorPaletteWidget(
                          accentColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ColorPaletteWidget(
                          accentColor: Colors.purple,
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

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({
    super.key,
    required this.accentColor,
  });

  final Color accentColor;

  final double boxSize = 46.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Colors.black12,
              strokeAlign: BorderSide.strokeAlignOutside,
              width: 1,
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
                color: accentColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FontSizeWidget extends StatelessWidget {
  const FontSizeWidget({
    super.key,
    required this.fontSize,
    this.isActive = false,
  });

  final FontSize fontSize;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
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
      onTap: () {},
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
