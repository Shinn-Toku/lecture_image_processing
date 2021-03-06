% 課題８ ラベリング
% 二値化された画像の連結成分にラベルをつけよ．
% 課題作成にあたっては「Lenna」以外の画像を用いよ． 

ORG = imread('airi_Base.png'); % 画像の読み込み
ORG = rgb2gray(ORG); % 白黒濃淡画像に変換
imagesc(ORG); colormap(gray); colorbar; axis image; % 画像の表示
pause;
IMG = ORG > 192; % 閾値192で二値化
imagesc(IMG); colormap(gray); colorbar; axis image; % 画像の表示
pause;
IMG = bwlabeln(IMG);
imagesc(IMG); colormap(jet); colorbar; axis image; % 画像の表示
pause;
