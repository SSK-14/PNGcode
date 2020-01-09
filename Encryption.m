prompt = {'Enter text the text you want to hide'};
title = 'Input';
dims = [1 80];
definput={'Enter here'};
String = inputdlg(prompt,title,dims,definput);
String = char(String);
String=uint16(String);    %converting to 16 bit numbers for proper calculation
x=imread('Original.png');   %reading the image file
x=uint16(x);                %conversion to 16 bit
[x_row,x_col]=size(x);

strlen=numel(String);   %counting characters
a=1;

%encrypting loop
for i=1:x_row
    for j=1:x_col
        if(a<=strlen)
            
            if(x(i,j)+String(a)>255)
                temp=x(i,j)+String(a)-256;
            else
                temp=x(i,j)+String(a);
            end
            z(i,j)=uint8(temp);
        else
            z(i,j)=uint8(x(i,j));
        end
        a=a+1;
    end
end

imwrite(z,'E:\Edu\Packages\MATLAB\Encrypted.png');     %writing the encrypted data as pixels in image