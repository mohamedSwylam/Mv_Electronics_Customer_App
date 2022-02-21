abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeBottomNavState extends AppStates {}

class ChangePageViewState extends AppStates {}

class ChangeCategoryLabelState extends AppStates {}

class GetBannersLoadingStates extends AppStates {}

class GetBannersSuccessStates extends AppStates {}

class GetBannersErrorStates extends AppStates {
  final String error;

  GetBannersErrorStates(this.error);
}
