#!/bin/bash
input=`acpi \
    | sed "s/Battery 0: //g" - \
    | sed "s/,//g" - \
    | sed "s/%.*/%/g" -`

echo "⚡ $input"
