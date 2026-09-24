# Contributing to Blockwild

## Branches
- `main`: releasable integration branch.
- `feature/<name>`: isolated feature work.
- `experiment/<name>`: uncertain technical experiments.
- `fix/<name>`: focused corrections.

## Commits
Commits should describe the actual change and its reason. Prefer small coherent commits over milestone dumps. Generic messages such as “update”, “changes”, and “release version” are discouraged.

## Pull requests
Risky engine, networking, save-format, rendering, and world-generation changes should be developed on a branch and integrated through a PR when practical.

## Quality
When a quick shortcut and a maintainable implementation differ materially, prefer the maintainable implementation unless a deliberate game-design tradeoff justifies the simpler approach.

## Engine
Use Godot 4.4.1 stable. Changes that require a newer engine version must be proposed as an explicit migration.

## Release artifacts
GitHub Releases are source-only. Do not attach compiled executables.
