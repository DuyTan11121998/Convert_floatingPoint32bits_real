function fp2real
syms result;

fprintf('Input floating point 32bits:');
while 1
    x_sign   =  input('\n>> Bit sign (1bit): ','s');
    if strlength(x_sign)==1
        break;
    end
    fprintf("Nhap 1 bit\n");
end
while 1
    x_exp    =  input('>> Exponent (8bit): ','s');
    if strlength(x_exp)==8
        break;
    end
    fprintf("Nhap 8 bit\n");
end
while 1
    x_frac   =  input('>> Fraction (23bit): ','s');
    if strlength(x_frac)==23
        break;
    end
    fprintf("Nhap 23 bit\n");
end

L_sign  = strlength(x_sign);
L_exp   =strlength(x_exp);
L_frac  =strlength(x_frac);
    if (L_sign ==1)&&(L_exp==8)&&(L_frac ==23)
       a_exp =bin2dec(x_exp);
       a_exp=a_exp-127;
       s =0;
       for i=-1:-1:-23
           s=s+ str2num(x_frac(-i))*2^i;
       end
       fraction = 1+s;
       result=(-1)^(str2num(x_sign))*fraction*2^a_exp;
    elseif{fprintf("Nhap sai\n");}
    end 
    switch(x_exp)
        case '11111111'
            if x_frac=='00000000000000000000000'
                if x_sign =='0'
                    y='inf';
                else
                    y='-inf';
                end
            else
                y='nan';
            end
        case '00000000'
            if x_frac=='00000000000000000000000'
                y='0';
            end
        otherwise 
            y =result;
    end
fprintf("Real numbers: %s \n",y);
end
       