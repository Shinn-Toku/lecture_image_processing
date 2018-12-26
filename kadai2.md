# 課題2 レポート
課題2　階調数と疑似輪郭
2階調，4階調，8階調の画像を生成せよ．
下記はサンプルプログラムである．
課題作成にあたっては「Lenna」以外の画像を用いよ．

ウェザーロイドAiriのイラスト(airi_Base.png)を原画像とする．この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．

ORG=imread('airi_Base.png'); % 原画像の入力
ORG = rgb2gray(ORG); colormap(gray); colorbar;
imagesc(ORG); axis image; % 画像の表示

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．

![原画像](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai2/kadai2/kadai2_org_img.png?raw=true)  
図1 原画像

原画像をグレースケールへと変換したもの(今後はこれを原画像とする)は1ピクセルずつ0～255の値でその濃度を表現している．
この原画像を2階調にするには，原画像を比較演算子>で128と比較する．
これにより，原画像の中で128を超える値が1，それを下回る値は0として0と1の2階調の画像となる．

IMG = ORG>128;

2階調の画像の生成結果を図2に示す．

![2階調画像](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai2/kadai2/kadai2_2tone.png?raw=true)  
図2 2階調

同様に4階調にするには，0～64を0，65～128を1，129～192を2，193~255を3とする．すなわち，

IMG0 = ORG>64;
IMG1 = ORG>128;
IMG2 = ORG>192;
IMG = IMG0 + IMG1 + IMG2;

とする．これにより，0～3の4値の4階調となる．
4階調の画像の生成結果を図３に示す．

![4階調画像](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai2/kadai2/kadai2_4tone.png?raw=true)  
図3 4階調

同様に8階調にするには，4階調のときからさらにステップを半分にする．すなわち，

IMG0 = ORG>32;
IMG1 = ORG>64;
IMG2 = ORG>96;
IMG3 = ORG>128;
IMG4 = ORG>160;
IMG5 = ORG>192;
IMG6 = ORG>224;
IMG = IMG0 + IMG1 + IMG2 + IMG3 + IMG4 + IMG5 + IMG6;

とする．8階調の画像の生成結果を図4に示す．

![原画像](https://github.com/Shinn-Toku/lecture_image_processing/blob/master/image/kadai2/kadai2/kadai2_8tone.png?raw=true)  
図4 8階調

このようにサンプリング幅が大きくなると，モザイク状のサンプリング歪みが発生する．
