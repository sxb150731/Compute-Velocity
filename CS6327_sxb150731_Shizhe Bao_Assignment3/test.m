intr_mat = [1027 0 0 ;
            3.4052 1029.9 0 ;
            968 536.54 1 ];
        
inv_intr = [0.0027289 0 -0 ;
    -7.1662e-06 0.0027186 -0 ;
    -0.71173 -0.56546 1];
trans_matrix = [0.99998 -0.0062464 0.0013162 0;
    0.0062361 0.99997 0.0046386 0 ;
    -0.0013491 -0.0046356 0.99999 0 
    50.775 11.994 -80.412 1
];

small_1 = [448 356 1];
small_2 = [64 361 1];
big_1 = [88 310 1];
big_2 = [410 302 1];

matrix_small = big_2 * inv_intr;
%matrix_small_2 = [matrix_small 1] * trans_matrix;
%matrix_small_3 = matrix_small_2(3);
%matrix_small_2 = matrix_small_2/matrix_small_3;        
%matrix_small_5 = matrix_small_2(1,1:3) * intr_mat;