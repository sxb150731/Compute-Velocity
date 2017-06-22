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
      
i1=imread('depth_92331d.png');
j1 = imread('color_92331.png');
depth_img1 = i1;
sim_img = zeros(424,513,3);
org_img_1 = j1;
depth_real1 = zeros(1,3);
real1 = zeros(1,3);
rgb_coord1 = zeros(1,4);
final_op1 = zeros(size(j1));
inter1 = zeros(1,3);
org_img1 = zeros(424,513,3);
for p = 1:size(i1,1)
    for q =1:size(i1,2)
        depth1 = depth_img1(p,q);
        depth_real1 = [q,p,1] * inv_intr;
            if depth1 > 0
                real1 = depth_real1 .* double(depth1);
                rgb_coord1 = [real1, 1] * trans_matrix;
                rgb_depth1 = rgb_coord1(3);
                rgb_coord1 = rgb_coord1/rgb_depth1;        
                inter1 = rgb_coord1(1,1:3) * intr_mat;

                if round(inter1(1,2)) > 0 && round(inter1(1,2)) < size(j1,1) && round(inter1(1,1)) > 0 && round(inter1(1,1)) < size(j1,2)  
        
                  sim_img(p,q,1) = org_img_1(round(inter1(1,2)),round(inter1(1,1)),1);
                  sim_img(p,q,2) = org_img_1(round(inter1(1,2)),round(inter1(1,1)),2);
                  sim_img(p,q,3) = org_img_1(round(inter1(1,2)),round(inter1(1,1)),3);
                end
           end
    end
end
    new_org1 = sim_img/255;
      figure,imshow(new_org1);  
hold on
a=0:0.1:2*pi;
b = 87 + 37*sin(a);%small ball
c = 310 + 37*cos(a);
plot(b,c,'r');

e = 448 + 25*sin(a);
f = 356 + 25 *cos(a);%bigball
plot(e,f,'r');
hold off
 
                
i2=imread('depth_94764d.png');
j2 = imread('color_94764.png');
depth_img2 = i2;
sim_img2 = zeros(424,513,3);
org_img_2 = j2;
depth_real2 = zeros(1,3);
real2 = zeros(1,3);
rgb_coord2 = zeros(1,4);
final_op2 = zeros(size(j1));
inter2 = zeros(1,3);
org_img2 = zeros(424,513,3);
for p = 1:size(i2,1)
    for q =1:size(i2,2)
        depth2 = depth_img2(p,q);
        depth_real2 = [q,p,1] * inv_intr;
            if depth2 > 0
                real2 = depth_real2 .* double(depth2);
                rgb_coord2 = [real2, 1] * trans_matrix;
                rgb_depth2 = rgb_coord2(3);
                rgb_coord2 = rgb_coord2/rgb_depth2;        
                inter2 = rgb_coord2(1,1:3) * intr_mat;

                  if round(inter2(1,2)) > 0 && round(inter2(1,2)) < size(j2,1) && round(inter2(1,1)) > 0 && round(inter2(1,1)) < size(j2,2)  
        
                    sim_img2(p,q,1) = org_img_2(round(inter2(1,2)),round(inter2(1,1)),1);
                    sim_img2(p,q,2) = org_img_2(round(inter2(1,2)),round(inter2(1,1)),2);
                    sim_img2(p,q,3) = org_img_2(round(inter2(1,2)),round(inter2(1,1)),3);
                  end
             end
    end
end
    new_org2 = sim_img2/255;
    figure,imshow(new_org2);
hold on
t=0:0.1:2*pi;
x = 63 + 25*sin(t);%small ball
y = 365 + 25*cos(t);
plot(x,y,'r');

q = 408 + 37*sin(t);
r = 300 + 37*cos(t);
plot(q,r,'r');%big ball
hold off

% calculating depth values for correspoding pixel values
depth_small1 = depth_img1(356,448);
depth_big1 = depth_img1(310,88);
depth_small2 = depth_img2(361,64);
depth_big2 = depth_img2(302,410);
distance_small= norm(double( [448,356,depth_small1] - [64,361,depth_small2]));
distance_big = norm(double( [410,302,depth_big2] - [88,310,depth_big1]));
velocity_big = distance_big/2.433;
velocity_small = distance_small/2.433;
rv =  velocity_small + velocity_big;