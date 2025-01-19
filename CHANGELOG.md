# Expanded Tailoring Clothes

## 1.0.2

Fix broken recipes and drops.


### Refactored/Changed

- Refactored rip clothing recipe to prevent override of default recipes, added static drops and xp gain in `Recipe.OnCreate.RipClothing`;


--

## 1.0.1

This was de second stable release.


### Refactored/Changed

- Fixed workshop description;


--


## 1.0.0

This was de first stable release.


### Added

- Added `Base.Belt`, `Base.HolsterSimple`, `Base.HolsterDouble` property `FabricType` with value `Leather`;
- Added small xp gain when rip cotton, denim and leather clothes;


### Refactored/Changed

- Override `Recipe.OnCreate.RipClothing` function to add leather drop when rip `Base.Belt`, `Base.HolsterSimple`, `Base.HolsterDouble`;
