# 課題4 レポート

## 課題4　画像のヒストグラム

画素の濃度ヒストグラムを生成せよ．

## 原画像

ウェザーロイドAiriのイラスト(airi_Base.png)を原画像とする．この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．

```MATLAB
ORG=imread('airi_Base.png'); % 原画像の入力
ORG=rgb2gray(ORG); % カラー画像を白黒濃淡画像へ変換
imagesc(ORG); colormap(gray); colorbar; axis image;
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．

![原画像](/image/kadai4/kadai4_org_img.png?raw=true)  
図1 原画像  

## ヒストグラム

```MATLAB
imhist(ORG);
```

によりヒストグラムを表示した結果を図2に示す．  

![ヒストグラム](/image/kadai4/kadai4_hist.png?raw=true)  
図2 ヒストグラム
