import 'package:flutter/material.dart';
import 'package:larn/services/larn_service.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/add_larn_widget.dart';
import 'package:larn/widgets/back_button_widget.dart';
import 'package:provider/provider.dart';

class AddLarnScreen extends StatefulWidget {
  const AddLarnScreen({super.key});

  @override
  State<AddLarnScreen> createState() => _AddLarnScreenState();
}

class _AddLarnScreenState extends State<AddLarnScreen> {
  late LarnService larnService;

  @override
  void initState() {
    larnService = LarnService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNavigation(),
          Expanded(
            child: FutureBuilder(
              future: larnService.getLarns(),
              builder: (context, larnLists) {
                if (larnLists.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  itemCount: larnLists.data?.length,
                  itemBuilder: (context, index) => AddLarnWidget(
                    larn: larnLists.data!.elementAt(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return Ink(
      padding: const EdgeInsets.only(top: 48),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: BackButtonWidget(),
            ),
            Text(
              "เพิ่มหลาน",
              style: TextStyle(
                fontSize: subHeadingFontSize,
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}
