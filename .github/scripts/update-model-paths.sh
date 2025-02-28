#!/bin/bash

download_file() {
  local url=$1
  local output_file=$2

  wget -O "${output_file}" "${url}" || { echo "Error while downloading ${output_file}"; exit 1; }
}

update_model_paths() {
  local branch=$1

  local csv_file="${branch}.csv"
  download_file "https://wago.tools/api/files?build=7.3.5.26972&search=.m2&format=csv" "${csv_file}"
  echo "${build_config}" > "${last_build_file}"
  lua csv_to_lua.lua "${branch}" || { echo "Error while creating ${branch}.lua"; exit 1; }
}

download_file "https://wago.tools/api/builds/latest" ".wago_tools.json"

branches=("wow")

for branch in "${branches[@]}"
do
  update_model_paths "$branch"
done

mv ModelPaths*.lua ../../WeakAurasModelPaths/
