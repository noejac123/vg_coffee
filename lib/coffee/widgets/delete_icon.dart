import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee/coffee/bloc/coffee_bloc.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFF592C10),
            child: IconButton(
              onPressed: () => context
                  .read<CoffeeBloc>()
                  .add(DeleteCoffee(selectedFilepath: state.selectedPicture)),
              icon: const Icon(
                Icons.delete_forever_rounded,
                size: 30,
                color: Color(0xFFBFB6A9),
              ),
            ),
          ),
        );
      },
    );
  }
}
