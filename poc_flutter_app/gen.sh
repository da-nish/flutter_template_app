#!/bin/bash

# Check if a name was provided
if [ -z "$1" ]; then
  echo "Usage: ./gen.sh <name>"
  exit 1
fi

# Run the long Dart command
dart run ../packages/ps_cli/bin/ps_cli.dart generate -n "$1"