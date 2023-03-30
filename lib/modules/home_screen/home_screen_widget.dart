import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan5/config/app_routes.dart';

import '../../models/user.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi, Selamat datang di dunia crypto"),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
            user.profilePhoto!,
          ),
        ),
      ],
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        hintText: "Mencari ---",
        filled: true,
        fillColor: Colors.grey[350],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(
          Icons.search_rounded,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Icon(Icons.chevron_right_rounded)
      ],
    );
  }
}

class HottestNewsCard extends StatelessWidget {
  const HottestNewsCard({
    super.key,
    required this.size,
    required this.pictureUrl,
    required this.newsTitle,
    required Null Function() onTap,
  });

  final Size size;
  final String pictureUrl;
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            width: size.width - 32,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )),
          ),
        ),
        Positioned(
            bottom: 16,
            right: 16,
            child: Text(
              newsTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ))
      ],
    );
  }
}

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({
    super.key,
    required this.size,
    required this.i,
  });

  final Size size;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": i.toString(),
                },
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                          "data:image/jpeg;base64,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"),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$i.Mengapa Harga BTC Hari Ini Tiba-tiba Melejit? ",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}

class LatestNewsIndexCardSection extends StatelessWidget {
  const LatestNewsIndexCardSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(
        height: 300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 1; i < 3; i++)
            LatestNewsCard(
              size: size,
              i: i,
            ),
        ],
      ),
    );
  }
}
