#!/bin/bash
. ./env_vars

echo "Install Elixir-${ELIXIR_VERSION}"
curl -fSL -o elixir-precompiled.zip https://repo.hex.pm/builds/elixir/${ELIXIR_VERSION}-otp-21.zip
echo $(shasum -a 256 elixir-precompiled.zip)
unzip -d ~/packages/elixir/${ELIXIR_VERSION}/ elixir-precompiled.zip
rm elixir-precompiled.zip
echo "Completed"
