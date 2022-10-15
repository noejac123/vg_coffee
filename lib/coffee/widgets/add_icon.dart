import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee/coffee/bloc/coffee_bloc.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFF895637),
            child: IconButton(
              onPressed: () =>
                  context.read<CoffeeBloc>().add(const GetNewCoffee()),
              icon: const Icon(
                Icons.add_circle_rounded,
                size: 30,
                color: Color(0xFFF2E8DB),
              ),
            ),
          ),
        );
      },
    );
  }
}
