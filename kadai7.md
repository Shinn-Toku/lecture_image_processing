# 課題7 レポート

## 課題7 ダイナミックレンジの拡大

画素のダイナミックレンジを０から２５５にせよ．  

## 原画像

原画像をSIDBAのmilkdrop(milkdrop.jpg)とする．  
この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．  

```MATLAB
ORG=imread('milkdrop.jpg'); % 原画像の入力  
ORG = rgb2gray(ORG);  
imagesc(ORG); colormap(gray); colorbar; axis image; % 画像の表示  
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai7/kadai7_org_img.png?raw=true)  
図1 原画像  

原画像のヒストグラムを図2に示す．  

![ヒストグラム(原画像)](/image/kadai7/kadai7_org_hist.png?raw=true)  
図2 ヒストグラム(原画像)

## ダイナミックレンジの拡大

まず，

```MATLAB
ORG = double(ORG);  
```

は，原画像ORGの値を浮動小数点数doubleに変換している．  
次に，

```MATLAB
mn = min(ORG(:)); % 濃度値の最小値を算出  
mx = max(ORG(:)); % 濃度値の最大値を算出  
```

により最大値と最小値を算出している．  
そして，

```MATLAB
ORG = (ORG-mn)/(mx-mn)*255;  
imagesc(ORG); colormap(gray); colorbar; axis image;% 画像の表示  
```

により，算出した最大値と最小値を用いてダイナミックレンジを0～255に拡大し，その画像を表示している．このとき，ORGの値はdoubleであるため，

```MATLAB
ORG = uint8(ORG); % この行について考察せよ  
imhist(ORG); % 濃度ヒストグラムを生成、表示  
```

uint8により8ビット符号なし整数に変換しそのヒストグラムを表示している．  
uint8への変換はヒストグラムを表示するimhist関数にdouble型を入力した場合，倍率*A*が1，オフセットが*0*となってしまうため，正しいヒストグラムが得られないために行っている．  

ダイナミックレンジ拡大の実行結果を図3に，そのヒストグラムを図4に示す．

![ダイナミックレンジ拡大](/image/kadai7/kadai7_exp_img.png?raw=true)  
図3 ダイナミックレンジ拡大

そのヒストグラムを図4に示す．  

![ヒストグラム(ダイナミックレンジ拡大)](/image/kadai7/kadai7_exp_hist.png?raw=true)  
図4 ヒストグラム(ダイナミックレンジ拡大)  

図2と図4を比べると，図2で0～9，242～255にあった値0の部分が取りのぞかれ，0～255の値すべてで画像が表現されるようになったことがわかる．  