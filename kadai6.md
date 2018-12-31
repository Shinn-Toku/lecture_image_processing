# 課題6 レポート

## 課題6 画像の二値化

下記のプログラムを参考にして画像を二値化せよ．  

## 原画像

原画像をSIDBAのmilkdrop(milkdrop.jpg)とする．  
この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．  

```MATLAB
ORG=imread('milkdrop.jpg'); % 原画像の入力  
ORG = rgb2gray(ORG);  
imagesc(ORG); colormap(gray); colorbar; axis image; % 画像の表示  
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai6/kadai6_org_img.png?raw=true)  
図1 原画像  

## 閾値128による二値化

```MATLAB
IMG = ORG>128; % 128による二値化  
imagesc(IMG); colormap(gray); colorbar; axis image; % 画像の表示  
```

による二値化の結果をに示す．  

![閾値128による二値化](/image/kadai6/kadai6_128.png?raw=true)  
図2 閾値128による二値化  

## ディザ法による二値化

ディザ法とは，原画像の各画素の濃度値を，  
![式1](https://latex.codecogs.com/svg.latex?f(x,y)<T(x,y))なら，![式2](https://latex.codecogs.com/svg.latex?g(x,y)=0)  
![式3](https://latex.codecogs.com/svg.latex?f(x,y)\geq&space;T(x,y))なら，![式4](https://latex.codecogs.com/svg.latex?g(x,y)=1)  
のように画素位置によりあらかじめ定められたディザマトリクスTの値(閾値)と比較し，その大小関係で出力画素の濃度値を決定する方法である．  
ここで，*f*(*x*, *y*)は入力画像の濃度値，*g*(*x*, *y*)は出力画像の濃度値，*T*(*x*, *y*)は画層位置(*x*, *y*)での閾値である．  

MATLABでは，dither関数を用いることでディザ法による二値化を行うことができる．  

```MATLAB
IMG = dither(ORG); % ディザ法による二値化  
imagesc(IMG); colormap(gray); colorbar; axis image; % 画像の表示  
```

により，ディザ法を用いて二値化した結果を図3に示す．  

![ディザ法による二値化](/image/kadai6/kadai6_dither.png?raw=true)  
図3 ディザ法による二値化  

図2と図3を比較すると，閾値128による二値化の場合，閾値を境界とした輪郭部分以外の情報が失われているが，ディザ法による二値化の場合，図1の原画像における背景の濃度などが再現できており，図2に比べ視覚的な情報が失われていないことが見てとれる．  
