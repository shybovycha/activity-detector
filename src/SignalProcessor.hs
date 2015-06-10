module SignalProcessor where

ukraine = [-2.9, -1.9, 2.7, 9.6, 15.1, 18.8, 21.2, 20.4, 15.0, 9.2, 3, -2.1]
poland = [-1.3, 0.2, 3.3, 8.2, 13.3, 16.1, 18.5, 18.1, 13.3, 8.6, 3.4, -0.5]
syberia = [-39.34, -36.61, -29.46, -22.81, -10.19, 2.71, 10.2, 7.1, -1.7, -15.84, -29.15, -34.33]
croatia = [1.0150000000000001,2.775,6.065,8.595,14.735000000000003,17.240000000000002,19.795,20.135,14.570000000000002,11.28,6.609999999999999,0.51]
italy = [4.255000000000001,5.029999999999999,7.6350000000000025,9.659999999999998,15.425,18.9,21.269999999999996,21.995,16.93,14.175000000000002,8.96,4.52]
tyrhenian = [7.574999999999998,7.380000000000001,9.239999999999998,10.400000000000002,14.665000000000001,19.025000000000002,21.814999999999998,22.820000000000004,18.35,15.529999999999998,11.154999999999998,8.190000000000001]

correlation f g = nom / denom
    where
        nom = foldl (\acc (f_i, g_i) -> acc + (f_i * g_i)) 0 (zip f g)
        denom = (sqrt sum_sqr_f) * (sqrt sum_sqr_g)
        sum_sqr = foldl (\acc e -> acc + (e * e)) 0
        sum_sqr_f = sum_sqr f
        sum_sqr_g = sum_sqr g

cycle_list l n = (drop n l) ++ (take n l)

max_similarity f g = maximum $ map (\i -> correlation g (cycle_list f i)) [1..length f]

autocorrelation :: [Double] -> (Int, Int) -> [Double]
autocorrelation f (t_min, t_max) = map rff_j [t_min..t_max]
    where
        rff_j = (\j -> (foldr (\i acc -> acc + ((f !! i) * (f !! (i + j)))) 0 [0..n-1-j]) / (fromIntegral n))
        n = length f