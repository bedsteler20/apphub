import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

CarouselSliderController useCarouselController() {
  return useMemoized(() => CarouselSliderController());
}
