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
      height: 120, // Adjusted height to match the larger image
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
                  tag: 'fish-${fish.name}', // Unique tag for the Hero animation
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    child: Image.network(
                      fish.imageUrl,
                      width:
                          120, // Adjusted width to keep the aspect ratio consistent
                      height:
                          120, // Ensures it occupies the full height of the container
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire area
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
