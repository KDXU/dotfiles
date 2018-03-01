#!/bin/bash
. ./env_vars

echo "Install Elixir-${ELIXIR_VERSION}"

curl -fSL -o elixir-precompiled.zip https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip
echo $(shasum -a 256 elixir-precompiled.zip)
unzip -d ~/packages/elixir/${ELIXIR_VERSION}/ elixir-precompiled.zip
rm elixir-precompiled.zip
echo "Completed"
