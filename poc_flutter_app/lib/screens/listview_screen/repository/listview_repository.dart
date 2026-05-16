


// @Riverpod(keepAlive: true)
// RecipeRepository recipeRepository(Ref ref) {
//   final networkRepository = ref.watch(networkRepositoryProvider);
//   return RecipeRepository(networkRepository: networkRepository);
// }


abstract class RepositoryI {
  String getDatat();
}

class ListviewRepositoryI extends RepositoryI{
  
  @override
  String getDatat(){
    return "sealed";
  }
}

