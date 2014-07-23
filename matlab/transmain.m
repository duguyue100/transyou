% Author: Hu Yuhuang
% Date  : 2014-07-23

%% init

clc;
clear;
close all;

%% read base image

I=imread('cmydoll.png');
%I=imresize(I, [50, 50]);
I=imresize(I, 0.025);

imshow(I);

I_gray=rgb2gray(I);

re_Row=10;
re_Col=10;

%% read image data base

% read images address

%{
DB_add=textread('images.txt', '%s');
%DB_add=textread('files.txt', '%s');

% read images

DB_len=length(DB_add);
DB=cell(DB_len, 1);

for i=1:DB_len
    DB{i}=imread(DB_add{i});
    DB{i}=imresize(DB{i}, [re_Row, re_Col]);
    str=sprintf('Reading %d th image', i);
    disp(str);
end
%}

% READ FROM SAVED DATABASE

%load('17flowers10x10.mat');
load('102flowers10x10.mat');

%% calculate average for each image in database

DB_AVG=calDBAverage(DB);

%% calculate location for each image to base image

disp('calculating similarities');
DB_SIM=calDBAllSimilarity(I, DB_AVG, 200);

%% arrange new images

T=zeros(size(I,1)*re_Row, size(I,2)*re_Col, 3);

disp('calculating transformed image');
for i=1:size(I,1)
    for j=1:size(I,2)
        T((i-1)*re_Row+1:i*re_Row, (j-1)*re_Col+1:j*re_Col, :)=DB{DB_SIM{i,j}};
    end
end

%% display and store new generate images

T=uint8(T);
figure, imshow(T);