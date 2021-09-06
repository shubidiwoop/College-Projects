i=imread('input-image.tif');
i=rgb2gray(i);
figure,imshow(i);
b=10;w=240;  
img_with_noise= i; 
[m,n]=size(i); 
x = randint(m,n,[0,255]);  
img_with_noise(x <= b) = 0; %scaling 

img_with_noise(x >=w) = 255;  

figure,imshow(img_with_noise);

filtered_image=zeros(m,n);

for i=2:m-1
    
   for j=2:n-1
       flt=[img_with_noise(i-1,j-1),img_with_noise(i-1,j),img_with_noise(i-1,j+1),img_with_noise(i,j-1),img_with_noise(i,j),img_with_noise(i,j+1),img_with_noise(i+1,j-1),img_with_noise(i+1,j),img_with_noise(i+1,j+1)];
       filtered_image(i,j)=median(flt);
   end
end
figure,imshow(filtered_image,[]);