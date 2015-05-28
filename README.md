# ActivityDetector

## Overview

This program detects activity (sitting/walking/staying/jumping/running) from over a data, gathered from accelerometer and timestamped.

## Running

	$ ghci
	> :l ActivityDetector.hs

This will load all the code and sample data.

	map (getAxisDataParams ts) [ xs, ys, zs ]

This will return three tuples of `(frequency, amplitude)` for each of axes - X, Y and Z.
