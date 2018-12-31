# 課題5 レポート
## 課題5　判別分析法
判別分析法を用いて画像二値化せよ．

## 原画像
ウェザーロイドAiriのイラスト(airi_Base.png)を原画像とする．この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．

ORG=imread('airi_Base.png'); % 原画像の入力
ORG=rgb2gray(ORG); % カラー画像を白黒濃淡画像へ変換
imagesc(ORG); colormap(gray); colorbar; axis image;

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai4/kadai4_org_img.png?raw=true)  
図1 原画像  

## ヒストグラム
imhist(ORG);  
によりヒストグラムを表示した結果を図2に示す．  

![ヒストグラム](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai4/kadai4_hist.png?raw=true)  
図2 ヒストグラム  