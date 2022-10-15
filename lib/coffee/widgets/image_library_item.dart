import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee/coffee/bloc/coffee_bloc.dart';

class ImageLibraryItem extends StatelessWidget {
  const ImageLibraryItem({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context
              .read<CoffeeBloc>()
              .add(SelectCoffee(selectedFilepath: imagePath)),
          child: Container(
            decoration: imagePath == state.selectedPicture
                ? BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xFF895637)),
                  )
                : null,
            padding: const EdgeInsets.all(5),
            child: Image.file(
              File(imagePath),
              height: 90,
              width: 90,
            ),
          ),
        );
      },
    );
  }
}
