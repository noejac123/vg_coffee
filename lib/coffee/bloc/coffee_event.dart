part of 'coffee_bloc.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();
  @override
  List<Object> get props => [];
}

class LoadSavedCoffee extends CoffeeEvent {
  const LoadSavedCoffee();

  @override
  List<Object> get props => [];
}

class GetNewCoffee extends CoffeeEvent {
  const GetNewCoffee();

  @override
  List<Object> get props => [];
}

class SaveCoffee extends CoffeeEvent {
  const SaveCoffee({
    required this.url,
  });
  final String url;

  @override
  List<Object> get props => [url];
}

class SelectCoffee extends CoffeeEvent {
  const SelectCoffee({
    required this.selectedFilepath,
  });
  final String selectedFilepath;

  @override
  List<Object> get props => [selectedFilepath];
}

class DeleteCoffee extends CoffeeEvent {
  const DeleteCoffee({
    required this.selectedFilepath,
  });
  final String selectedFilepath;

  @override
  List<Object> get props => [selectedFilepath];
}
