abstract class NewsStates {}
 class NewsInitialState extends NewsStates {}
class NewsBottomNavBarState extends NewsStates {}
class NewsBusinessSuccessState extends NewsStates{}
class NewsBusinessErrorState extends NewsStates{
 final String error;
  NewsBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsSportsSuccessState extends NewsStates{}
class NewsAppChangeModeState extends NewsStates{}
class NewsSportsErrorState extends NewsStates{
 final String error;
  NewsSportsErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsScienceSuccessState extends NewsStates{}
class NewsScienceErrorState extends NewsStates{
 final String error;
 NewsScienceErrorState(this.error);
}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsSearchSuccessState extends NewsStates{}
class NewsSearchErrorState extends NewsStates{
 final String error;
 NewsSearchErrorState(this.error);
}
