# 課題9 レポート

## 課題9 メディアンフィルタと先鋭化

メディアンフィルターを適用し，ノイズ除去を体験せよ．  

## 原画像

原画像をウェザーロイドAiriのイラスト(airi_Base.png)とする．  
この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．  

```MATLAB
ORG = imread('Lenna.jpg'); % 画像の読み込み  
ORG = rgb2gray(ORG); % 白黒濃淡画像に変換  
imagesc(ORG); colormap(gray); colorbar; axis image; % 画像の表示  
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai9/kadai9_org_img.png?raw=true)  
図1 原画像  

## ノイズ添付

```MATLAB
ORG = imnoise(ORG,'salt & pepper',0.02); % ノイズ添付
```

により，ノイズを添付した画像をに図2に示す．

![ノイズ添付](/image/kadai9/kadai9_noise.png?raw=true)  
図2 ノイズ添付  

## 平滑化フィルタ

平滑化とは，画素ごとの濃度値の細かな変動をなくし，滑らかな画像とする処理のことである．しかし，これにより同時に画像本来が持つ細かな変動部分(高周波成分)も失われることとなる．平滑化は，空間フィルタ法を用いて，着目する画素の濃度値をその周囲の画素の濃度に重みを付け加えることで行える．  

MATLABにおいてはfilter2関数の引数にfspecial('average', hsize)を指定することで平滑化フィルタリングを行うことができる．

```MATLAB
IMG = filter2(fspecial('average',3),ORG); % 平滑化フィルタで雑音除去
```

により，図2の画像を平滑化フィルタでノイズ除去した画像を図3に示す．  

![平滑化フィルタ](image/kadai9/kadai9_smoothed.png?raw=true)  
図3 平滑化フィルタ  

図2と図3を比べると，添付したノイズが平滑化され白くなり，近傍画素に広がっている．加えて，原画像も平滑化の影響を受けて図1に比べぼやけた印象となっている．  

## メディアンフィルタ

メディアンフィルタとは変換後の濃度値を着目がその近傍画素の濃度値の平均値とするのではなく，それらの画素濃度の中央値(*n*個ある場合は*n*/*2*番目の濃度値)とするフィルタである．これによりエッジをぼかすことなくノイズの除去が行える．  

MATLABにおいてはmedfilt2関数を用いることでメディアンフィルタを用いたフィルタリングを行うことができる．  

```MATLAB
IMG = medfilt2(ORG,[3 3]); % メディアンフィルタで雑音除去  
```

により，図2の画像をメディアンフィルタでノイズ除去した画像を図4に示す．  

![メディアンフィルタ](image/kadai9/kadai9_median.png?raw=true)  
図4 メディアンフィルタ  

図2と図4を比べると，添付したノイズが除去され図1に近い画像となっていることがわかる．加えて図3と比べると平滑化フィルタでは残っていたノイズも除去できており，エッジのボケが少ないことがわかる．  

## フィルタの設計

MATLABでは，filter2関数の引数に行列を与えることで設計したフィルタを適用することができる．

```MATLAB
f=[0,-1,0;-1,5,-1;0,-1,0]; % フィルタの設計  
IMG = filter2(f,IMG,'same'); % フィルタの適用  
```

としたときのフィルタの適用結果を図5に示す．

![フィルタの設計](image/kadai9/kadai9_filtered.png?raw=true)  
図5 フィルタの設計  