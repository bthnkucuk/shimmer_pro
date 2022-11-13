# Shimmer

[![pub package](https://img.shields.io/pub/v/shimmer.svg)](https://pub.dartlang.org/packages/shimmer) ![](https://github.com/hnvn/flutter_shimmer/workflows/unit%20test/badge.svg)

Shimmer effect with easy usage.

<p>
    <img src="https://github.com/hnvn/flutter_shimmer/blob/master/screenshots/loading_list.gif?raw=true"/>
    <img src="https://github.com/hnvn/flutter_shimmer/blob/master/screenshots/slide_to_unlock.gif?raw=true"/>
</p>

## How to use

```dart
import 'package:shimmer_pro/shimmer_pro.dart';
```

```dart
    ShimmerPro.text(
              light: shimmerlight,
              width: 450,
              scaffoldBackgroundColor: bgColor,
            ),
```

```dart
    ShimmerPro.text(
              light: shimmerlight,
              width: 450,
              scaffoldBackgroundColor: bgColor,
            ),
```

```dart
  ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                      borderRadius: 50,
                    ),
```

```dart
   ShimmerPro.generated(
                light: shimmerlight,
                scaffoldBackgroundColor: bgColor,
                child: Row(
                  children: [
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                    ),
                    ShimmerPro.sized(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      height: 100,
                      width: 100,
                    ),
                    ShimmerPro.text(
                      light: shimmerlight,
                      scaffoldBackgroundColor: bgColor,
                      width: 150,
                    )
                  ],
                )),
```
