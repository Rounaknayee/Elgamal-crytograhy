%-- Rounak Nayee --- 1613091--
%-- K.J.Somaiya College of Engineering
%-- ElGamal Cryptosystem


clc;
clear all;
close all;

p = input('Enter the value of p: ');
e1 = input('Enter primitive root e1: ');
d = input('Enter a value for d: ');
e2 = mod(e1^d,p);
disp(e2);
plain= input('Enter plain text');
plain = alpha2num(plain);
disp('plain text to 00-25: ')
disp(plain);
r = input('Enter a value for r: ');

%-- Elgamal Encryption
c1 = mod(e1^r,p);
c2 = mod(plain*mod(e2^r,p),p);
disp(c1);
disp(c2);

%-- Elgamal Decryption
Decrypt = mod((mod(c2,p)*exponentmod(c1,p-1-d,p)),p);
disp('The Decrypted Message is: ');
disp(Decrypt);
disp('Decrypted Message back to string')
disp(char(Decrypt+97));


function p = alpha2num(s)
    d=double(s);
    for i=1:length(d)
        if d(i)>96 && d(i)<123
            d(i)=d(i)-97;
        elseif d(i)>64 && d(i)<91
            d(i)=d(i)-65;
        else
            disp('Invalid alphabet');
        end
    end
    p=d;
end

function a=exponentmod(b,e,m)
if m==1
    a=0;
    return
end
i=1;
a=1;
while i<=e
    a = mod(a*b,m);
    i = i+1;
end
end
