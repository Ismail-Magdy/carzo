import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/favorite_car_model.dart';

class FavoriteCubit extends Cubit<List<FavoriteCarModel>> {
  final SharedPreferences sharedPreferences;
  static const String _favoriteKey = "FAVORITE_CARS_LIST";

  // أول ما الكيوبيت بيتكريت، بينادي على الداتا المحفوظة فوراً
  FavoriteCubit(this.sharedPreferences) : super([]) {
    _loadFavorites();
  }

  // 1. جلب الداتا من الموبايل
  void _loadFavorites() {
    final List<String>? favoritesJsonList = sharedPreferences.getStringList(
      _favoriteKey,
    );

    if (favoritesJsonList != null && favoritesJsonList.isNotEmpty) {
      try {
        final List<FavoriteCarModel> loadedCars = favoritesJsonList
            .map((jsonStr) => FavoriteCarModel.fromJson(jsonDecode(jsonStr)))
            .toList();
        emit(loadedCars);
      } catch (e) {
        emit([]); // لو حصل أي إيرور في القراية، نرجع لستة فاضية
      }
    } else {
      emit([]);
    }
  }

  // 2. إضافة أو حذف عربية (Toggle)
  Future<void> toggleFavorite(FavoriteCarModel car) async {
    // بناخد نسخة من اللستة الحالية
    List<FavoriteCarModel> currentFavorites = List.from(state);

    // بندور: هل العربية دي موجودة أصلاً؟
    final index = currentFavorites.indexWhere(
      (element) => element.carId == car.carId,
    );

    if (index >= 0) {
      // لو موجودة -> احذفها
      currentFavorites.removeAt(index);
    } else {
      // لو مش موجودة -> ضيفها
      currentFavorites.add(car);
    }

    // نحفظ اللستة الجديدة في الـ SharedPreferences
    final List<String> updatedJsonList = currentFavorites
        .map((carModel) => jsonEncode(carModel.toJson()))
        .toList();

    await sharedPreferences.setStringList(_favoriteKey, updatedJsonList);

    // نحدث الـ UI
    emit(currentFavorites);
  }

  // 3. دالة سريعة للـ UI عشان نعرف حالة أيقونة القلب
  bool isFavorite(String carId) {
    return state.any((car) => car.carId == carId);
  }
}
