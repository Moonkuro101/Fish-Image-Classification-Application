import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/screens/fish_category_screen/fish_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fish_finder/provider/fish_provider.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fishList = ref.watch(fishlistProvider);
    final fishNotifier = ref.read(fishlistProvider.notifier);

    // Fetch data if it's not already fetched
    if (fishList.isEmpty) {
      fishNotifier.fetchFish();
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff4586E7),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                )
              ],
            ),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'คู่มือการใช้งาน\nแอพพลิเคชั่น',
                    textAlign: TextAlign.center,
                    style: fontThai.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                      shadows: [
                        const Shadow(
                          color: Color.fromARGB(137, 114, 114, 114),
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        )
                      ],
                    ),
                  ),
                  Image.asset('assets/images/ion_document-sharp.png'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FishListScreen(
                    fishList: fishList,
                    title: 'List title',
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  )
                ],
              ),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/fish_document.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'รายชื่อปลา\nและรายละเอียด',
                      textAlign: TextAlign.center,
                      style: fontThai.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorBlue,
                        fontSize: 20.0,
                        shadows: [
                          const Shadow(
                            color: Color.fromARGB(137, 114, 114, 114),
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
