module AccelDataRunning where

ts = [64,164,264,364,465,565,665,766,866,966,1067,1167,1267,1368,1468,1569,1677,1777,1877,1977,2077,2177,2278,2378,2478,2578,2678,2778,2878,2978,3078,3178,3278,3378,3478,3578,3678,3778,3878,3978,4078,4178,4278,4378,4478,4578,4678,4778,4878,4978,5078,5179,5279,5379,5479,5580,5680,5780,5880,5980,6080,6180,6280,6380,6480,6580,6680,6781,6882,6982,7082,7183,7284,7385,7485,7585,7685,7786,7886,7986,8086,8186,8286,8386,8486,8586,8686,8786,8887,8987,9087,9188,9289,9390,9490,9590,9690,9790,9890,9990,10090,10191,10291,10392,10492,10592,10692,10792,10892,10993,11093,11193,11293,11393,11493,11593,11693,11793,11893,11994,12095,12195,12296,12396,12496,12596,12696,12796,12896,12996,13096,13196,13296,13397,13497,13597,13697,13797,13897,13997,14097,14197,14297,14397,14497,14597,14697,14797,14897,14997,15097,15197,15297,15397,15497,15597,15697,15797,15898,15998,16098,16199,16299,16399,16499,16599,16699,16799,16899,16999,17099,17202,17303,17403,17504,17604,17704,17804,17904,18004,18104,18204,18304,18404,18504,18604,18704,18804,18919,19019,19120,19220,19320,19421,19521,19622,19722,19822,19922,20022,20123,20223,20323,20423,20523,20624,20724,20824,20950,21051,21151,21251,21351,21451,21551,21651,21751,21851,21951,22052,22153,22253,22353,22453,22553,22654,22754,22854,22954,23054,23154,23254,23354,23454,23554,23654,23754,23854,23954,24054,24154,24254,24354,24454,24554,24654,24754,24854,24954,25055,25155,25255,25355,25455,25555,25655,25755,25856,25956,26057,26157,26257,26357,26457,26557,26657,26757,26857,26957,27057,27157,27257,27357,27457,27557,27658,27758,27858,27958,28059,28159,28259,28360,28460,28560,28660,28761,28861,28961,29061,29161,29261,29361,29461,29562,29662,29762,29862,29962,30062,30162,30262,30362,30462,30562,30662,30762,30862,30962,31062,31162,31262,31364,31464,31564,31664,31764,31864,31964,32064,32165,32266,32366,32466,32566,32666,32766,32867,32967,33067,33167,33267,33367,33467,33567,33667,33767,33867,33967,34067,34167,34267,34367,34467,34567,34667,34767,34867,34967,35067,35167,35267,35367,35467,35567,35667,35767,35867,35967,36067,36167,36267,36367,36467,36567,36667,36767,36867,36967,37067,37167,37267,37367,37468,37568,37668,37768,37868,37969,38069,38169,38269,38369,38469,38569,38669,38769,38869,38969,39069,39169,39270,39370,39470,39570,39670,39771,39871,39972]
xs = [-2.5850,-2.2310,-2.8440,-0.8330,-1.2730,-1.0820,-3.6870,-14.6530,-20.8780,-15.3230,-0.8810,-2.1930,-20.8780,-11.0320,4.2710,-13.8190,-20.8780,-20.8780,-5.5260,-19.4030,-20.8780,-20.8780,-20.5330,-20.8780,-20.8780,-20.8780,-20.8780,-20.8780,-0.0860,-0.9280,-20.8780,-4.8550,1.5320,-20.8780,-20.8780,-20.8780,-4.1940,-8.3510,-20.8780,-20.8780,-11.6740,-20.8780,-10.4190,-18.5120,-20.8780,-3.0070,-6.8090,-20.0540,-20.8780,-11.2530,-0.6790,-20.8780,-20.8780,-5.9090,-6.2150,-20.8780,-20.6380,-7.5650,-1.6850,-20.8780,-20.8780,-13.7330,-7.3070,-19.7760,-20.8780,-6.0430,-5.2960,-20.8780,-6.8180,-2.8820,-10.1420,-20.8780,-20.8780,-2.9680,-2.6430,-19.2110,-20.8780,-8.3320,3.1600,-20.8780,-17.2380,-5.1810,-2.3650,-20.8780,-20.8780,-3.7440,-8.9640,-20.8780,-20.8780,-2.7860,1.9050,-17.9660,-17.5640,-3.2750,-3.1700,-20.8780,-20.8780,-8.1400,4.7110,-0.1620,-20.8780,-0.9670,-3.4760,-3.4570,-20.8780,-20.8780,-3.6200,1.5410,-4.2420,-20.8780,1.5320,-4.6440,-9.0980,-20.8780,-20.8780,6.4450,-1.9340,-11.7510,-9.9790,-4.1660,-2.2980,-7.0290,-19.9010,-3.2840,0.3830,-0.7560,-19.5370,6.3110,-4.5970,-2.7000,-8.5610,-7.5370,-3.9640,0.2100,3.2270,-20.1790,0.1340,-2.4610,-3.1410,-16.6540,-13.2060,-3.9450,7.9290,-6.5890,-20.8780,-2.9490,-6.0520,-2.2410,-13.6470,-10.4000,-8.2070,1.6280,2.5760,-20.8780,-5.8610,-1.9530,-2.0010,-12.7950,-20.4180,-6.5310,3.6480,-1.9250,-20.8780,-11.0320,-2.1260,-2.4900,-10.5440,-17.7650,-1.9150,3.4950,-0.7660,-20.8780,-6.2250,-5.8510,-4.5100,-16.4150,-12.1620,-0.0380,3.8020,-1.9630,-15.8020,-3.9740,-4.9130,-10.6590,-20.8780,-7.5560,0.3160,2.7190,-0.2870,-15.9070,-4.0790,-3.7820,-4.2420,-20.8780,-4.7310,0.4690,-2.6140,-1.7710,-16.0320,-2.7000,-3.0930,-8.0060,-20.8780,-13.5990,-0.8900,2.4610,-8.0350,-17.1230,-3.8400,-0.6030,-9.6720,-20.8780,-3.8110,-0.7560,-2.0590,-20.8780,-7.1540,-3.0830,-10.6300,-20.8780,-8.6190,2.2120,2.7960,-20.8780,0.8140,-5.3630,-4.7590,-20.8780,-19.1250,2.9490,-0.5450,-14.1070,-12.9000,0.7660,-2.3840,-14.0680,-20.8780,-12.7750,-1.9530,-10.5630,-20.8780,-5.7270,-5.0280,-11.1090,-20.8780,-2.4990,1.1870,-1.9630,-20.8780,-6.7990,-5.5830,-19.1730,-20.8780,-4.1750,5.5540,4.8550,-20.8490,-5.6500,-6.9910,-12.3440,-20.8780,-10.6210,2.4800,-8.8970,-20.8780,5.2090,-6.7230,-14.9690,-20.8780,-1.4740,0.8140,-6.9140,-12.8520,-0.6320,-13.7710,-20.8780,-13.9250,1.6560,-4.4530,-6.4930,-7.5460,-1.0720,-15.1220,-20.4080,-5.8220,1.4360,-2.1160,-16.0410,1.0630,-1.1490,-4.1080,-20.8780,-15.2940,1.5320,-3.4190,-4.6440,-2.2120,-4.4430,-5.1710,-20.8780,-4.8650,-0.9380,1.5990,-20.8780,-16.7500,-6.1100,-6.3490,-8.9160,-8.7910,1.2540,3.2270,-18.3110,-4.2800,-5.3630,-3.1700,-20.8780,-9.6150,0.6030,-0.5550,-14.5570,-3.0930,-3.2080,-4.8930,-15.4670,-9.1840,-4.8650,-7.8910,-3.1410,-2.7190,-3.9070,-7.0000,-5.4300,-15.7920,-7.5460,-5.7170,-1.5700,-18.8470,-8.5230,-12.8710,-10.8120,-20.8590,-6.3110,-8.5520,-6.6560,8.6860,-7.0480,-11.6260,-16.6350,-20.2260,-8.6670,-2.3170,-1.3790,-16.9890,-9.4230,-9.8640,-12.1430,-15.7830,-6.2530,-3.2750,-3.1700,-10.3810,-0.8710,-16.7500,-20.8780,-13.9250,-2.8250,-6.5310,-3.3520,-15.2850,-9.0980,-9.7300,-20.8780,-4.9320,-3.2170,-2.9970,1.5610,-8.3120,-15.6770,-20.8780,-16.2140,-2.9590,-5.1140,13.3600,-13.8000,-20.8780,-14.8060,-20.8780,-10.3240,-10.2370,-7.4980,-6.7710,0.8710,1.6950,-0.0670,-1.0910,0.4690,-0.8330,-0.9760,-1.7430]
ys = [5.6980,5.7550,6.2820,5.9280,5.2290,4.6350,3.4090,-6.6840,-8.6760,12.6600,18.5030,11.6640,11.4730,-19.8240,-19.8240,-19.8240,-14.6430,10.9560,15.0360,3.6870,11.2140,-19.8150,-19.8240,-19.8240,19.3930,13.2450,-2.9490,-15.8590,-17.1900,-17.6310,10.8980,15.8500,19.3930,16.5870,-2.0590,-9.2320,-17.1710,-9.8260,11.6930,4.2420,2.1640,9.1650,9.2700,6.9050,11.7990,-2.2880,-18.6850,-14.0870,6.9330,14.6430,19.3930,4.2520,16.5300,-16.9130,-17.1520,-18.5980,14.1070,14.2890,-0.7470,19.3930,8.3120,-19.3360,-14.2310,-12.7280,13.1490,15.6390,5.8700,19.3930,-9.9020,-12.1720,-19.8240,13.8000,19.3930,6.8760,6.2730,19.3930,6.7990,-19.8240,-19.8240,-18.9720,17.4200,17.0090,14.6620,19.3930,7.9490,-17.1140,-19.8050,-14.7000,16.6160,9.5000,8.6380,10.8980,1.7900,-12.5650,-14.4230,-5.1140,6.9430,11.3010,10.5250,7.7280,19.3930,-4.7210,-11.0900,-11.2140,13.4360,19.3930,10.1990,2.5950,6.2820,19.0680,-5.1140,-8.7050,-11.6840,19.3930,19.3930,5.2380,5.4010,19.3840,5.2190,-6.9720,-8.3120,-5.1420,19.3930,11.2050,0.5260,5.6310,19.3930,-2.1540,-5.5450,-6.0430,8.4850,17.0090,8.4940,-1.8190,6.9910,19.3930,1.8380,-6.4160,-6.0910,-1.4360,18.1100,10.6780,3.1790,14.5380,19.3930,-2.5470,-8.0730,-7.1060,3.3520,19.3930,11.9040,1.1970,5.6210,19.3930,-1.9920,-9.4140,-9.2510,-4.1560,19.3360,10.2660,3.2370,4.7980,15.4090,-1.1770,-5.6980,-6.7420,-7.7280,19.3930,5.6600,5.2190,7.2210,18.6560,-1.5890,-12.0000,-10.4290,-4.3280,19.3930,5.0950,2.7100,9.8070,9.6630,-4.3280,-9.7870,-5.6310,15.1220,15.7350,4.6920,2.7100,16.9510,6.5220,-6.7710,-7.8140,-4.2800,19.3930,9.5480,-1.2730,8.9920,19.3930,10.5150,-5.1710,-6.8850,-8.4370,19.3930,16.5300,4.9890,3.9740,18.4070,8.9350,-9.2220,-9.9500,-10.8980,17.8230,11.1380,10.1230,8.1880,7.9960,-8.0160,-9.2700,-10.0750,9.8450,13.5510,7.6420,6.1190,19.3930,-6.7510,-13.2640,-8.1500,19.3930,13.4080,7.1340,13.6570,19.3930,-2.3460,-11.1760,-10.4670,-9.0310,16.5300,12.6320,11.0420,16.4150,19.3930,-8.0630,-15.7440,-10.2370,19.3930,10.6780,7.0870,8.8010,18.2060,-0.4020,-9.8640,-4.8550,19.3930,10.7450,6.6360,4.1560,19.3930,-6.2150,-12.9190,-12.6990,19.3930,17.5830,7.9200,15.7540,19.3930,-8.8200,-13.2160,-7.9870,19.3930,12.4980,9.4430,18.6560,1.6660,-7.7760,-12.2870,19.3930,19.3930,9.3660,8.1980,19.3930,4.3950,-11.7700,-4.6440,12.0380,13.8480,9.1940,5.4580,19.3930,-3.8690,-7.9580,-6.2340,19.3930,18.2340,8.0730,5.3440,19.3930,1.2830,-10.5250,-7.7570,19.3840,10.1700,5.4300,2.5470,19.3930,9.3560,-9.9410,-5.0080,10.4770,14.3360,6.4540,5.4680,19.3930,2.1740,-4.8360,-6.2250,19.3930,18.0520,5.7070,5.4970,19.3930,4.1660,-4.7780,-2.7390,17.8130,14.7100,8.7820,4.2710,5.4680,7.9490,2.7290,4.9510,3.3710,18.9050,7.1730,2.9970,-0.1240,9.4520,3.5140,3.9740,0.7080,11.5110,9.9310,2.8060,-0.4980,10.6970,-3.1980,-0.8710,6.0620,10.1230,9.6150,7.2110,4.5290,4.8740,-3.8300,2.8530,2.1350,11.0320,6.6080,4.7980,17.6310,-7.2400,-17.6410,-0.4210,17.4010,15.6870,11.8270,-0.5840,0.7370,-1.0340,7.4310,5.6880,14.5570,9.1550,5.2860,5.5640,-2.5090,-7.3930,4.7500,16.1850,13.6570,3.7540,-1.5990,-2.2410,-2.1450,5.1710,7.6610,15.8980,8.3410,4.5870,-2.7190,0.1240,2.0870,4.5390,3.8110,3.9930,4.8650,5.4200,4.6830,2.4130]
zs = [8.9350,8.4370,7.5270,6.8760,6.9240,6.3780,5.6690,-4.1940,5.8700,0.3730,-3.6390,3.7440,18.8760,-4.2230,-8.0350,4.1180,19.9300,-18.9620,5.6880,13.9150,19.7860,-3.5140,5.4490,19.9300,-9.2800,-0.1050,15.9550,-0.6220,-3.0160,-7.3740,16.0510,19.9300,-2.9880,12.9380,2.7670,-0.5650,-6.0710,1.8100,12.2870,11.6170,-2.9300,3.6390,6.6840,-1.8860,10.0080,13.9920,-5.8700,-3.1980,19.9300,3.6290,7.4600,7.6320,10.6970,-3.6870,-7.1440,-7.3550,4.4240,4.8360,3.2840,19.9300,13.7710,0.0000,3.2370,-14.7290,-0.4300,12.4500,3.8020,13.8380,19.9300,-0.5260,-2.9400,19.9200,18.6170,-0.1140,1.0820,4.6830,19.4600,1.1300,-9.2410,19.9300,7.3160,8.1980,7.4700,19.9300,8.0250,-7.6040,0.8420,-2.2120,2.4700,3.3230,5.3340,12.3440,12.1530,-0.9380,-2.6810,16.8550,19.9300,9.1070,2.4030,5.1330,19.9200,13.2830,-4.9890,-0.3250,19.9300,19.8340,1.4460,3.8300,8.4850,10.5630,-1.1770,-1.4840,-4.6830,19.7090,10.9460,3.0640,-1.0240,16.1470,10.0560,-5.6310,-9.3950,-1.8190,0.2390,1.0630,1.7140,0.1050,19.9300,6.9330,-4.0890,2.1830,-2.7390,9.6150,8.6380,1.3690,0.3060,19.9300,4.5200,-3.5050,-0.2010,-3.8590,5.6210,5.1420,1.3590,5.2290,17.0370,5.6400,-3.2650,-3.9840,9.1170,11.0420,-2.9010,-0.2010,0.0760,19.9300,2.0780,-4.5770,-1.6950,-2.5950,11.1950,8.1400,3.5620,-0.4400,8.3510,7.9770,-3.8500,-1.9920,-5.7940,17.4390,5.1520,8.3990,-3.3990,14.0680,17.0850,-4.0220,-2.8250,-2.2690,10.6210,1.2830,1.9050,3.5050,13.1110,3.4380,-2.8250,-1.0530,12.4500,5.7170,2.1740,2.3170,11.7510,-2.4700,0.3540,-5.9560,-6.4640,2.9010,2.8250,4.0990,6.9910,3.1600,19.9300,-7.9100,-3.5530,-5.3440,3.6390,4.0410,1.6080,3.8400,5.7650,9.5380,1.0340,-1.1870,-8.4080,8.6760,3.4090,4.5200,3.5330,8.5520,9.5960,-2.1160,-4.5870,19.9300,5.7070,2.3650,-1.3590,19.9100,19.9300,-3.3040,-3.1020,10.1030,-6.2150,-0.0860,10.6490,19.9300,12.3060,-5.0280,-1.7040,-5.0370,9.8930,0.7180,0.3730,11.0420,19.9300,9.8930,-5.6210,-7.4890,19.8150,7.4790,3.3610,0.5840,19.8150,7.6040,-7.4790,-2.8250,19.5460,8.8390,9.5190,8.3800,19.9300,6.4070,-5.9090,-3.4380,19.9300,1.9050,2.5760,4.5490,19.9300,15.5620,-7.6610,-2.6910,17.2290,3.6290,3.6580,10.4190,1.8000,6.4740,0.2290,19.9300,18.6460,3.4470,0.2960,9.8640,0.2580,-6.0330,1.9630,19.9300,10.1800,5.3530,4.5970,19.1830,10.3620,-5.4300,-2.3270,11.6930,11.7120,5.8990,2.1930,11.4060,6.6840,-5.5060,-5.4110,12.1910,6.2150,1.2920,1.1390,19.9300,11.0710,1.4740,-1.4260,5.8130,1.9150,-0.2290,3.8970,19.9200,9.5190,-2.0780,-4.3860,11.0900,6.3970,3.9360,-0.0090,17.5830,12.7850,-3.0930,-2.5570,2.4800,3.9930,1.3690,0.4780,1.4650,3.4660,-2.0300,-2.2790,9.3660,11.4440,3.8020,1.3980,0.0570,8.8390,3.2840,1.5700,3.7250,19.8050,15.2080,-1.8570,2.1060,3.7060,2.1540,-0.2390,-4.0410,11.0610,7.5080,1.8380,2.6620,12.1530,4.7980,-1.9630,-1.5030,4.9700,-1.3400,-0.3060,4.0030,-1.0430,-4.7690,7.5270,14.9780,5.6020,2.1930,1.9530,-3.3420,11.3200,2.4230,-5.3530,13.3400,2.5370,1.0530,1.0430,1.7520,3.1220,3.6870,14.1450,9.6530,-0.2100,1.9630,-8.3410,1.1580,11.5110,-0.1340,9.4520,11.8080,10.6210,3.2270,13.0150,15.6390,9.7300,7.4220,6.6750,9.2700,10.0650,6.8570,9.3660]