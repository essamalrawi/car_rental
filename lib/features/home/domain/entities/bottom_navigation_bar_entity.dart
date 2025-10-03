import 'package:car_rental/constants/assets.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesIconActiveHome,
    inActiveImage: Assets.imagesIconInactiveHome,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesIconActiveSearch,
    inActiveImage: Assets.imagesIconInactiveSearch,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesIconActiveInbox,
    inActiveImage: Assets.imagesIconInactiveInbox,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesIconActiveNotifications,
    inActiveImage: Assets.imagesIconInactiveNotifications,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesIconActiveUser,
    inActiveImage: Assets.imagesIconInactiveUser,
  ),
];
