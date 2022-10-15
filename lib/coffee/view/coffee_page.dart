import 'dart:io';

import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee/coffee/coffee.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CoffeeBloc(coffeeRepository: context.read<CoffeeRepository>()),
      child: const CoffeeView(),
    );
  }
}

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Very Good Coffee'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: const [CoffeeImageView(), ActionButtonRow()],
              ),
            ),
          ),
          const ImageLibrary()
        ],
      ),
    );
  }
}

class CoffeeImageView extends StatelessWidget {
  const CoffeeImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state.selectedPicture.isNotEmpty) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            width: 400,
            child: FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: state.selectedPicIsNew
                    ? Image.network(
                        state.selectedPicture,
                        loadingBuilder: (context, child, progress) {
                          if (progress != null) {
                            return const SizedBox(
                              height: 4,
                              width: 100,
                              child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFF2E8DB),
                                color: Color(0xFF895637),
                              ),
                            );
                          } else {
                            return child;
                          }
                        },
                      )
                    : Image.file(
                        File(state.selectedPicture),
                      ),
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            width: 400,
          );
        }
      },
    );
  }
}

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state.selectedPicture.isNotEmpty) {
          if (state.selectedPicIsNew) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [AddIcon(), SaveIcon()],
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [DeleteIcon(), AddIcon()],
            );
          }
        } else {
          return const AddIcon();
        }
      },
    );
  }
}

class ImageLibrary extends StatelessWidget {
  const ImageLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state.hasSavedPictures) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: state.savedPictures
                    .map<Widget>(
                      (element) => ImageLibraryItem(
                        imagePath: element,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
