#!/bin/bash
# Optionally pass in the platform tag (e.g. manylinux1) as first arg.
if [ "$#" -eq  "0" ]; then
    plat=""
else
    plat="--plat-name $1"
fi
pip3 install twine wheel
cp ../../LICENSE.txt package
cp ../../build/install/Python_Examples/MalmoPython.so package/malmo
cp ../../build/install/Python_Examples/malmoutils.py package/malmo
cp ../../build/install/Python_Examples/run_mission.py package/malmo
cd package
python3 setup.py bdist_wheel $plat
rm package/malmo/MalmoPython.so
twine upload package/dist/*
