# ActivityDetector

## Overview

This program detects activity (sitting/walking/staying/jumping/running) from over a data, gathered from accelerometer and timestamped.

## Running

	$ ghci
	> :l src/ActivityDetector.hs samples/AccelDataRunning.hs
    > import AccelDataRunning

This will load all the code and sample data.

	getAccelDataParams (ts, xs, ys, zs )

This will return three tuples of `(frequency, amplitude)` for each of axes - X, Y and Z.

## Analysis

Here are samples' output parameters:

    jumping = ((2.9940119760479043,24.728),(1.7003188097768331,39.217),(2.5,38.729))

    sitting = ((7.075745273170166,17.697),(7.830853563038371,11.175999999999998),(2.901704751541531,28.729999999999997))

    walking = ((2.0268748592448014,16.147000000000002),(6.831476025788822,12.669),(5.457664119756744,12.812999999999999))

    staying = ((9.973310858266611,13.972),(8.962488129154796,12.813),(8.504398826979472,14.432))

    running = ((2.8987123028039465,34.238),(3.1576390575661892,39.217),(1.9150973507819982,38.891999999999996))
