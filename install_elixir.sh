#!/bin/bash
. ./env_vars

echo "Install Elixir-${ELIXIR_VERSION}"

curl -fSL -o elixir-precompiled.zip https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip
echo "${ELIXIR_DOWNLOAD_SHA256} elixir-precompiled.zip" | sha256sum -c -
unzip -d ~/packages/elixir/${ELIXIR_VERSION}/ elixir-precompiled.zip
rm elixir-precompiled.zip
echo "Completed"
