#!/bin/bash

for version in wow
do
  wget -O "UiTextureAtlas.csv" "https://wago.tools/db2/UiTextureAtlas/csv?build=7.3.5.26972"
  wget -O "UiTextureAtlasMember.csv" "https://wago.tools/db2/UiTextureAtlasMember/csv?build=7.3.5.26972"
  wget -O "UiTextureAtlasElement.csv" "https://wago.tools/db2/UiTextureAtlasElement/csv?build=8.0.1.26367"

  lua ./atlas_update.lua ${version}
done

mv Atlas_Retail.lua ../../WeakAuras/
# mv Atlas_Vanilla.lua ../../WeakAuras/
# mv Atlas_Cata.lua ../../WeakAuras/
