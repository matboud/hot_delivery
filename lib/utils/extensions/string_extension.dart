extension StringExtension on String {
  String getIconPath() {
    switch (this) {
      case 'Vegetables':
        return 'assets/icons/vegetables_icon.png';
      case 'Wine':
        return 'assets/icons/wine_icon.png';
      case 'Herbs':
        return 'assets/icons/herbs_icon.png';
      case 'Coffee':
        return 'assets/icons/coffee_icon.png';
      case 'Meat':
        return 'assets/icons/raw_meat_icon.png';
      case 'sweets':
        return 'assets/icons/candy_icon.png';

      default:
        return 'assets/icons/category_icon.png';
    }
  }
}
