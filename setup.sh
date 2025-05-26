#!/usr/bin/env bash
# Setup script for UQLM development environment
# This script installs Poetry if necessary, installs project
# dependencies (including dev and test groups), and sets up
# pre-commit hooks.

set -e

# Install Poetry if not present
if ! command -v poetry >/dev/null 2>&1; then
  echo "Poetry not found. Installing..."
  python3 -m pip install --upgrade pip
  python3 -m pip install poetry
fi

# Install project dependencies using Poetry
poetry install --with dev,test

# Install pre-commit hooks
poetry run pre-commit install

echo "Setup complete."
