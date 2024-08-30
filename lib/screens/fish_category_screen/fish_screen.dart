import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:fish_finder/provider/add_remove_check_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fish_finder/model/fish.dart';

class FishScreen extends ConsumerWidget {
  const FishScreen({super.key, required this.fish});

  final Fish fish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('User not logged in')),
      );
    }

    final userId = user.uid;
    final favoriteFishIds = ref.watch(favoriteFishProvider(userId));
    final isFavorite = favoriteFishIds.contains(fish.id);

    return Scaffold(
      backgroundColor: const Color(0xffF0F5FF),
      appBar: AppBar(
        title: Text(fish.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final fishId = fish.id;
              final notifier = ref.read(favoriteFishProvider(userId).notifier);

              if (isFavorite) {
                notifier.removeFavorite(fishId);
              } else {
                notifier.addFavorite(fishId);
              }

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite
                      ? 'Removed from favorites'
                      : 'Added to favorites'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(
                tag: 'fish-${fish.id}', // Ensure tag is unique
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      fish.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error); // Placeholder for error
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                fish.name,
                style: fontEnglish.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3652ad),
                ),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                    text: 'ชื่อทางวิทยาศาสตร์ : ',
                    style: fontThai.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff3652ad)),
                    children: [
                      TextSpan(
                        text: fish.scientificName,
                        style: fontEnglish.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ]),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                    text: 'ขนาดโดยเฉลี่ย : ',
                    style: fontThai.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff3652ad),
                    ),
                    children: [
                      TextSpan(
                        text: '${fish.averageSize.toString()} cm',
                        style: fontEnglish.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ]),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                    text: 'น้ำหนักโดยเฉลี่ย : ',
                    style: fontThai.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff3652ad),
                    ),
                    children: [
                      TextSpan(
                        text: '${fish.averageWeight.toString()} kg',
                        style: fontEnglish.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ]),
              ),
              const SizedBox(height: 12),
              Text(
                'คำอธิบาย',
                style: fontThai.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: colorBlue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                fish.description,
                style: fontThai.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 12),
              Text(
                'อายุขัยโดยเฉลี่ย',
                style: fontThai.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3652ad),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fish.lifespan,
                textAlign: TextAlign.center,
                style: fontThai.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'ที่อยู่อาศัย',
                style: fontThai.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3652ad),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fish.habitat,
                textAlign: TextAlign.center,
                style: fontThai.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'การหาอาหาร',
                style: fontThai.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3652ad),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fish.diet,
                textAlign: TextAlign.center,
                style: fontThai.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'การสืบพันธุ์',
                style: fontThai.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff3652ad),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fish.reproduction,
                textAlign: TextAlign.center,
                style: fontThai.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
