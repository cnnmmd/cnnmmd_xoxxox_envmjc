#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthapp="${pthsrc}"/appmjc
pthprm="${pthapp}/mujoco_model"
srcmjc='https://github.com/google-deepmind/mujoco.git'

test -d "${pthapp}" || mkdir "${pthapp}"

if test -d "${pthprm}"
then
  cd "${pthprm}" && git pull
else
  git clone --depth=1 --filter=blob:none --sparse ${srcmjc} "${pthprm}"
  cd "${pthprm}"
  git sparse-checkout set model
fi

addimg ${imgtgt} "${cnfimg}" "${pthdoc}"
