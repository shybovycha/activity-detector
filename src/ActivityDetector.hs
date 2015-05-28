module ActivityDetector where

-- sample data
{-
--running--
ts = [ 64, 164, 264, 364, 465, 565, 665, 766, 866, 966, 1067, 1167, 1267, 1368, 1468, 1569, 1677, 1777, 1877, 1977, 2077, 2177, 2278, 2378, 2478, 2578, 2678, 2778, 2878, 2978, 3078, 3178, 3278, 3378, 3478, 3578, 3678, 3778, 3878, 3978, 4078, 4178, 4278, 4378, 4478, 4578, 4678, 4778, 4878, 4978, 5078, 5179, 5279, 5379, 5479, 5580, 5680, 5780, 5880, 5980, 6080, 6180, 6280, 6380, 6480, 6580, 6680, 6781, 6882, 6982, 7082, 7183, 7284, 7385, 7485, 7585, 7685, 7786, 7886, 7986, 8086, 8186, 8286, 8386, 8486, 8586, 8686, 8786, 8887, 8987, 9087, 9188, 9289, 9390, 9490, 9590, 9690, 9790, 9890, 9990, 10090, 10191, 10291, 10392, 10492, 10592, 10692, 10792, 10892, 10993, 11093, 11193, 11293, 11393, 11493, 11593, 11693, 11793, 11893, 11994, 12095, 12195, 12296, 12396, 12496, 12596, 12696, 12796, 12896, 12996, 13096, 13196, 13296, 13397, 13497, 13597, 13697, 13797, 13897, 13997, 14097, 14197, 14297, 14397, 14497, 14597, 14697, 14797, 14897, 14997, 15097, 15197, 15297, 15397, 15497, 15597, 15697, 15797, 15898, 15998, 16098, 16199, 16299, 16399, 16499, 16599, 16699, 16799, 16899, 16999, 17099, 17202, 17303, 17403, 17504, 17604, 17704, 17804, 17904, 18004, 18104, 18204, 18304, 18404, 18504, 18604, 18704, 18804, 18919, 19019, 19120, 19220, 19320, 19421, 19521, 19622, 19722, 19822, 19922, 20022, 20123, 20223, 20323, 20423, 20523, 20624, 20724, 20824, 20950, 21051, 21151, 21251, 21351, 21451, 21551, 21651, 21751, 21851, 21951, 22052, 22153, 22253, 22353, 22453, 22553, 22654, 22754, 22854, 22954, 23054, 23154, 23254, 23354, 23454, 23554, 23654, 23754, 23854, 23954, 24054, 24154, 24254, 24354, 24454, 24554, 24654, 24754, 24854, 24954, 25055, 25155, 25255, 25355, 25455, 25555, 25655, 25755, 25856, 25956, 26057, 26157, 26257, 26357, 26457, 26557, 26657, 26757, 26857, 26957, 27057, 27157, 27257, 27357, 27457, 27557, 27658, 27758, 27858, 27958, 28059, 28159, 28259, 28360, 28460, 28560, 28660, 28761, 28861, 28961, 29061, 29161, 29261, 29361, 29461, 29562, 29662, 29762, 29862, 29962, 30062, 30162, 30262, 30362, 30462, 30562, 30662, 30762, 30862, 30962, 31062, 31162, 31262, 31364, 31464, 31564, 31664, 31764, 31864, 31964, 32064, 32165, 32266, 32366, 32466, 32566, 32666, 32766, 32867, 32967, 33067, 33167, 33267, 33367, 33467, 33567, 33667, 33767, 33867, 33967, 34067, 34167, 34267, 34367, 34467, 34567, 34667, 34767, 34867, 34967, 35067, 35167, 35267, 35367, 35467, 35567, 35667, 35767, 35867, 35967, 36067, 36167, 36267, 36367, 36467, 36567, 36667, 36767, 36867, 36967, 37067, 37167, 37267, 37367, 37468, 37568, 37668, 37768, 37868, 37969, 38069, 38169, 38269, 38369, 38469, 38569, 38669, 38769, 38869, 38969, 39069, 39169, 39270, 39370, 39470, 39570, 39670, 39771, 39871, 39972 ]
xs = [ -2.585, -2.231, -2.844, -0.833, -1.273, -1.082, -3.687, -14.653, -20.878, -15.323, -0.881, -2.193, -20.878, -11.032, 4.271, -13.819, -20.878, -20.878, -5.526, -19.403, -20.878, -20.878, -20.533, -20.878, -20.878, -20.878, -20.878, -20.878, -0.086, -0.928, -20.878, -4.855, 1.532, -20.878, -20.878, -20.878, -4.194, -8.351, -20.878, -20.878, -11.674, -20.878, -10.419, -18.512, -20.878, -3.007, -6.809, -20.054, -20.878, -11.253, -0.679, -20.878, -20.878, -5.909, -6.215, -20.878, -20.638, -7.565, -1.685, -20.878, -20.878, -13.733, -7.307, -19.776, -20.878, -6.043, -5.296, -20.878, -6.818, -2.882, -10.142, -20.878, -20.878, -2.968, -2.643, -19.211, -20.878, -8.332, 3.16, -20.878, -17.238, -5.181, -2.365, -20.878, -20.878, -3.744, -8.964, -20.878, -20.878, -2.786, 1.905, -17.966, -17.564, -3.275, -3.17, -20.878, -20.878, -8.14, 4.711, -0.162, -20.878, -0.967, -3.476, -3.457, -20.878, -20.878, -3.62, 1.541, -4.242, -20.878, 1.532, -4.644, -9.098, -20.878, -20.878, 6.445, -1.934, -11.751, -9.979, -4.166, -2.298, -7.029, -19.901, -3.284, 0.383, -0.756, -19.537, 6.311, -4.597, -2.7, -8.561, -7.537, -3.964, 0.21, 3.227, -20.179, 0.134, -2.461, -3.141, -16.654, -13.206, -3.945, 7.929, -6.589, -20.878, -2.949, -6.052, -2.241, -13.647, -10.4, -8.207, 1.628, 2.576, -20.878, -5.861, -1.953, -2.001, -12.795, -20.418, -6.531, 3.648, -1.925, -20.878, -11.032, -2.126, -2.49, -10.544, -17.765, -1.915, 3.495, -0.766, -20.878, -6.225, -5.851, -4.51, -16.415, -12.162, -0.038, 3.802, -1.963, -15.802, -3.974, -4.913, -10.659, -20.878, -7.556, 0.316, 2.719, -0.287, -15.907, -4.079, -3.782, -4.242, -20.878, -4.731, 0.469, -2.614, -1.771, -16.032, -2.7, -3.093, -8.006, -20.878, -13.599, -0.89, 2.461, -8.035, -17.123, -3.84, -0.603, -9.672, -20.878, -3.811, -0.756, -2.059, -20.878, -7.154, -3.083, -10.63, -20.878, -8.619, 2.212, 2.796, -20.878, 0.814, -5.363, -4.759, -20.878, -19.125, 2.949, -0.545, -14.107, -12.9, 0.766, -2.384, -14.068, -20.878, -12.775, -1.953, -10.563, -20.878, -5.727, -5.028, -11.109, -20.878, -2.499, 1.187, -1.963, -20.878, -6.799, -5.583, -19.173, -20.878, -4.175, 5.554, 4.855, -20.849, -5.65, -6.991, -12.344, -20.878, -10.621, 2.48, -8.897, -20.878, 5.209, -6.723, -14.969, -20.878, -1.474, 0.814, -6.914, -12.852, -0.632, -13.771, -20.878, -13.925, 1.656, -4.453, -6.493, -7.546, -1.072, -15.122, -20.408, -5.822, 1.436, -2.116, -16.041, 1.063, -1.149, -4.108, -20.878, -15.294, 1.532, -3.419, -4.644, -2.212, -4.443, -5.171, -20.878, -4.865, -0.938, 1.599, -20.878, -16.75, -6.11, -6.349, -8.916, -8.791, 1.254, 3.227, -18.311, -4.28, -5.363, -3.17, -20.878, -9.615, 0.603, -0.555, -14.557, -3.093, -3.208, -4.893, -15.467, -9.184, -4.865, -7.891, -3.141, -2.719, -3.907, -7, -5.43, -15.792, -7.546, -5.717, -1.57, -18.847, -8.523, -12.871, -10.812, -20.859, -6.311, -8.552, -6.656, 8.686, -7.048, -11.626, -16.635, -20.226, -8.667, -2.317, -1.379, -16.989, -9.423, -9.864, -12.143, -15.783, -6.253, -3.275, -3.17, -10.381, -0.871, -16.75, -20.878, -13.925, -2.825, -6.531, -3.352, -15.285, -9.098, -9.73, -20.878, -4.932, -3.217, -2.997, 1.561, -8.312, -15.677, -20.878, -16.214, -2.959, -5.114, 13.36, -13.8, -20.878, -14.806, -20.878, -10.324, -10.237, -7.498, -6.771, 0.871, 1.695, -0.067, -1.091, 0.469, -0.833, -0.976, -1.743 ]
ys = [ 5.698, 5.755, 6.282, 5.928, 5.229, 4.635, 3.409, -6.684, -8.676, 12.66, 18.503, 11.664, 11.473, -19.824, -19.824, -19.824, -14.643, 10.956, 15.036, 3.687, 11.214, -19.815, -19.824, -19.824, 19.393, 13.245, -2.949, -15.859, -17.19, -17.631, 10.898, 15.85, 19.393, 16.587, -2.059, -9.232, -17.171, -9.826, 11.693, 4.242, 2.164, 9.165, 9.27, 6.905, 11.799, -2.288, -18.685, -14.087, 6.933, 14.643, 19.393, 4.252, 16.53, -16.913, -17.152, -18.598, 14.107, 14.289, -0.747, 19.393, 8.312, -19.336, -14.231, -12.728, 13.149, 15.639, 5.87, 19.393, -9.902, -12.172, -19.824, 13.8, 19.393, 6.876, 6.273, 19.393, 6.799, -19.824, -19.824, -18.972, 17.42, 17.009, 14.662, 19.393, 7.949, -17.114, -19.805, -14.7, 16.616, 9.5, 8.638, 10.898, 1.79, -12.565, -14.423, -5.114, 6.943, 11.301, 10.525, 7.728, 19.393, -4.721, -11.09, -11.214, 13.436, 19.393, 10.199, 2.595, 6.282, 19.068, -5.114, -8.705, -11.684, 19.393, 19.393, 5.238, 5.401, 19.384, 5.219, -6.972, -8.312, -5.142, 19.393, 11.205, 0.526, 5.631, 19.393, -2.154, -5.545, -6.043, 8.485, 17.009, 8.494, -1.819, 6.991, 19.393, 1.838, -6.416, -6.091, -1.436, 18.11, 10.678, 3.179, 14.538, 19.393, -2.547, -8.073, -7.106, 3.352, 19.393, 11.904, 1.197, 5.621, 19.393, -1.992, -9.414, -9.251, -4.156, 19.336, 10.266, 3.237, 4.798, 15.409, -1.177, -5.698, -6.742, -7.728, 19.393, 5.66, 5.219, 7.221, 18.656, -1.589, -12, -10.429, -4.328, 19.393, 5.095, 2.71, 9.807, 9.663, -4.328, -9.787, -5.631, 15.122, 15.735, 4.692, 2.71, 16.951, 6.522, -6.771, -7.814, -4.28, 19.393, 9.548, -1.273, 8.992, 19.393, 10.515, -5.171, -6.885, -8.437, 19.393, 16.53, 4.989, 3.974, 18.407, 8.935, -9.222, -9.95, -10.898, 17.823, 11.138, 10.123, 8.188, 7.996, -8.016, -9.27, -10.075, 9.845, 13.551, 7.642, 6.119, 19.393, -6.751, -13.264, -8.15, 19.393, 13.408, 7.134, 13.657, 19.393, -2.346, -11.176, -10.467, -9.031, 16.53, 12.632, 11.042, 16.415, 19.393, -8.063, -15.744, -10.237, 19.393, 10.678, 7.087, 8.801, 18.206, -0.402, -9.864, -4.855, 19.393, 10.745, 6.636, 4.156, 19.393, -6.215, -12.919, -12.699, 19.393, 17.583, 7.92, 15.754, 19.393, -8.82, -13.216, -7.987, 19.393, 12.498, 9.443, 18.656, 1.666, -7.776, -12.287, 19.393, 19.393, 9.366, 8.198, 19.393, 4.395, -11.77, -4.644, 12.038, 13.848, 9.194, 5.458, 19.393, -3.869, -7.958, -6.234, 19.393, 18.234, 8.073, 5.344, 19.393, 1.283, -10.525, -7.757, 19.384, 10.17, 5.43, 2.547, 19.393, 9.356, -9.941, -5.008, 10.477, 14.336, 6.454, 5.468, 19.393, 2.174, -4.836, -6.225, 19.393, 18.052, 5.707, 5.497, 19.393, 4.166, -4.778, -2.739, 17.813, 14.71, 8.782, 4.271, 5.468, 7.949, 2.729, 4.951, 3.371, 18.905, 7.173, 2.997, -0.124, 9.452, 3.514, 3.974, 0.708, 11.511, 9.931, 2.806, -0.498, 10.697, -3.198, -0.871, 6.062, 10.123, 9.615, 7.211, 4.529, 4.874, -3.83, 2.853, 2.135, 11.032, 6.608, 4.798, 17.631, -7.24, -17.641, -0.421, 17.401, 15.687, 11.827, -0.584, 0.737, -1.034, 7.431, 5.688, 14.557, 9.155, 5.286, 5.564, -2.509, -7.393, 4.75, 16.185, 13.657, 3.754, -1.599, -2.241, -2.145, 5.171, 7.661, 15.898, 8.341, 4.587, -2.719, 0.124, 2.087, 4.539, 3.811, 3.993, 4.865, 5.42, 4.683, 2.413 ]
zs = [ 8.935, 8.437, 7.527, 6.876, 6.924, 6.378, 5.669, -4.194, 5.87, 0.373, -3.639, 3.744, 18.876, -4.223, -8.035, 4.118, 19.93, -18.962, 5.688, 13.915, 19.786, -3.514, 5.449, 19.93, -9.28, -0.105, 15.955, -0.622, -3.016, -7.374, 16.051, 19.93, -2.988, 12.938, 2.767, -0.565, -6.071, 1.81, 12.287, 11.617, -2.93, 3.639, 6.684, -1.886, 10.008, 13.992, -5.87, -3.198, 19.93, 3.629, 7.46, 7.632, 10.697, -3.687, -7.144, -7.355, 4.424, 4.836, 3.284, 19.93, 13.771, 0, 3.237, -14.729, -0.43, 12.45, 3.802, 13.838, 19.93, -0.526, -2.94, 19.92, 18.617, -0.114, 1.082, 4.683, 19.46, 1.13, -9.241, 19.93, 7.316, 8.198, 7.47, 19.93, 8.025, -7.604, 0.842, -2.212, 2.47, 3.323, 5.334, 12.344, 12.153, -0.938, -2.681, 16.855, 19.93, 9.107, 2.403, 5.133, 19.92, 13.283, -4.989, -0.325, 19.93, 19.834, 1.446, 3.83, 8.485, 10.563, -1.177, -1.484, -4.683, 19.709, 10.946, 3.064, -1.024, 16.147, 10.056, -5.631, -9.395, -1.819, 0.239, 1.063, 1.714, 0.105, 19.93, 6.933, -4.089, 2.183, -2.739, 9.615, 8.638, 1.369, 0.306, 19.93, 4.52, -3.505, -0.201, -3.859, 5.621, 5.142, 1.359, 5.229, 17.037, 5.64, -3.265, -3.984, 9.117, 11.042, -2.901, -0.201, 0.076, 19.93, 2.078, -4.577, -1.695, -2.595, 11.195, 8.14, 3.562, -0.44, 8.351, 7.977, -3.85, -1.992, -5.794, 17.439, 5.152, 8.399, -3.399, 14.068, 17.085, -4.022, -2.825, -2.269, 10.621, 1.283, 1.905, 3.505, 13.111, 3.438, -2.825, -1.053, 12.45, 5.717, 2.174, 2.317, 11.751, -2.47, 0.354, -5.956, -6.464, 2.901, 2.825, 4.099, 6.991, 3.16, 19.93, -7.91, -3.553, -5.344, 3.639, 4.041, 1.608, 3.84, 5.765, 9.538, 1.034, -1.187, -8.408, 8.676, 3.409, 4.52, 3.533, 8.552, 9.596, -2.116, -4.587, 19.93, 5.707, 2.365, -1.359, 19.91, 19.93, -3.304, -3.102, 10.103, -6.215, -0.086, 10.649, 19.93, 12.306, -5.028, -1.704, -5.037, 9.893, 0.718, 0.373, 11.042, 19.93, 9.893, -5.621, -7.489, 19.815, 7.479, 3.361, 0.584, 19.815, 7.604, -7.479, -2.825, 19.546, 8.839, 9.519, 8.38, 19.93, 6.407, -5.909, -3.438, 19.93, 1.905, 2.576, 4.549, 19.93, 15.562, -7.661, -2.691, 17.229, 3.629, 3.658, 10.419, 1.8, 6.474, 0.229, 19.93, 18.646, 3.447, 0.296, 9.864, 0.258, -6.033, 1.963, 19.93, 10.18, 5.353, 4.597, 19.183, 10.362, -5.43, -2.327, 11.693, 11.712, 5.899, 2.193, 11.406, 6.684, -5.506, -5.411, 12.191, 6.215, 1.292, 1.139, 19.93, 11.071, 1.474, -1.426, 5.813, 1.915, -0.229, 3.897, 19.92, 9.519, -2.078, -4.386, 11.09, 6.397, 3.936, -0.009, 17.583, 12.785, -3.093, -2.557, 2.48, 3.993, 1.369, 0.478, 1.465, 3.466, -2.03, -2.279, 9.366, 11.444, 3.802, 1.398, 0.057, 8.839, 3.284, 1.57, 3.725, 19.805, 15.208, -1.857, 2.106, 3.706, 2.154, -0.239, -4.041, 11.061, 7.508, 1.838, 2.662, 12.153, 4.798, -1.963, -1.503, 4.97, -1.34, -0.306, 4.003, -1.043, -4.769, 7.527, 14.978, 5.602, 2.193, 1.953, -3.342, 11.32, 2.423, -5.353, 13.34, 2.537, 1.053, 1.043, 1.752, 3.122, 3.687, 14.145, 9.653, -0.21, 1.963, -8.341, 1.158, 11.511, -0.134, 9.452, 11.808, 10.621, 3.227, 13.015, 15.639, 9.73, 7.422, 6.675, 9.27, 10.065, 6.857, 9.366 ]
-}

{-
--sitting--
ts = [ 23, 70, 170, 270, 370, 470, 570, 670, 770, 870, 971, 1072, 1172, 1273, 1373, 1474, 1574, 1674, 1774, 1874, 1974, 2074, 2174, 2274, 2374, 2475, 2575, 2675, 2775, 2875, 2975, 3076, 3176, 3276, 3376, 3476, 3576, 3676, 3776, 3876, 3976, 4076, 4177, 4277, 4377, 4478, 4578, 4678, 4778, 4878, 4979, 5079, 5180, 5280, 5380, 5480, 5581, 5681, 5781, 5881, 5981, 6081, 6181, 6282, 6382, 6482, 6582, 6682, 6783, 6883, 6983, 7083, 7183, 7283, 7383, 7484, 7584, 7684, 7784, 7884, 7985, 8086, 8187, 8287, 8387, 8489, 8589, 8689, 8790, 8890, 8990, 9090, 9190, 9290, 9390, 9490, 9591, 9691, 9791, 9892, 9993, 10093, 10193, 10293, 10393, 10493, 10593, 10693, 10794, 10894, 10995, 11095, 11195, 11296, 11396, 11498, 11599, 11699, 11800, 11902, 12002, 12102, 12202, 12302, 12403, 12503, 12604, 12704, 12805, 12905, 13005, 13105, 13205, 13306, 13407, 13507, 13608, 13709, 13810, 13911, 14012, 14112, 14212, 14312, 14413, 14514, 14614, 14715, 14815, 14915, 15015, 15115, 15215, 15315, 15416, 15516, 15616, 15716, 15816, 15916, 16016, 16116, 16216, 16321, 16421, 16521, 16621, 16721, 16821, 16921, 17021, 17121, 17221, 17321, 17421, 17521, 17621, 17721, 17821, 17921, 18021, 18121, 18221, 18321, 18421, 18521, 18621, 18721, 18822, 18922, 19022, 19122, 19222, 19323, 19423, 19523, 19623, 19723, 19823, 19923, 20023, 20123, 20223, 20323, 20423, 20524, 20624, 20725, 20826, 20927, 21027, 21128, 21228, 21328, 21428, 21528, 21628, 21728, 21828, 21928, 22028, 22128, 22228, 22328, 22428, 22528, 22628, 22728, 22828, 22929, 23029, 23129, 23229, 23329, 23429, 23529, 23629, 23730, 23830, 23930, 24031, 24131, 24231, 24331, 24431, 24531, 24631, 24731, 24831, 24931, 25031, 25131, 25231, 25331, 25431, 25531, 25631, 25732, 25832, 25932, 26032, 26133, 26233, 26333, 26433, 26533, 26633, 26734, 26834, 26934, 27034, 27134, 27234, 27334, 27434, 27534, 27634, 27734, 27834, 27934, 28034, 28134, 28234, 28334, 28434, 28534, 28634, 28734, 28834, 28934, 29034, 29135, 29235, 29335, 29435, 29535, 29635, 29735, 29835, 29935, 30035, 30135, 30235, 30335, 30435, 30535, 30636, 30736, 30836, 30936, 31036, 31136, 31236, 31336, 31436, 31536, 31643, 31744, 31845, 31945, 32045, 32145, 32245, 32345, 32446, 32546, 32647, 32747, 32847, 32947, 33048, 33148, 33248, 33348, 33448, 33548, 33648, 33749, 33849, 33949, 34049, 34149, 34249, 34349, 34449, 34549, 34650, 34750, 34850, 34950, 35050, 35150, 35250, 35350, 35451, 35551, 35652, 35753, 35853, 35954, 36054, 36154, 36254, 36354, 36455, 36555, 36655, 36755, 36855, 36955, 37055, 37155, 37255, 37355, 37455, 37555, 37655, 37756, 37856, 37956, 38056, 38156, 38257, 38357, 38457, 38557, 38658, 38758, 38858, 38958, 39058, 39158, 39258, 39362, 39462, 39563, 39663, 39763, 39863, 39963, 40063, 40163, 40264, 40365, 40465, 40566, 40667, 40767, 40867, 40967, 41068, 41168, 41268, 41374, 41475, 41575, 41677, 41777, 41877, 41977, 42077, 42178, 42278, 42378, 42478, 42578, 42679, 42779, 42880, 42980, 43080, 43180, 43280, 43380, 43480, 43580, 43680, 43780, 43880, 43980, 44080, 44180, 44280, 44380, 44480, 44580, 44682, 44782, 44882, 44982, 45082, 45182, 45282, 45382, 45482, 45583, 45684, 45784, 45885, 45985, 46086, 46186, 46286, 46386, 46487, 46588, 46688, 46788, 46888, 46988, 47088, 47188, 47288, 47388, 47488, 47588, 47688, 47788, 47888, 47988, 48088, 48188, 48288, 48388, 48489, 48589, 48689, 48789, 48889, 48989, 49089, 49189, 49289, 49389, 49489, 49589, 49689, 49789, 49889, 49989, 50089, 50189, 50289, 50389, 50489, 50593, 50693, 50793, 50894, 50994, 51094, 51194, 51295, 51395, 51495, 51595, 51695, 51795, 51895, 51996, 52096, 52196, 52296, 52396, 52496, 52596, 52696, 52796, 52896, 52996, 53096, 53196, 53297, 53397, 53497, 53597, 53698, 53799, 53899, 54000, 54100, 54200, 54300, 54400, 54500, 54601, 54701, 54801, 54901, 55001, 55101, 55201, 55301, 55401, 55501, 55601, 55701, 55801, 55901, 56003, 56103, 56203, 56303, 56403, 56504, 56604, 56704, 56805, 56905, 57006, 57107 ]
xs = [ -1.216, -1.273, -1.273, -1.331, -1.235, -0.249, 3.438, 1.733, 1.81, -1.58, -2.93, -2.691, -2.672, -2.786, -3.332, -5.43, -7.182, -4.386, -3.323, -0.277, -2.614, -2.681, -5.631, -2.834, 1.149, 2.394, -1.992, -1.57, -1.81, -2.499, -2.135, -4.003, -3.141, -2.796, -3.256, -4.07, -4.568, -4.099, -3.744, -3.553, -3.984, -3.39, -4.022, -3.514, -3.16, -3.821, -3.572, -3.763, -4.127, -3.811, -4.003, -4.443, -4.194, -3.715, -2.959, -3.648, -3.725, -4.443, -4.654, -4.491, -4.357, -4.242, -4.022, -4.29, -4.549, -4.568, -3.15, -3.371, -3.955, -4.012, -4.261, -3.936, -4.223, -3.61, -3.016, -3.706, -4.003, -3.83, -3.601, -3.658, -3.696, -3.543, -3.715, -3.725, -3.533, -3.371, -3.476, -3.725, -3.773, -3.323, -3.208, -2.978, -3.419, -3.601, -3.284, -2.968, -3.342, -3.237, -3.15, -3.246, -3.198, -3.227, -3.304, -3.17, -3.294, -3.237, -3.189, -3.217, -3.284, -3.332, -3.217, -3.284, -3.275, -3.39, -3.361, -3.38, -3.361, -3.246, -3.284, -3.284, -3.275, -3.313, -3.313, -3.428, -5.669, -0.143, -2.346, -5.64, -4.568, -4.731, -6.32, -5.382, -5.794, -6.081, -5.535, -5.344, -5.238, -5.286, -5.028, -4.654, -5.095, -4.644, -4.424, -5.66, -5.593, -5.612, -7.958, -5.842, -5.382, -5.765, -4.415, -4.97, -4.462, -4.922, -4.635, -4.003, -4.788, -3.936, -3.62, -4.453, -4.242, -4.156, -4.108, -4.319, -3.926, -5.114, -4.462, -3.16, -5.813, -4.003, -4.491, -4.778, -4.625, -4.855, -4.194, -4.683, -5.123, -5.075, -5.411, -5.956, -4.453, -4.884, -5.075, -4.118, -5.018, -4.501, -5.401, -5.411, -5.286, -4.807, -5.2, -5.43, -5.19, -5.372, -5.085, -5.286, -5.344, -4.874, -4.865, -5.918, -4.893, -4.213, -4.922, -6.646, -5.755, -3.237, -7.747, -8.073, -5.889, -3.754, -9.021, -5.918, -4.568, -6.857, -8.102, -7.134, -4.807, -6.349, -7.652, -6.34, -0.124, -4.386, -5.382, -4.415, -3.821, -5.257, -8.207, -7.805, -7.824, -7.087, -6.445, -8.006, -7.949, -5.947, -6.407, -6.838, -5.775, -6.522, -6.627, -6.292, -6.407, -5.937, -6.119, -6.234, -5.832, -6.071, -5.631, -5.315, -5.65, -4.348, -5.545, -4.654, -5.679, -7.269, -6.301, -5.688, -5.851, -6.158, -7.403, -6.799, -6.56, -10.123, -7.125, -6.589, -6.905, -5.286, -7.546, -5.526, -7.604, -6.359, -6.694, -8.609, -7.316, -8.619, -6.253, -5.411, -7.881, -7.23, -6.933, -7.546, -7.728, -7.632, -7.728, -8.36, -6.78, -8.38, -6.742, -7.575, -8.648, -8.044, -7.431, -8.408, -7.355, -4.309, -9.625, -7.278, -7.996, -7.719, -9.433, -7.834, -7.383, -7.527, -7.058, -8.619, -6.368, -7.642, -6.876, -7.939, -7.173, -7.47, -7.374, -6.646, -8.801, -8.763, -7.508, -7.039, -6.368, -9.05, -8.14, -7.92, -7.374, -8.447, -6.636, -7.632, -7.891, -7.422, -6.723, -8.667, -8.696, -7.786, -6.962, -8.37, -7.374, -7.182, -7.364, -7.786, -8.284, -7.757, -6.78, -7.451, -7.221, -7.316, -7.479, -7.431, -6.972, -9.51, -9.366, -5.803, -11.195, -10.017, -8.054, -10.467, -8.178, -6.177, -6.876, -7.077, -7.355, -6.656, -5.497, -6.081, -5.42, -5.257, -5.573, -5.535, -5.42, -5.047, -5.066, -5.018, -5.334, -5.152, -4.893, -5.267, -5.066, -4.836, -4.606, -4.913, -4.338, -4.731, -4.817, -4.357, -4.3, -4.549, -5.152, -5.909, -7.843, -6.091, -3.696, -5.794, -4.213, -5.64, -5.928, -3.859, -5.056, -5.468, -6.129, -5.334, -4.999, -4.261, -6.464, -5.688, -6.608, -5.066, -3.859, -5.066, -4.587, -5.257, -6.454, -5.363, -6.225, -5.832, -6.234, -5.468, -3.553, -4.041, -4.3, -5.746, -4.75, -2.729, -3.313, -3.419, -2.892, -4.395, -4.635, -2.691, -3.591, -3.601, -3.763, -3.802, -3.428, -4.357, -6.397, -2.652, 3.265, 3.601, 4.721, 4.721, 4.826, 5.861, 4.807, 6.502, 1.762, 5.075, 4.817, 1.359, -1.063, -1.522, -4.194, -3.639, -1.187, -0.469, -1.063, -0.996, 0.239, -1.283, -2.901, -1.465, -1.149, -1.005, -0.584, -0.976, -2.346, -2.231, -2.557, -1.905, -2.298, -2.346, -2.662, -2.394, -1.944, -2.288, -2.298, -2.566, -2.451, -2.719, -2.365, -2.365, -2.614, -2.672, -2.547, -2.844, -2.518, -2.384, -2.48, -2.413, -2.164, -2.557, -2.729, -2.394, -1.369, -2.068, -1.589, -1.446, -1.197, -1.379, -1.235, -1.369, -2.154, -1.484, -2.336, -2.164, -1.838, -1.992, -2.049, -1.905, -2.183, -2.269, -2.097, -2.193, -1.963, -1.953, -1.867, -2.288, -2.221, -2.106, -1.992, -2.087, -2.116, -2.25, -2.116, -2.241, -2.126, -2.202, -2.221, -2.269, -2.317, -1.867, -2.25, -2.336, -2.183, -2.221, -2.423, -2.212, -2.221, -2.384, -2.212, -2.241, -2.317, -1.934, -2.154, -2.03, -2.011, -0.996, -1.225, -1.225, -1.819, -0.019, 2.154, -0.986, -1.187, -2.643, -0.871, -2.672, 0.277, -1.474, -1.005, -2.662, -1.139, -0.143, 1.676, 0.411, 0.421, 0.766, 0.363, 0.689, 0.45, 0.383, 0.622, 0.507, 1.101, 0.593, -0.517 ]
ys = [ 0.287, 0.258, 0.268, 0.277, 0.287, 0.66, 1.628, 1.886, 4.606, 5.411, 5.573, 5.286, 7.307, 6.627, 9.51, 6.732, 2.509, 7.565, 9.308, 9.73, 10.027, 9.941, 6.732, 9.155, 5.832, 9.127, 9.653, 8.724, 6.981, 6.445, 5.286, 6.244, 5.516, 3.917, 3.428, 2.672, 2.739, 2.767, 2.576, 2.786, 2.164, 2.039, 3.035, 2.863, 2.279, 2.413, 2.815, 2.451, 2.614, 2.652, 2.346, 2.633, 2.729, 2.624, 2.652, 2.815, 2.844, 3.045, 3.189, 3.342, 3.658, 3.773, 4.031, 4.175, 3.639, 3.677, 3.639, 3.332, 3.447, 3.265, 3.198, 2.863, 3.045, 3.313, 3.256, 3.313, 3.093, 2.93, 2.758, 2.911, 2.921, 2.672, 2.739, 2.806, 2.758, 2.681, 2.691, 2.595, 2.7, 2.844, 2.566, 2.355, 2.355, 2.384, 2.279, 2.126, 2.336, 2.528, 2.25, 2.221, 2.317, 2.298, 2.25, 2.126, 2.279, 2.174, 2.183, 2.193, 2.26, 2.183, 2.221, 2.212, 2.231, 2.174, 2.145, 2.231, 2.183, 2.26, 2.25, 2.193, 2.202, 2.231, 2.231, 2.231, 3.189, 3.869, 3.744, 4.405, 4.051, 4.041, 3.581, 3.648, 3.629, 3.763, 3.62, 3.419, 3.093, 3.179, 2.873, 2.691, 3.026, 3.601, 4.194, 5.353, 4.012, 3.869, 4.175, 3.706, 2.241, 0.861, 1.312, 1.149, 2.413, 2.614, 2.518, 2.183, 0.785, 0.756, 2.097, 1.12, 1.331, 1.388, 1.177, 1.446, 0.009, 2.451, 2.911, 0.785, 1.532, 1.829, 1.388, 1.676, 1.762, 1.359, 2.241, 1.972, 2.442, 2.432, 2.384, 3.304, 2.097, 1.944, 1.896, 1.666, 1.829, 1.685, 2.394, 2.509, 2.001, 1.848, 2.413, 2.604, 2.796, 3.016, 3.629, 3.907, 3.926, 2.585, 2.662, 2.863, 2.384, 1.992, 2.71, 3.294, 4.328, 3.993, 3.859, 3.016, 1.024, 2.873, 0.488, 1.398, 2.7, 3.514, 2.968, 1.982, 1.81, 1.752, 2.231, 3.773, 4.453, 8.447, 9.05, 8.475, 7.958, 7.048, 6.311, 5.937, 4.529, 4.328, 3.035, 2.288, 2.308, 3.869, 3.265, 3.629, 2.164, 1.934, 1.867, 2.375, 2.26, 1.925, 2.068, 2.279, 1.915, 2.126, 2.403, 2.375, 2.442, 3.16, 2.825, 3.361, 3.447, 3.572, 3.457, 3.419, 3.323, 3.533, 4.099, 3.754, 3.246, 2.796, 2.269, 2.681, 3.782, 3.007, 2.48, 2.767, 4.003, 3.773, 2.585, 2.413, 2.068, 2.145, 4.501, 3.016, 2.796, 3.131, 3.179, 3.093, 2.873, 3.026, 2.7, 2.241, 2.087, 2.691, 3.198, 2.844, 3.553, 3.38, 3.093, 2.576, 3.792, 3.064, 2.212, 3.064, 3.782, 3.677, 3.725, 3.399, 2.988, 2.681, 2.691, 2.145, 2.384, 2.087, 2.174, 2.777, 2.71, 3.371, 3.007, 3.112, 3.725, 3.026, 2.767, 2.882, 2.719, 3.045, 2.825, 2.403, 2.901, 4.041, 2.815, 2.068, 3.093, 2.968, 2.767, 3.198, 3.533, 3.39, 2.806, 2.49, 2.528, 2.806, 2.882, 3.045, 3.016, 2.681, 2.336, 2.423, 3.447, 3.313, 3.964, 4.031, 3.754, 2.221, 2.078, 2.978, 3.323, 2.911, 3.074, 1.398, 3.572, 4.233, 3.409, 3.026, 3.208, 3.102, 2.547, 1.925, 1.934, 1.417, 1.877, 2.193, 2.509, 2.375, 2.509, 2.26, 2.528, 2.576, 2.145, 2.202, 2.039, 2.212, 2.02, 2.106, 2.106, 1.8, 1.752, 1.273, 1.168, 1.331, 1.685, 1.877, 2.106, 2.528, 3.361, 3.562, 0.861, 0.526, 0.766, -0.114, 0.612, 0.967, 1.522, 0.881, 0.861, 0.612, 0.785, 0.679, 0.181, 0.172, -0.421, 0.306, -1.149, -0.354, 1.532, -0.114, 0.881, -0.565, 1.398, 1.063, 0.651, 0.833, 1.589, 3.505, 3.246, 1.781, 2.672, 2.193, 2.03, 2.499, 2.509, 1.503, 1.829, 3.074, 3.476, 3.878, 4.932, 6.32, 7.087, 6.742, 8.81, 9.529, 6.55, 7.814, 7.374, 7.958, 7.067, 8.303, 5.42, 7.087, 6.742, 8.753, 9.366, 7.077, 8.399, 6.426, 5.707, 4.271, 4.529, 5.008, 4.453, 5.085, 4.97, 4.443, 3.763, 3.964, 4.06, 3.907, 4.52, 4.472, 4.817, 4.96, 4.96, 4.922, 5.133, 5.028, 5.123, 5.095, 5.181, 5.104, 5.162, 4.903, 4.97, 4.884, 4.96, 4.913, 4.807, 5.047, 4.826, 4.798, 5.171, 5.095, 4.98, 5.047, 4.817, 4.721, 4.606, 4.625, 4.597, 4.558, 4.309, 4.376, 4.328, 4.501, 4.357, 4.185, 4.309, 4.376, 4.242, 4.194, 4.223, 4.031, 4.261, 4.213, 4.079, 4.099, 4.137, 4.223, 4.309, 4.434, 4.424, 4.271, 4.271, 4.405, 4.453, 4.434, 4.415, 4.482, 4.415, 4.348, 4.271, 4.568, 4.328, 4.242, 4.309, 4.395, 4.166, 4.28, 4.395, 4.185, 4.261, 4.3, 4.28, 4.156, 4.223, 4.233, 4.3, 4.539, 4.616, 5.104, 5.152, 5.257, 6.263, 5.554, 7.422, 6.828, 8.198, 6.445, 5.296, 5.382, 4.941, 3.428, 2.298, 2.729, 3.706, 4.692, 5.257, 6.876, 6.943, 6.962, 6.895, 6.953, 7.029, 7.067, 6.991, 6.78, 6.991, 6.627, 6.502 ]
zs = [ 9.874, 9.835, 9.864, 9.318, 9.816, 10.381, 14.767, 5.535, 6.617, 10.027, 7.048, 6.33, 7.776, 8.504, 4.635, 7.383, 5.037, 8.284, 2.432, 2.968, 6.368, 0.718, 3.524, 5.573, 8.801, 0.957, 4.893, -7.02, -6.349, -8.782, -8.648, -8.533, -7.652, -9.059, -9.423, -8.494, -8.6, -8.887, -8.791, -7.431, -9.51, -8.59, -7.527, -7.901, -8.715, -7.862, -8.341, -8.791, -9.241, -8.6, -8.801, -9.098, -8.897, -9.261, -8.437, -8.629, -8.178, -8.696, -8.648, -8.456, -8.734, -8.657, -7.814, -6.962, -8.945, -8.6, -8.226, -8.504, -8.437, -8.514, -9.73, -8.456, -9.194, -8.035, -8.063, -8.849, -9.768, -8.763, -8.629, -8.772, -8.925, -8.954, -9.146, -8.81, -8.82, -8.925, -8.648, -8.782, -9.174, -9.002, -8.878, -8.983, -8.629, -9.184, -8.868, -8.724, -9.414, -9.194, -8.983, -9.165, -8.935, -9.117, -9.098, -9.088, -9.107, -9.261, -9.213, -9.127, -8.983, -9.146, -9.241, -9.012, -9.127, -9.213, -9.299, -9.002, -9.05, -9.165, -9.088, -9.241, -9.174, -9.088, -9.059, -9.222, -13.388, -4.798, -5.822, -8.437, -5.851, -6.809, -7.795, -7.604, -8.207, -7.738, -7.68, -7.728, -7.623, -8.312, -8.533, -8.016, -9.241, -8.312, -6.895, -6.541, -8.044, -6.234, -5.87, -6.723, -5.976, -10.544, -8.38, -9.203, -9.28, -9.012, -7.393, -8.676, -11.626, -9.941, -8.092, -9.73, -9.155, -8.935, -8.408, -7.776, -11.042, -10.056, -6.933, -8.073, -8.945, -7.977, -8.81, -8.581, -8.638, -9.481, -8.284, -7.929, -8.59, -8.456, -8.6, -7.814, -8.322, -9.711, -8.571, -9.059, -9.146, -8.341, -7.393, -8.121, -9.165, -8.945, -7.939, -8.102, -9.433, -9.299, -7.565, -6.043, -9.031, -8.839, -8.992, -9.376, -8.13, -9.127, -8.38, -7.891, -7.182, -6.914, -6.799, -13.963, -7.537, -3.811, -13.331, -9.921, -2.94, -6.895, -8.763, -9.241, -8.265, -9.079, -11.004, -8.351, 4.309, 1.321, 3.917, 4.051, 1.982, 4.233, -6.617, -1.915, -7.134, -6.579, -7.441, -11.569, -8.533, -6.522, -5.87, -5.775, -3.773, -10.668, -8.265, -6.732, -8.686, -8.236, -8.274, -7.834, -8.351, -9.155, -7.929, -8.226, -8.763, -8.36, -8.265, -8.054, -6.751, -8.38, -8.36, -7.489, -7.843, -8.169, -7.776, -4.75, -6.416, -10.601, -6.416, -7.125, -6.771, -4.233, -12.297, -6.177, -6.761, -6.32, -6.387, -7.738, -7.68, -7.412, -3.486, -4.28, -5.047, -4.721, -5.621, -6.905, -6.876, -7.154, -6.694, -8.274, -6.761, -7.288, -5.152, -6.761, -5.918, -5.43, -5.918, -7.431, -3.122, -4.558, -4.443, -4.539, -5.066, -4.587, -6.627, -5.545, -6.608, -6.953, -6.656, -7.02, -5.593, -7.939, -6.301, -6.78, -6.407, -7.575, -5.66, -7.326, -6.234, -6.905, -6.244, -6.694, -5.985, -8.667, -8.255, -6.972, -6.11, -5.142, -6.464, -8.332, -5.171, -6.809, -6.445, -8.265, -6.713, -4.989, -7.537, -7, -7.087, -6.838, -5.573, -7.096, -7.259, -7.374, -6.445, -6.608, -6.541, -6.943, -4.989, -3.457, -5.526, -7.115, -5.631, -1.503, -10.764, -6.292, -8.427, -6.866, -4.376, -4.118, -7.853, -8.351, -6.416, -8.102, -7.441, -9.51, -8.322, -8.82, -8.523, -8.466, -8.351, -8.312, -8.322, -9.098, -8.657, -8.629, -9.021, -9.031, -8.217, -8.542, -8.418, -8.638, -8.609, -8.504, -9.433, -8.427, -8.696, -9.031, -9.816, -9.529, -9.481, -5.765, -6.598, -6.541, -10.496, -12.919, -9.251, -10.477, -7.403, -9.548, -8.609, -8.973, -8.629, -10.123, -8.274, -8.188, -8.782, -10.486, -7.498, -7.46, -9.605, -10.4, -8.121, -10.946, -7.039, -9.682, -7.767, -10.027, -9.127, -9.28, -8.121, -8.245, -7.192, -9.529, -9.663, -9.328, -9.194, -9.759, -8.121, -10.391, -10.496, -8.734, -9.778, -8.485, -4.395, -8.849, -11.856, 4.788, 6.474, 0.766, 2.978, 1.666, -0.737, 2.806, 1.513, 3.352, -3.371, 0.747, 3.112, 1.963, -1.446, -2.595, -3.399, -9.318, -8.15, -8.533, -8.906, -8.169, -8.37, -8.992, -8.552, -8.312, -8.916, -9.174, -9.069, -8.887, -8.447, -8.494, -8.217, -8.15, -7.968, -8.054, -8.648, -7.872, -8.054, -7.661, -8.226, -8.159, -8.178, -8.226, -8.284, -8.178, -8.092, -8.312, -8.207, -7.977, -8.351, -8.638, -7.834, -8.092, -8.016, -7.853, -8.696, -8.791, -8.111, -7.987, -7.843, -8.427, -8.485, -9.031, -8.322, -8.533, -8.561, -8.81, -8.533, -8.332, -8.581, -8.159, -8.571, -8.696, -8.552, -8.38, -8.475, -8.83, -8.523, -8.696, -8.59, -8.523, -8.245, -8.686, -8.293, -8.782, -8.475, -8.456, -8.351, -8.552, -8.561, -8.284, -8.485, -8.37, -8.303, -8.753, -8.389, -8.312, -8.83, -8.504, -8.427, -8.504, -8.724, -8.418, -8.485, -8.705, -8.523, -8.734, -8.427, -8.743, -9.251, -7.632, -8.083, -8.025, -12.057, -8.743, -3.428, 2.853, 6.368, 6.119, 10.994, 8.351, 7.977, 6.483, 11.799, 9.749, 9.098, 10.429, 6.081, 8.13, 7.383, 6.55, 6.656, 7.163, 6.924, 7.249, 6.79, 7.077, 6.617, 7.058, 8.073 ]
-}

diffs [] = []
diffs (l1:[]) = [l1]
diffs (l1:l2:ls) = (l2 - l1) : (diffs ls)

avg [] = 0.0
avg l = (realToFrac (sum l)) / (realToFrac (length l))

findTimestampedHeaps timeStamps axisData = filter detectHeap timedPairs
    where
        timedPairs = zip timeStamps axisData
        maxHeap = maximum (map abs axisData)
        ampThreshold = 5.0 -- maximum amplitude threshold, m/s^2
        detectHeap = (\ (t, y) -> abs ((abs y) - maxHeap) < ampThreshold)

-- m/s^2
findHeapAmplitude axisData = (maximum axisData) - (minimum axisData)

-- Hz
findHeapFrequency timestampAxisData = 1000.0 / (avg timestampDiffs)
    where
        boundFct = (\ e -> e >= lowFreqThreshold && e <= highFreqThreshold)
        lowFreqThreshold = 100 -- heap frequency threshold, msec
        highFreqThreshold = 1500 -- heap frequency threshold, msec
        timestampDiffs = filter boundFct $ diffs (map fst timestampAxisData)

getAxisDataParams timestamps axisData = (freq, ampl)
    where
        timestampAxisData = findTimestampedHeaps timestamps axisData
        freq = findHeapFrequency timestampAxisData
        ampl = findHeapAmplitude axisData

getAccelDataParams (ts, xs, ys, zs) = (paramsX, paramsY, paramsZ)
    where
        paramsX = getAxisDataParams ts xs
        paramsY = getAxisDataParams ts ys
        paramsZ = getAxisDataParams ts zs

{-
detectActivity timestampedData = closest activityParams timestampedData
    where
        activityParams = [ ("Sitting", 0.0, 0.0), ("Staying", 0.0, 0.0), ("Walking", 0.0, 0.0), ("Jumping", 0.0, 0.0), ("Running", 0.0, 0.0) ]
-}