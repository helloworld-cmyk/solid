import '../models/onboard_page_model.dart';
import 'onboard_pages_data_source.dart';

const int _primaryDotColorValue = 0xFFFF6F20;

class OnboardPagesDataSourceImpl implements OnboardPagesDataSource {
  const OnboardPagesDataSourceImpl();

  @override
  List<OnboardPageModel> getPages() {
    return _mockPages;
  }
}

const List<OnboardPageModel> _mockPages = <OnboardPageModel>[
  OnboardPageModel(
    assetPath: 'assets/background/onboard1.png',
    title: 'CLASSY\nFROM HEAD\nTO TOE',
    dotColorValue: _primaryDotColorValue,
  ),
  OnboardPageModel(
    assetPath: 'assets/background/onboard2.png',
    title: 'FLY AWAY\nWITH YOUR\nSTYLE',
    dotColorValue: _primaryDotColorValue,
  ),
  OnboardPageModel(
    assetPath: 'assets/background/onboard3.png',
    title: 'CLOTHES\nFOR A BIG\nPLANET',
    dotColorValue: _primaryDotColorValue,
  ),
];
