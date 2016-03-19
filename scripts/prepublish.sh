#!/bin/bash

set -e
set -o pipefail
export REALM_CORE_VERSION=`bash ./scripts/download-core.sh --version`
echo "Core Version:$REALM_CORE_VERSION" 
cd "$(dirname "$0")/.."

if [ -n "$REALM_BUILD_ANDROID" ]; then
  rm -rf android
  (cd react-native/android && ./gradlew publishAndroid)
fi
