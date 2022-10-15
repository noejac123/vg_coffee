part of 'coffee_bloc.dart';

class CoffeeState extends Equatable {
  const CoffeeState({
    this.savedPictures = const <String>[],
    this.selectedPicIsNew = false,
    // This can be either the seleted file path or the url for the picture
    // depending on selectedPicIsNew.
    this.selectedPicture = '',
  });

  final List<String> savedPictures;
  final String selectedPicture;
  final bool selectedPicIsNew;

  bool get hasSavedPictures => savedPictures.isNotEmpty;

  @override
  List<Object?> get props => [savedPictures, selectedPicture, selectedPicIsNew];

  CoffeeState copyWith({
    List<String>? savedPictures,
    String? selectedPicture,
    bool? selectedPicIsNew,
  }) {
    return CoffeeState(
      savedPictures: savedPictures ?? this.savedPictures,
      selectedPicture: selectedPicture ?? this.selectedPicture,
      selectedPicIsNew: selectedPicIsNew ?? this.selectedPicIsNew,
    );
  }
}
