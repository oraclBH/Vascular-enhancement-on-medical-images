function outIM = VascularEnhance(inIM)

inIM = double(inIM);

r = inIM(:,:,1);
g = inIM(:,:,2);
b = inIM(:,:,3);

h = fspecial('average', [5,5]);
rf = imfilter(r, h, 'replicate');
red  = rf - r;

t = 0.5;
red(red<t) = 0;
red(red>=t) = 1./ (1 + exp(-5*(red(red>=t)-t)))+ sqrt((10*(red(red>=t)-t)));

hs = fspecial('average', [5,5]);
red =  imfilter(red, hs, 'replicate');
red=medfilt2(red,[3, 3]);


r = r   ;
g = g - red *5;
b = b - red* 5;
outIM = cat(3, r, g, b);

end
