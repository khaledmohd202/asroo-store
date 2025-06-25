extension StringFormat on String {
  // to fix the image prob and to make all images appear in screen.
  String imageProductFormat() {
    return replaceAll(RegExp(r'^\["?|"\]?|"$'), '');
  }

  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String convertLongString() {
    final words = split(' ');
    if (words.length <= 2) return this;
    final shortString = words.sublist(0, words.length - 2).join(' ');
    return shortString;

  // we remove this line because
  // final shortString = split(' ').sublist(0, split(' ').length - 2).join(' ');
  // If your string has fewer than 2 words, split(' ').length - 2
  //becomes negative, causing sublist to throw a RangeError.
  }

  // String convertDataFormate() {
  //   final now = DateTime.now();

  //   return DateFormat('d MMM, y - h:mm a').format(now);
  // }
}
