# 課題1 レポート

## 課題1 標本化間隔と空間解像度

画像をダウンサンプリングして（標本化間隔を大きくして）表示せよ．

## 原画像

ウェザーロイドAiriのイラスト(airi_Base.png)を原画像とする．この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．

```MATLAB
ORG=imread('Lenna.png'); % 原画像の入力
imagesc(ORG); axis image; % 画像の表示
```

によって，原画像を読み込み，表示した結果を図１に示す．

![原画像](/image/kadai1/kadai1_org_img.png?raw=true)  
図1 原画像

## 1/2サンプリング

原画像を1/2サンプリングするには，画像を1/2倍に縮小した後，2倍に拡大すればよい．なお，拡大する際には，単純補間するために「box」オプションを設定する．

```MATLAB
IMG = imresize(ORG,0.5); % 画像の縮小
IMG2 = imresize(IMG,2,'box'); % 画像の拡大
```

1/2サンプリングの結果を図２に示す．

![原画像](/image/kadai1/kadai1_2.png?raw=true)  
図2 1/2サンプリング

## 1/4サンプリング

同様に原画像を1/4サンプリングするには，画像を1/2倍に縮小した後，2倍に拡大すればよい．すなわち，

```MATLAB
IMG = imresize(ORG,0.5); % 画像の縮小
IMG2 = imresize(IMG,2,'box'); % 画像の拡大
```

とする．1/4サンプリングの結果を図３に示す．

![原画像](/image/kadai1/kadai1_4.png?raw=true)  
図3 1/4サンプリング

## 1/8～1/32サンプリング

1/8から1/32サンプリングは，

```MATLAB
IMG = imresize(ORG,0.5); % 画像の縮小
IMG2 = imresize(IMG,2,'box'); % 画像の拡大
```

を繰り返す．サンプリングの結果を図４～６に示す．

![原画像](/image/kadai1/kadai1_8.png?raw=true)  
図4 1/8サンプリング

![原画像](/image/kadai1/kadai1_16.png?raw=true)  
図5 1/16サンプリング

![原画像](/image/kadai1/kadai1_32.png?raw=true)  
図6 1/32サンプリング

このようにサンプリング幅が大きくなると，モザイク状のサンプリング歪みが発生する．
