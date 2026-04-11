import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/favorite_car_model.dart';

class FavoriteCubit extends Cubit<List<FavoriteCarModel>> {
  // Initialize cubit with an empty list of favorites
  FavoriteCubit() : super([]);

  // Key used to store favorites in SharedPreferences
  static const String favoriteKey = "favorite_cars";

  // Load favorites from local storage
  void loadFavorites() async {
    // Retrieve stored JSON string
    final favoritesJson = SharedPrefHelper.getString(favoriteKey);

    // Check if there is saved data
    if (favoritesJson.isNotEmpty) {
      try {
        // Decode JSON string into a list
        final List<dynamic> decodedJson = json.decode(favoritesJson);

        // Convert JSON list into FavoriteCarModel objects
        final favorites = decodedJson
            .map((json) => FavoriteCarModel.fromJson(json))
            .toList();

        // Emit loaded favorites to update UI
        emit(favorites);
      } catch (e) {
        // If parsing fails, emit empty list to avoid crashes
        emit([]);
      }
    } else {
      // If no data exists, emit empty list
      emit([]);
    }
  }

  // Add or remove a car from favorites (toggle behavior)
  void toggleFavorite(FavoriteCarModel car) async {
    // Create a copy of the current state
    final currentFavorites = List<FavoriteCarModel>.from(state);

    // Check if the car already exists in favorites
    final index = currentFavorites.indexWhere(
      (favorite) => favorite.carId == car.carId,
    );

    if (index >= 0) {
      // If found → remove it from favorites
      currentFavorites.removeAt(index);
    } else {
      // If not found → add it to favorites
      currentFavorites.add(car);
    }

    // Convert updated list to JSON string
    final jsonString = json.encode(
      currentFavorites.map((car) => car.toJson()).toList(),
    );

    // Save updated favorites to local storage
    await SharedPrefHelper.setData(favoriteKey, jsonString);

    // Emit new state to refresh UI
    emit(currentFavorites);
  }

  // Check if a specific car is marked as favorite
  bool isFavorite(int carId) {
    return state.any((car) => car.carId == carId);
  }
}
