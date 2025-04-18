import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// Listado de colores inmutables
// El Provider, es un proveedor de datos que no se pueden modificar
final colorListProvider = Provider((ref) => colorsList);

// El state provider, almacena un state de estados para poder ser modificados
// final isDarkModeProvider = StateProvider<bool>((ref) => false);

// El state provider, almacena un state de estados para poder ser modificados
// Almacenara el indice del color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Instancia de tipo AppTheme (Sera un provider personalizado)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  // EL state es una instancia del AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void selectedColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
