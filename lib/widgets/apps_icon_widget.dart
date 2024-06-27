import 'package:flutter/material.dart';

class AppsIconWidget extends StatelessWidget {
  const AppsIconWidget({
    super.key,
    required this.appList,
  });

  final List<String>? appList;

  @override
  Widget build(BuildContext context) {
    bool isHaveApps = appList != null;

    if (!isHaveApps) return const SizedBox();

    return Visibility(
      visible: isHaveApps,
      child: Row(
        children: appList!.map((String src) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  src,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
            ],
          );
        }).toList(),
      ),
    );
  }
}
