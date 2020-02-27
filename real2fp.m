
%%Converting input of base 10
format long g
prompt = 'Input Real: ';
x=input(prompt);

n_exponent=0;
x_1=x;

if abs(x)<1
    while abs(x_1)<1
        n_exponent=n_exponent-1;
        x_1=abs(x)/(2.^n_exponent);
    end
    
else
   while abs(x_1)>=2
        n_exponent=n_exponent+1;
        x_1=abs(x)/(2.^n_exponent);
    end
end
%Exponent to 8-bit binary (single precision 127)
exp_127=n_exponent+127;
bit8 = zeros(1,8);
for i=1:1:8
    bit8(i)=rem(exp_127,2);
    exp_127=fix(exp_127/2);
end
% Converting fraction to 23-bit mantissa (leading 1 hidden)
fraction=x_1-1;
bit23 = zeros(1, 23);
for i=23:-1:1
    fraction=fraction*2;
    bit23(i)=fix(fraction);
    fraction=rem(fraction,1);
end
sign=0;
if x<0
    sign=1;
end
if(x==0) 
    fprintf('Floating point 32bits: 0 | 00000000 | 00000000000000000000000\n');
else 
fprintf('Floating point 32bits:  ');
fprintf('%d', sign);
fprintf(' | ');
fprintf('%d', fliplr(bit8));
fprintf(' | ');
fprintf('%d', fliplr(bit23));
fprintf('\n');
end
