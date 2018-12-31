# 課題8 レポート

## 課題8 ラベリング

二値化された画像の連結成分にラベルをつけよ．

## 原画像

原画像をウェザーロイドAiriのイラスト(airi_Base.png)とする．  
この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．  

```MATLAB
ORG = imread('airi_Base.png'); % 画像の読み込み
ORG = rgb2gray(ORG); % 白黒濃淡画像に変換
imagesc(ORG); colormap(gray); colorbar; % 画像の表示
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai8/kadai8_org_img.png?raw=true)  
図1 原画像  

## 二値化画像

閾値192により二値化した画像を図2に示す．

![二値化](/image/kadai8/kadai8_bin_img.png?raw=true)  
図2 二値化  

## ラベリング

ラベリングとは，同じ連結成分に属する画素に同一番号を，異なる連結成分に異なる番号を与える処理のことである．  
MATLABでは，bwlabeln関数により，バイナリイメージ内の連結要素をラベル付けすることができ，その出力は同一の値となっているものが同一の連結成分，異なる値となっているものが異なる連結成分である．  

```MATLAB
IMG = bwlabeln(IMG);  
```

により，bwlabeln関数を用いてラベリングを行っている．  

```MATLAB
imagesc(IMG); colormap(jet); colorbar; axis image; % 画像の表示  
```

により，図2の画像をラベリングした画像を図3に示す．  

![ラベリング](/image/kadai8/kadai8_labeled.png?raw=true)  
図3 ラベリング  

図3では，colormap(jet); により値ごとに異なる色を指定して表示を行っている．図3をみると，同一の色となっている領域がある，すなわち連結がいくつかあることがわかる．  