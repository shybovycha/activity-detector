(def running
    {
        :xs '(1040 976 888 792 688 600 504 424 336 288 200 160 104 64 32 8 -8 -16 -32 -40 -104 -88 -72 -72 -56 -72 -64 -40 -16 8 24 80 152 192 240 304 352 456 568 712 872 1024 1136 1328 1552 1920 2520 3168 3440 3272 2928 2568 2192 1824 1496 1184 936 680 488 288 120 -32 -168 -280 -368 -448 -488 -512 -568 -592 -608 -592 -576 -528 -512 -496 -464 -464 -472 -464 -488 -512 -520 -544 -552 -568 -568 -592 -592 -616 -472 -168 296 1192 2624 3352 3560 3056 2480 2096 1816 1568 1352 1144 960 800 656 544 480 416 408 448 488 520 576 592 616 648 616 592 512 432 384 328 328 344 320 360 368 440 520 672 904 1320 1856 2160 2640 3360 3480 2936 2312 1696 1184 760 392 64 -168 -264 -312 -312 640 560 488 560 888 1536 1864 2264 2976 3032 2768 2184 1496 920 408 -32 -352 -464 -448 -376 -328 -320 -328 -352 -392 -408 -384 -360 -296 -264 -232 -248 -264 -288 -296 -336 -344 -384 -424 -456 -480 -504 -504 -496 -488 -504 -560 -680 -744 -728 -472 -96 408 1664 2872 3440 3016 2424 1832 1352 936 648 536 528 528 480 368 264 208 160 168 192 216 224 232 256 272 328 376 424 464 464 464 440 408 408 416 432 424 432 464 496 552 696 936 1320 1904 2704 3392 3736 3296 2424 1616 1016 520 88 -216 -304 -288 -192 -192 -216 -280 -352 -336 -304 -280 -272 -256 -288 -280 -296 -320 -328 -360 -400 -464 -544 -568 -608 -624 -600 -608 -608 -632 -680 -744 -776 -736 -584 -280 248 1216 2352 3024 2952 2544 2024 1600 1336 1224 1120 1056 928 768 600 488 480 488 488 480 464 440 448 456 488 544 608 624 624 632 600 552 520 520 536 568 648 704 760 760 744 792 944 1288 1744 2400 3240 3664 3456 2752 2088 1560 1128 728 384 120 -32 -96 -144 -184 -192 -192 -200 -224 -272 -304 -328 -336 -336 -360 -360 -360 -368 -360 -400 -440 -488 -488 -528 -600 -624 -632 -648 -648 -672 -704 -768 -832 -712 -416 152 1064 2552 3320 3512 3128 2560 2080 1752 1608 1496 1392 1176 992 800 640 536 520 512 512 520 528 504 504 528 568 608 640 648 640 632 624 600 568 568 576 592 632 640 656 672 704 720 776 968 1288 1712 2608 3344 3712 3192 2488 1880 1384 944 552 224 -56 -200 -216 -256 -288 -320 -352 -352 -376 -400 -400 -408 -408 -384 -384 -408 -432 -464 -480 -536 -568 -576 -592 -608 -624 -640 -632 -616 -608 -576 -568 -576 -608 -600 -520 -264 320 1472 2600 3128 3144 2840 2392 2032 1768 1632 1496 1328 1088 784 568 432 368 344 384 368 344 304 280 296 328 392 464 480 528 520 512 528 504 496 496 496 520 552 592 616 632 640 608 656 856 1200 1680 2536 3312 3696 3368 2688 2016 1504 1112 776 432 176 16 -112 -128 -176 -200 -256 -304 -360 -416 -464 -488 -504 -504 -504 -496 -504 -528 -520 -568 -576 -592 -584 -632 -632 -608 -568 -536 -512 -488 -528 -560 -392 8 744 1984 3032 3560 3392 2912 2424 2088 1824 1640 1504 1304 1168 976 768 584 432 344 280 288 288 280 280 296 320 328 376 440 480 504 568 568 552 552 560 584 584 608 616 632 616 568 624 792 1096 1664 2512 3296 3688 3528 2656 1848 1232 752 312 -64 -328 -440 -472 -496 -528 -592 -600 -576 -568 -552 -536 -520 -496 -504 -480 -472 -464 -456 -472 -488 -520 -512 -496 -504 -496 -512 -544 -528 -496 -480 -472 -440 -296 48 688 1760 2816 3240 3160 2824 2400 2080 1864 1696 1528 1304 1056 800 544 400 320 304 296 304 -640 -624 -616 -584 -536 -480 -448 -384 -208 88 456 1120 1960 2504 2544 2320 1920 1552 1312 1160 1064 928 760 584 408 328 280 296 328 352 368 368 400 440 488 528 560 544 520 488 448 416 400 384 368 384 416 432 416 376 392 520 792 1104 1368 1736 2744 3352 3024 2296 1584 976 520 160 -72 -200 -256 -264 -288 -344 -384 -376 -376 -368 -376 -352 -320 -304 -272 -240 -224 -224 -240 -264 -288 -304 -328 -360 -408 -432 -488 -536 -584 -640 -688 -768 -816 -792 -632 -264 144 1032 2560 3320 3552 3096 2336 1600 1064 784 744 792 824 712 536 352 232 208 240 296 336 392 440 480 512 544 528 536 464 400 344 312 296 264 304 328 352 384 384 360 376 464 704 1048 1488 2064 3056 3568 3704 3040 2248 1632 1152 704 248 -128 -304 -320 -296 -288 -296 -344 -384 -400 -416 -424 -384 -344 -320 -264 -256 -264 -272 -296 -320 -336 -368 -360 -400 -440 -456 -480 -496 -512 -520 -568 -632 -624 -440 -16 584 1744 2912 3456 3224 2640 1984 1472 1168 1048 1032 1032 960 808 640 504 416 384 424 464 496 552 608 640 664 680 648 592 504 456 416 368 304 312 280 272 248 296 320 352 352 312 312 480 832 1280 1872 2976 3528 3808 3216 2376 1696 1192 720 352 -24 -288 -392 -384 -400 -408 -432 -504 -512 -488 -408 -368 -312 -264 -264 -264 -256 -248 -248 -256 -280 -328 -344 -352 -384 -392 -432 -472 -488 -528 -528 -584 -656 -792 -808 -560 -24 672 2080 3080 3584 3208 2328 1576 1104 960 896 880 784 672 472 272 120 56 96 176 248 272 288 304 336 352 384 424 408 352 280 208 176 208 248 264 256 280 312 336 336 368 416 440 400 376 536 952 1544 2288 3184 3632 3856 3464 2736 2064 1552 1096 592 176 -64 -80 -40 -40 -48 -64 -56 -80 -112 -136 -168 -168 -176 -144 -152 -152 -160 -184 -184 -224 -232 -272 -280 -320 -344 -352 -376 -392 -408 -384 -344 -352 -352 -376 -400 -400 -272 64 808 1920 3000 3176 2784 2128 1496 1032 760 640 600 536 440 328 200 144 176 208 272 320 320 328 352 392 384 392 368 336 296 272 224 200 192 160 128 152 144 160 192 224 216 216 232 320 552 912 1424 2104 3088 3584 3832 3880 3144 2312 1680 1192 712 216 -120 -328 -384 -376 -424 -440 -488 -544 -544 -504 -496 -504 -472 -480 -496 -536 -616 -632 -648 -640 -616 -568 -528 -488 -472 -464 -480 -456 -448 -352 -288 -72 288 864 1672 2488 2776 2704 2432 2072 1760 1584 1432 1280 1064 816 520 304 144 32 -8 -40 -32 -8 8 56 120 200 320 352 360 312 240 200 176 136 136 120 88 120 160 208 240 312 344 384 464 640 904 1280 1712 2352 3216 3648 3864 3408 2680 2056 1528 1056 600 144 -152 -304 -320 -312 -328 -376 -424 -472 -496 -488 -440 -392 -360 -328 -304 -304 -288 -272 -264 -272 824 808 784 768 744 704 680 656 624 584 560 608 640 584 552 536 560 568 560 456 312 360 472 576 632 624 624 568 544 560 600 600 592 600 632 616 600 600 560 576 576 552 504 488 480 472 464 488 464 448)
        :ys '(1232 1192 1104 1016 904 856 848 776 704 624 600 592 608 592 568 504 472 440 408 376 344 304 248 208 160 128 88 144 120 104 64 56 72 104 136 144 112 80 24 -16 -56 -40 88 320 688 1224 1912 2600 3128 3376 3384 3184 2912 2632 2368 2112 1904 1800 1680 1552 1376 1184 992 848 752 632 552 488 432 392 336 288 216 200 144 88 48 16 -32 -48 -32 -48 -48 -48 -48 -8 64 240 624 1336 2176 3128 3600 3840 3960 4016 4048 3472 2944 2496 2024 1520 1048 664 360 168 80 16 24 32 -32 -120 -232 -328 -432 -544 -640 -704 -752 -840 -864 -896 -896 -896 -848 -808 -744 -624 -520 -368 -224 -120 144 728 1624 2584 3328 3704 3888 3984 3632 3120 2832 2680 2480 2184 1824 1448 1128 848 -224 -128 -48 136 816 2040 3056 3568 3824 3952 4016 4048 4064 3656 3064 2416 1912 1560 1248 992 760 584 440 312 208 176 120 80 32 32 0 32 -24 -48 -88 -128 -120 -120 -104 -56 -56 -48 -32 -48 -48 -56 -40 80 464 1320 2608 3344 3712 3896 3984 4032 3960 3488 2952 2352 1744 1248 952 720 448 208 96 64 48 72 24 -16 -48 -56 -72 -112 -104 -72 -112 -136 -176 -216 -248 -296 -328 -432 -576 -776 -912 -944 -840 -600 -248 0 232 872 2040 3064 3568 3824 3952 4016 3896 3448 2976 2544 2192 1840 1488 1176 848 560 384 256 136 48 -32 -32 -40 -72 -88 -112 -128 -144 -144 -144 -128 -128 -136 -144 -152 -128 -88 -64 -40 -24 40 312 888 1800 2944 3512 3792 3936 4008 4040 3864 3456 2896 2328 1808 1368 1008 712 496 376 336 304 208 80 -40 -160 -240 -264 -280 -296 -328 -368 -448 -560 -640 -752 -800 -800 -792 -776 -792 -760 -744 -712 -640 -528 -328 -56 504 1400 2680 3376 3728 3904 3992 4032 3952 3528 3000 2536 2176 1888 1640 1408 1192 984 752 576 408 304 256 184 120 48 -32 -88 -88 -64 -32 -16 -8 8 8 -8 -40 -96 -104 -96 -80 -64 -72 16 432 1248 2488 3288 3680 3880 3976 4032 3992 3576 2912 2248 1688 1240 928 720 576 504 480 456 392 264 120 -16 -120 -168 -256 -304 -352 -400 -456 -568 -656 -704 -752 -784 -784 -744 -696 -656 -648 -616 -544 -472 -384 -320 -240 -8 640 1856 2968 3520 3800 3936 4008 4040 3792 3304 2792 2320 1896 1568 1328 1096 880 688 504 368 264 160 112 120 160 176 144 120 72 40 -8 -16 0 8 0 -16 0 16 16 24 56 72 112 256 632 1376 2600 3336 3712 3896 3984 4032 4056 3808 3248 2632 2056 1504 984 568 320 208 208 192 152 96 8 -80 -168 -240 -320 -368 -408 -408 -400 -416 -424 -472 -520 -576 -616 -624 -632 -672 -712 -696 -648 -584 -520 -424 -320 -120 200 784 1904 2992 3536 3808 3944 4008 4040 3904 3464 2944 2496 2088 1776 1512 1272 1056 864 696 552 424 304 224 152 72 48 16 -24 -48 -40 -40 -64 -80 -88 -56 -64 -64 -88 -56 -32 24 128 392 1008 2112 3096 3584 3832 3952 4016 3968 3592 3048 2456 1984 1584 1216 904 632 432 320 224 208 176 112 40 -80 -144 -192 -224 -304 -336 -368 -408 -464 -488 -512 -552 -568 -592 -664 -776 -840 -856 -816 -736 -576 -360 -256 -88 520 1544 2808 3448 3760 3920 4000 4040 3864 3464 3032 2624 2168 1752 1424 1160 872 680 480 304 136 56 8 32 48 40 8 -48 -56 -56 -64 -72 -56 -32 0 48 88 120 120 136 176 272 576 1280 2608 3344 3712 3896 3984 4032 4056 3872 3416 2792 2176 1592 1104 768 512 376 248 192 120 40 -56 -120 -24 0 16 80 200 392 768 1424 2392 3232 3656 3864 3976 4024 4048 3752 3176 2552 1944 1448 1016 680 432 272 208 152 120 64 -24 -112 -184 -208 -280 -368 -432 -512 -560 -584 -576 -560 -536 -544 -552 -536 -544 -496 -480 -448 -376 -272 -72 296 784 1440 2224 3080 3576 3832 3952 4016 3760 3272 2792 2408 2056 1720 1416 1168 968 792 656 544 456 352 248 192 168 120 88 72 16 -16 -56 -96 -120 -128 -128 -104 -112 -112 -88 -80 -80 -64 -40 48 312 944 2064 3072 3576 3824 3952 4016 4024 3416 2832 2272 1696 1152 728 416 184 48 16 0 24 -24 -112 -224 -312 -400 -464 -536 -576 -592 -632 -632 -672 -720 -768 -792 -792 -752 -712 -688 -648 -576 -496 -360 -208 -40 304 904 1792 2816 3448 3760 3920 4000 3984 3512 2984 2512 2088 1744 1448 1192 1032 856 712 568 464 384 304 240 200 184 168 136 128 96 56 32 -8 -40 -32 -16 -8 -16 -16 -40 -32 -16 40 160 520 1240 2320 3200 3640 3856 3968 4024 3656 3128 2592 2032 1552 1184 904 712 512 376 280 200 136 72 8 -64 -128 -184 -224 -264 -336 -440 -536 -616 -664 -720 -728 -736 -728 -720 -712 -680 -640 -624 -592 -560 -456 -312 -136 192 744 1600 2832 3456 3768 3920 4000 4040 3536 2992 2584 2024 1600 1240 976 776 608 480 392 344 336 312 296 240 224 208 232 216 160 104 40 -8 -40 -104 -136 -152 -160 -168 -128 -120 -96 -48 -24 -24 32 296 976 2136 3104 3592 3832 3960 4016 3664 3408 3040 2480 1992 1576 1248 952 720 512 384 288 216 112 -24 -120 -240 -296 -328 -376 -416 -480 -536 -560 -552 -504 -408 -384 -376 -408 -456 -512 -560 -624 -672 -656 -640 -632 -592 -504 -352 -160 176 1008 2392 3240 3656 3864 3976 4024 3872 3376 2768 2328 1944 1656 1424 1264 1152 1064 960 784 616 448 320 216 144 96 24 -32 -96 -152 -184 -168 -160 -160 -176 -216 -280 -320 -328 -280 -232 -160 -136 -128 -128 -88 80 512 1384 2728 3400 3744 3912 3992 4032 3624 3184 2624 2080 1608 1232 960 768 584 464 360 296 192 80 -8 -96 -136 -184 -280 -328 -384 -440 -424 -440 -432 -440 -488 -520 -536 -504 -504 -504 -480 -432 -400 -408 -416 -432 -400 -328 -288 0 704 1800 2936 3504 3792 3936 4008 4040 3904 3440 2920 2392 1944 1560 1184 904 608 368 168 80 16 -72 -72 -136 -152 -208 -272 -320 -368 -384 -400 -352 -296 -208 -160 -120 -104 -64 -24 104 336 728 1344 2312 3192 3640 3856 3968 4024 4048 4032 3680 3160 2608 2056 1648 1200 816 544 384 256 152 48 -56 -160 -272 -368 -400 -400 -408 -440 -528 -616 -688 -688 -728 -736 -736 -720 -664 -608 -552 -544 -512 -488 -456 -368 -240 -136 -32 248 744 1568 2696 3392 3736 3904 3992 4032 3848 3400 2912 2408 1960 1608 1296 1016 800 648 528 432 344 272 200 144 96 48 24 8 -8 -16 -32 -72 -72 192 152 136 128 112 112 120 104 80 56 64 40 -8 -48 -88 -128 -152 -176 -168 -160 -208 -96 -40 -56 -88 -136 -152 -120 -96 -72 -72 -88 -96 -72 -96 -64 -40 -56 -72 -120 -112 -96 -96 -96 -72 -48 -48 -56 -32 -48)
        :zs '(-872 -712 -624 -552 -472 -416 -352 -256 -232 -184 -128 -104 -24 -40 8 56 96 88 136 160 200 248 288 248 288 320 344 312 352 320 288 256 240 232 128 80 0 -144 -280 -368 -488 -448 -416 -56 568 904 968 992 624 136 48 -16 48 40 32 56 176 184 216 224 176 136 88 96 80 72 24 -8 24 -8 -40 -40 -64 -96 -80 -88 -40 -72 -88 -48 -24 -32 -24 -16 -8 40 -16 -48 -48 -240 -104 184 952 1032 1544 1408 896 264 72 280 536 736 912 904 760 672 568 448 432 424 392 392 392 368 320 280 280 200 216 184 216 192 256 256 264 288 248 120 -56 -168 -184 -200 -376 -608 -112 1328 2528 1664 848 -104 -592 -576 -272 -48 32 88 216 280 248 264 -56 -48 -184 -272 -360 -48 1800 1152 -8 -200 -1064 -952 -648 -224 48 224 296 200 160 208 208 184 176 128 136 176 176 176 184 168 240 312 248 264 248 272 224 184 168 144 152 88 64 40 24 -40 -56 -80 -128 -184 -696 272 1832 456 560 -560 -528 -48 240 248 432 432 312 160 88 16 -56 -64 16 64 136 192 224 256 264 216 248 320 288 296 344 360 400 440 488 472 432 328 288 88 8 -24 -8 -80 -536 -696 312 768 280 -264 -760 -416 64 312 256 224 40 -48 96 112 160 144 152 264 208 224 248 304 312 384 320 296 304 256 304 312 304 320 200 120 48 16 32 64 0 -8 -72 -72 64 416 312 376 -392 -64 -400 -128 96 152 136 48 8 24 -8 56 40 136 184 304 352 312 336 296 264 240 216 208 224 248 288 240 328 304 344 304 312 304 296 264 240 128 24 -32 96 16 -8 632 872 -120 -104 -496 -296 64 152 152 32 -56 -104 -88 8 8 -48 96 32 112 128 136 216 288 280 208 176 176 176 232 136 192 200 216 224 272 248 224 216 160 112 88 -56 -80 -128 -88 -152 424 -24 8 -536 -456 -136 56 160 24 -40 -176 -176 -168 -40 8 184 224 304 352 336 352 400 392 312 328 360 336 392 432 344 416 392 352 384 416 408 416 360 288 232 120 -96 -160 -184 -112 312 1552 624 272 -424 -1008 -704 -360 16 144 24 -88 -168 -120 -96 40 64 184 168 120 128 120 80 176 248 304 376 408 392 368 360 344 312 248 168 152 152 80 136 32 -80 -112 -184 -248 -136 160 296 1160 56 40 -160 -224 -168 40 112 128 104 72 48 72 24 88 232 320 352 440 376 472 432 472 336 296 328 344 472 448 408 480 496 424 352 368 280 280 296 264 248 168 -48 -72 40 48 40 296 784 80 64 -328 -632 -368 -72 40 160 24 -144 -184 -112 -64 -48 40 96 176 184 208 248 304 352 352 312 256 240 232 184 120 80 112 88 16 16 56 56 16 -96 -112 -120 -96 80 -16 -56 8 -200 344 -184 -184 -72 80 144 104 56 104 0 72 88 192 208 256 280 288 336 272 296 304 280 208 264 272 272 296 352 408 536 544 552 616 576 496 320 240 120 128 128 184 80 -272 224 1488 272 80 -648 -560 -80 344 440 312 16 -136 -80 0 96 152 184 184 224 232 288 312 336 384 376 360 288 272 216 216 120 48 48 32 56 16 -32 -48 -96 -80 -136 32 272 232 72 -168 -528 -440 -312 -64 88 184 136 64 88 152 128 80 168 256 368 384 440 440 440 80 88 104 120 96 56 112 224 200 296 272 -24 96 -104 64 240 288 224 216 248 176 144 88 48 88 64 128 144 192 184 248 240 240 160 208 232 216 248 232 256 176 192 128 80 120 72 72 -88 -176 -192 -256 -304 -448 -144 616 712 -184 -288 -312 -232 -16 216 296 288 120 48 0 8 -24 -16 56 -32 48 56 80 48 112 112 136 168 152 136 104 80 32 0 -32 72 56 48 80 80 72 64 32 16 -48 -112 -600 -416 1808 1152 1352 104 72 264 360 408 496 488 360 280 224 72 48 24 40 184 232 272 288 320 280 280 296 288 320 312 304 304 296 296 248 248 176 184 136 64 -56 -144 -104 -128 -304 -272 232 816 1240 888 192 -312 -304 -112 168 272 176 40 80 104 128 64 72 88 40 24 0 24 -8 56 48 72 88 64 40 56 8 -8 -40 24 0 -8 8 -40 -8 -8 -32 -80 -96 -272 -384 -200 392 -72 480 -32 96 176 328 352 240 216 272 312 224 128 136 176 232 312 288 272 232 168 192 112 120 112 96 120 160 88 112 96 88 88 40 56 88 128 176 16 -80 -152 -176 -120 -168 64 936 968 688 32 -488 -352 -160 104 152 392 224 136 128 136 128 128 80 64 40 -24 -32 -16 -32 16 48 144 136 152 240 224 200 104 112 104 72 80 144 120 104 72 104 24 -8 -24 72 -128 464 1144 832 768 -64 -112 -80 136 216 368 216 152 -8 88 88 -24 88 144 184 224 200 200 224 240 200 112 64 64 80 136 120 232 208 280 256 248 296 264 280 328 408 384 280 112 -72 -168 -344 -616 -272 448 184 80 -1008 -1320 -976 -680 -232 176 184 -24 -96 -112 -120 -112 -48 24 72 144 184 192 224 248 192 256 272 296 256 272 240 264 320 312 344 304 256 216 200 232 128 48 -40 -72 -144 -184 -184 -32 -120 408 -480 -72 -280 -384 -168 -56 -48 16 56 32 -8 32 80 80 80 208 240 328 368 392 440 384 448 400 376 400 400 384 392 376 272 224 200 136 184 184 224 272 288 272 240 128 72 -120 -400 -720 -704 64 440 536 -408 -1216 -1072 -840 -528 -144 -24 -72 -160 -120 -176 0 48 24 48 208 224 304 392 440 448 528 504 488 504 448 368 280 280 248 208 144 136 80 16 24 -24 48 104 120 344 -24 -352 -352 -320 -64 160 176 192 48 -248 64 8 32 0 72 128 208 232 216 264 280 336 392 432 400 488 440 424 424 408 384 312 304 248 184 240 184 184 128 32 -56 -112 -184 -248 -304 -520 -368 200 872 1048 232 -568 -1088 -1048 -808 -360 56 192 216 160 160 216 152 112 136 88 88 80 88 96 120 128 208 208 224 224 240 216 224 -488 -464 -456 -472 -432 -464 -488 -536 -528 -544 -552 -488 -456 -536 -512 -576 -592 -648 -640 -664 -552 -744 -696 -696 -792 -800 -832 -848 -864 -904 -880 -952 -968 -904 -920 -920 -976 -968 -944 -880 -832 -784 -784 -720 -688 -696 -712 -816 -768 -704)
    })

(defn sign [x]
    (cond
        (< 0 x) -1
        (= 0 x) 0
        (> 0 x) 1))

(defn find-pattern [xs]
    (let [
        n (count xs)
        step 5
        indexes (range step n step)
        deltas (map (fn [i] (let [
                            prev-x (nth xs (- i step))
                            curr-x (nth xs i)
                            direction (- curr-x prev-x)
                            dx (sign direction)
                          ]
                          dx))
                          indexes)
        ]
        deltas))

; (find-pattern [1 2 3 4 5 2 1 -5 2 6 9 14])
(reduce (fn [acc e] (if (= e (last acc)) acc (conj acc e))) []
    (map vector
        (find-pattern (:xs running))
        (find-pattern (:ys running))
        (find-pattern (:zs running))))