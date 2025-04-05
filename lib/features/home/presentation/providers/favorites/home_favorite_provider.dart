// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shop_app_clean/core/error/failures.dart';
// import 'package:shop_app_clean/features/home/domain/usecases/home_products_use_case.dart';

// // Provider for tracking loading state of specific product toggles
// final favoriteToggleLoadingProvider = StateProvider<Set<int>>((ref) => {});

// // Provider for the favorite toggle functionality
// final favoriteToggleProvider = Provider<Future<bool> Function(int)>((ref) {
//   return (int productId) async {
//     try {
//       // Add this product ID to loading set
//       ref.read(favoriteToggleLoadingProvider.notifier).update((state) {
//         final newSet = Set<int>.from(state);
//         newSet.add(productId);
//         return newSet;
//       });

//       // Get the use case from GetIt
//       final homeProductsUseCase = GetIt.I<HomeUseCases>();
      
//       // Call API to toggle favorite status
//       final result = await homeProductsUseCase.setProductToFavorite(productId);
      
//       // Process result
//       return result.fold(
//         (failure) => throw ServerFailure(failure.message),
//         (isFavorite) => isFavorite,
//       );
//     } catch (e) {
//       throw e;
//     } finally {
//       // Remove this product ID from loading set regardless of outcome
//       ref.read(favoriteToggleLoadingProvider.notifier).update((state) {
//         final newSet = Set<int>.from(state);
//         newSet.remove(productId);
//         return newSet;
//       });
//     }
//   };
// });