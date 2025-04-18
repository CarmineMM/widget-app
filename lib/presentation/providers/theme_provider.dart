import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// El state provider, almacena un state de estados para poder ser modificados
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutables
// El Provider, es un proveedor de datos que no se pueden modificar
final colorListProvider = Provider((ref) => colorsList);

// El state provider, almacena un state de estados para poder ser modificados
// Almacenara el indice del color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);
