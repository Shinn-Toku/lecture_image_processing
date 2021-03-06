# 課題3 レポート

## 課題3　閾値処理

閾値を4パターン設定し,閾値処理た画像を示せ．

## 原画像

ウェザーロイドAiriのイラスト(airi_Base.png)を原画像とする．この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．

```MATLAB
ORG=imread('airi_Base.png');  
ORG= rgb2gray(ORG);  
imagesc(ORG); colormap(gray); colorbar; axis image;
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai3/kadai3_org_img.png?raw=true)  
図1 原画像  

原画像をグレースケールへと変換したもの(以下これを原画像とする)は1ピクセルずつ0～255の値でその濃度を表現している．  

## 閾値が64のとき

この原画像を閾値処理するためには，原画像を比較演算子>で閾値と比較する．  
これにより，原画像の中で閾値を超える値が1，それを下回る値は0となり0と1の2階調の画像となる．
これはすなわち閾値を超える画素のみが1となる画像となる．  
ここで，閾値を64とすると，

```MATLAB
IMG = ORG>64;
```

というコードになる．その実行結果を図2に示す．

![閾値が64のとき](/image/kadai3/kadai3_th64.png?raw=true)  
図2 閾値が64のとき

## 閾値が96のとき

同様に閾値を96とすると，コードは

```MATLAB
IMG = ORG > 96;
```

となる．その実行結果を図3に示す．

![閾値が96のとき](/image/kadai3/kadai3_th96.png?raw=true)  
図3 閾値が96のとき

## 閾値が128のとき

同様に閾値を96とすると，コードは  

```MATLAB
IMG = ORG > 128;
```

となる．その実行結果を図4に示す．

![閾値が128のとき](/image/kadai3/kadai3_th128.png?raw=true)  
図4 閾値が128のとき

## 閾値が192のとき

同様に閾値を192とすると，コードは  

```MATLAB
IMG = ORG > 192;
```

となる．その実行結果を図5に示す．

![閾値が192のとき](/image/kadai3/kadai3_th192.png?raw=true)  
図5 閾値が192のとき
