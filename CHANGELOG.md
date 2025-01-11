# Expanded Tailoring Clothes

## 1.0.0

This was de first stable release.


### Added

- Added `Base.Belt`, `Base.HolsterSimple`, `Base.HolsterDouble` property `FabricType` with value `Leather`;
- Added small xp gain when rip cotton, denim and leather clothes;


### Refactored/Changed

- Override `Recipe.OnCreate.RipClothing` function to add leather drop when rip `Base.Belt`, `Base.HolsterSimple`, `Base.HolsterDouble`;
