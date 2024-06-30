import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/models/larn.dart';
import 'package:larn/services/db_service.dart';
import 'package:larn/store/larn_store.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/apps_icon_widget.dart';
import 'package:provider/provider.dart';

class AddLarnWidget extends StatefulWidget {
  const AddLarnWidget({
    super.key,
    required this.larn,
  });

  final Larn larn;

  @override
  State<AddLarnWidget> createState() => _AddLarnWidgetState();
}

class _AddLarnWidgetState extends State<AddLarnWidget> {
  @override
  Widget build(BuildContext context) {
    final Larn(:id, :name, :description, :image) = widget.larn;

    LarnStore larnStore = Provider.of<LarnStore>(context);

    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    void handleAddLarn() {
      if (larnStore.isExist(id)) {
        larnStore.removeLarn(widget.larn.id);
        db?.delete("larns", where: 'id = ?', whereArgs: [widget.larn.id]);
      } else {
        larnStore.addLarn(widget.larn);
        db?.insert("larns", {
          "id": widget.larn.id,
          "name": widget.larn.name,
          "description": widget.larn.description,
          "image": widget.larn.image,
        });
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black26,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(image),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: subHeadingFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(description,
                              style: TextStyle(
                                fontSize: bodyFontSize,
                              )),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "แอปที่สอน",
                            style: TextStyle(
                              fontSize: bodyFontSize,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const AppsIconWidget(
                            appList: [],
                          )
                        ],
                      ),
                    ),
                    AddLarnButtonWidget(
                      primaryColor: primaryColor,
                      bodyFontSize: bodyFontSize,
                      isExist: larnStore.isExist(id),
                      onTap: handleAddLarn,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddLarnButtonWidget extends StatelessWidget {
  const AddLarnButtonWidget({
    super.key,
    required this.primaryColor,
    required this.bodyFontSize,
    required this.isExist,
    required this.onTap,
  });

  final Color primaryColor;
  final double bodyFontSize;
  final bool isExist;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Ink(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: primaryColor,
        ),
        child: Row(
          children: [
            FaIcon(
              isExist ? FontAwesomeIcons.check : FontAwesomeIcons.plus,
              size: 14,
            ),
            const SizedBox(width: 10),
            Text(
              isExist ? "เพิ่มหลานแล้ว" : "เพิ่มหลาน",
              style: TextStyle(
                fontSize: bodyFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
