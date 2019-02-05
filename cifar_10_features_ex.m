function f = cifar_10_features_ex(x)


img_r = x(1:1024);
m_r = mean(img_r); %MEAN OF RED CHANNEL

img_g = x(1025:2048);
m_g = mean(img_g); % MEAN OF GREEN CHANNEL

img_b = x(2049:3072);
m_b = mean(img_b);  % MEAN OF BLUE CHANNEL

f = [m_r,m_g,m_b];  % CREATING THE FEATURE SET BY COMBINING THE MEAN OF COLOR CHANNELS
end

