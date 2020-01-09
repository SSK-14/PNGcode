x=imread('E:\Edu\Packages\MATLAB\Encrypted.png');  %reading encrypted image
y=imread('E:\Edu\Packages\MATLAB\Original.png');   %reading non-encrypted image

x=uint16(x);    %16 bit conversion
y=uint16(y);    %16 bit conversion

[x_row, x_col]=size(x);

b=0;k=1;
%decrypting loop
for i=1:x_row
    for j=1:x_col
        if(x(i,j)>=y(i,j))
            a=x(i,j)-y(i,j);
        else
            a=256+x(i,j)-y(i,j);
        end
        
        if(a~=0)
            z(k)=uint8(a);
            k=k+1;
        else
            b=1;
            break;
        end
    end
    if(b==1)
        break;
    end
end
answer=int2str(z);
fid=fopen('E:\Edu\Packages\MATLAB\Decrypted Message.txt','w'); %creating text file to write decrypted data 
for i=1:k-1
    fprintf(fid,'%c',z(i)); %writing to file
end
