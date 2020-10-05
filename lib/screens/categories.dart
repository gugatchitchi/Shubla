import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shubla/configs/configs.dart';
import 'package:shubla/widgets/widgets.dart';
import 'package:shubla/screens/screens.dart';
import 'package:shubla/database/data.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circles all around the screen
        Positioned(
          top: 10.0,
          left: -50.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Palette.accent_orange,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: -45.0,
          right: 25.0,
          child: Container(
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Palette.accent_yellow,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -30.0,
          left: 70.0,
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Palette.accent_blue,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -120.0,
          right: -120.0,
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Palette.accent_pink,
              shape: BoxShape.circle,
            ),
          ),
        ),

        // Scroll View
        // It is all the content on this page
        CustomScrollView(
          slivers: [
            // Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CategoriesTitle(
                  title: 'კატეგორიები',
                  descrip: 'აირჩიე კატეგორია და დაიწყე თამაში',
                ),
              ),
            ),
            // Cards
            SliverToBoxAdapter(
              // We add padding to the bottom of the categories
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                // Row consists of two columns - left and right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left Column
                    // it has additional spacer on the top to
                    // move it down a little bit
                    Column(
                      children: [
                        // top margin
                        SizedBox(height: 100.0),
                        // card
                        CategoriesCard(
                          imageName: 'animals',
                          text: 'ცხოველები',
                          color: Palette.accent_orange,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Quiz(
                                  questions: questionsAnimals,
                                );
                              }),
                            );
                          },
                        ),
                        // Spacer between cards
                        SizedBox(height: 20.0),
                        // card
                        CategoriesCard(
                          imageName: 'movies',
                          text: 'ფილმები',
                          color: Palette.accent_blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Quiz(
                                  questions: questionsMovies,
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                    // Spacer between columns
                    SizedBox(width: 20.0),
                    // Right Column
                    Column(
                      children: [
                        // card
                        CategoriesCard(
                          imageName: 'countries',
                          text: 'ქვეყნები',
                          color: Palette.accent_yellow,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Quiz(
                                  questions: questionsCountries,
                                );
                              }),
                            );
                          },
                        ),
                        // Spacer between cards
                        SizedBox(height: 20.0),
                        // card
                        CategoriesCard(
                          imageName: 'celebrities',
                          text: 'ადამიანები',
                          color: Palette.accent_pink,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Quiz(
                                  questions: questionsCelebrities,
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
