import 'package:flutter/material.dart';

class ConversationCard extends StatelessWidget {
  ConversationCard({
    super.key,
    required this.title,
    required this.description,
    this.titleAlignment,
    this.descriptionAlignment,
    required this.backgroundColor,
  });

  final String title;
  final String description;
  Alignment? titleAlignment;
  Alignment? descriptionAlignment;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: backgroundColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Align(
                  alignment: titleAlignment ?? Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
              ),
              Align(
                  alignment: descriptionAlignment ?? Alignment.centerLeft,
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
