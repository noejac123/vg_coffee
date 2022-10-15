import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee/coffee/bloc/coffee_bloc.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFBB8362),
            child: IconButton(
              onPressed: () => context
                  .read<CoffeeBloc>()
                  .add(SaveCoffee(url: state.selectedPicture)),
              icon: const Icon(
                Icons.save_rounded,
                size: 30,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        );
      },
    );
  }
}
