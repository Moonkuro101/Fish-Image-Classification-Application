import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/model/fish.dart';
import 'package:fish_finder/screens/fish_category_screen/fish_screen.dart';
import 'package:flutter/material.dart';

class FishListWidget extends StatelessWidget {
  const FishListWidget({super.key, required this.fish});

  final Fish fish;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 120,
      child: Card(
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FishScreen(fish: fish),
                ),
              );
            },
            child: Row(
              children: [
                Hero(
                  tag: 'fish-${fish.id}', // Unique tag for Hero animation
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      fish.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error); // Placeholder for error
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fish.name,
                          style: fontEnglish.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text: 'ขื่อวิทยาศาสตร์\n',
                            style: fontThai.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                text: fish.scientificName,
                                style: fontEnglish.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
