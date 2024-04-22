## Acknowledgments

This project uses modified code from [feature_flags] by [Aloïs Deniel](https://github.com/aloisdeniel), available under the MIT License.
See https://github.com/aloisdeniel/feature_flags for the original source.


---

# feature_flags

This package simply allows you to activate dynamically functionnalities of your app.

# Usage

## Setup

Wrap your app's widget in a `Features` widget.

```dart
Features(
    child: MaterialApp(
        /// ...
    ),
);
```

## Testing if a feature is enabled

To test is a feature is currently enabled, use the `Features.isFeatureEnabled` function with a unique functionnality identifier.

```dart
if (Features.isFeatureEnabled(context, 'DECREMENT')) {
    /// The 'DECREMENT' feature is enabled
}
```

## Enable or disable a feature

### From the `Features` widget

By updating the `flags` from the `Features` widget.

```dart
Features(
    flags: [ 'DECREMENT' ],
    child: MaterialApp(
        /// ...
    ),
);
```

### Enabling it locally from code

You can activate a feature by calling the `Features.setFeature` function. The feature flag is saved into shared preferences and is persisted between sessions.

```dart
Features.setFeature(
    context,
    'DECREMENT',
    true,
);
```

### Using the debug view

The debug view allow your users to activate or deactivate any dynamic feature.

> This may be useful during developpment, but it should be used carefuly.

```dart
DebugFeatures.show(
    context,
    availableFeatures: [
        Feature('DECREMENT', name: 'Decrement'),
        Feature('RESET', name: 'Reset'),
    ],
);
```
