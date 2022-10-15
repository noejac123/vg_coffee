import 'package:bloc/bloc.dart';
import 'package:coffeepic_repository/coffeepic_repository.dart';
import 'package:equatable/equatable.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc({
    required CoffeeRepository coffeeRepository,
  })  : _coffeeRepository = coffeeRepository,
        super(const CoffeeState()) {
    on<LoadSavedCoffee>(_onLoadSavedCoffee);
    on<GetNewCoffee>(_onGetNewCoffee);
    on<SelectCoffee>(_onSelectCoffee);
    on<SaveCoffee>(_onSaveCoffee);
    on<DeleteCoffee>(_onDeleteCoffee);
    add(const LoadSavedCoffee());
  }

  final CoffeeRepository _coffeeRepository;

  Future<void> _onGetNewCoffee(
    GetNewCoffee event,
    Emitter<CoffeeState> emit,
  ) async {
    final imageUrl = await _coffeeRepository.getNewImage();
    return emit(
      state.copyWith(
        selectedPicIsNew: true,
        selectedPicture: imageUrl,
      ),
    );
  }

  Future<void> _onSelectCoffee(
    SelectCoffee event,
    Emitter<CoffeeState> emit,
  ) async {
    return emit(
      state.copyWith(
        selectedPicIsNew: false,
        selectedPicture: event.selectedFilepath,
      ),
    );
  }

  Future<void> _onSaveCoffee(
    SaveCoffee event,
    Emitter<CoffeeState> emit,
  ) async {
    await _coffeeRepository.saveImage(event.url);
    final pictureList = await _coffeeRepository.getSavedImageList();
    return emit(
      state.copyWith(
        selectedPicIsNew: false,
        selectedPicture: pictureList.last,
        savedPictures: pictureList,
      ),
    );
  }

  Future<void> _onDeleteCoffee(
    DeleteCoffee event,
    Emitter<CoffeeState> emit,
  ) async {
    await _coffeeRepository.deleteSavedImage(event.selectedFilepath);
    final pictureList = await _coffeeRepository.getSavedImageList();
    return emit(
      state.copyWith(
        selectedPicIsNew: false,
        selectedPicture: pictureList.isEmpty ? '' : pictureList.last,
        savedPictures: pictureList,
      ),
    );
  }

  Future<void> _onLoadSavedCoffee(
    LoadSavedCoffee event,
    Emitter<CoffeeState> emit,
  ) async {
    final pictureList = await _coffeeRepository.getSavedImageList();
    return emit(
      state.copyWith(
        selectedPicIsNew: false,
        selectedPicture: pictureList.isEmpty ? '' : pictureList.last,
        savedPictures: pictureList,
      ),
    );
  }
}
