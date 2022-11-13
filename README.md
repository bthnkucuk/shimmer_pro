# Shimmer Pro


Shimmer effect with easy usage.

<p>
    <img src="https://github.com/bthnkucuk/shimmer_pro/blob/main/screenshots/dark.gif?raw=true/">
    <img src="https://github.com/bthnkucuk/shimmer_pro/blob/main/screenshots/light.gif?raw=true"/>
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
