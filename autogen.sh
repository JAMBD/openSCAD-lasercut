#!/bin/bash
mkdir $1
for i in `seq 0 $2`;
do
	openscad -o $1/p$i.svg -D "dnum=$i" -D "dflat=true" -D "laserScale=3.52778"  $1.scad
	sed -i "s/lightgray\" stroke-width=\"0.5/none\" stroke-width=\"0.1/g" $1/p$i.svg
	inkscape -f $1/p$i.svg -A $1/p$i.pdf
done
