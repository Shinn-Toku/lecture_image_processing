# 課題5 レポート

## 課題5　判別分析法

判別分析法を用いて画像二値化せよ．  

## 原画像

原画像をSIDBAのmilkdrop(milkdrop.jpg)とする．  
この画像は縦512画像，横512画素による正方形のディジタルカラー画像である．  

```MATLAB
ORG = imread('milkdrop.jpg'); % 原画像の入力  
ORG = rgb2gray(ORG); % カラー画像を白黒濃淡画像へ変換  
imagesc(ORG); colormap(gray); colorbar; axis image;  
```

によって，原画像を読み込み，グレースケール画像へと変換し，表示した結果を図１に示す．  

![原画像](/image/kadai5/kadai5_org_img.png?raw=true)  
図1 原画像  

## ヒストグラム

```MATLAB
imhist(ORG);  
```

によりヒストグラムを表示した結果を図2に示す．  

![ヒストグラム](/image/kadai5/kadai5_hist.png?raw=true)  
図2 ヒストグラム  

## 判別分析法

判別分析法はクラス内分散が最小，クラス間分散が最大となるような閾値を求め2値化する手法である．  
まず，

```MATLAB
H = imhist(ORG); %ヒストグラムのデータを列ベクトルHに格納  
```

によりヒストグラムのデータを列ベクトルに格納する．つぎに，

```MATLAB
myu_T = mean(H);  
max_val = 0;  
max_thres = 1;  
```

により各初期値を設定する．そしてfor文により，ヒストグラムを２つに分けるすべての分け方で分散を求める．  

```MATLAB
for i=1:255  
    [...]  
end;  
```

for文内では，まずヒストグラムを2つのクラスC1,C2に分ける．  

```MATLAB
    C1 = H(1:i); %ヒストグラムを2つのクラスに分ける  
    C2 = H(i+1:256);  
```

次に，それぞれのクラスの画素数をsum関数，平均値をmean関数，分散をvar関数でそれぞれ求める．  

```MATLAB
    n1 = sum(C1); %画素数の算出  
    n2 = sum(C2);  
    myu1 = mean(C1); %平均値の算出  
    myu2 = mean(C2);  
    sigma1 = var(C1); %分散の算出  
    sigma2 = var(C2);  
```

そして，その値を用いて，  

```MATLAB
    sigma_w = (n1*sigma1 + n2*sigma2) / (n1+n2); %クラス内分散の算出  
    sigma_B = (n1*(myu1-myu_T)^2 + n2*(myu2-myu_T)^2) / (n1+n2); %クラス間分散の算出  
```

により，クラス内分散とクラス間を求め，  

```MATLAB
    if max_val < sigma_B / sigma_w  
        max_val = sigma_B / sigma_w;  
        max_thres = i;  
```

前回のループ実行時(1回目の場合は初期値0)と比較し，今回のループで求めたsigma_B/sigma_wが大きい場合はその値をmax_valに，その時の閾値iをmax_thresに保持する．  
これをfor文により繰り返すことで，判別分析法による最大の閾値max_thresが求まる．  

このコードによる判別分析法を用いて2値化した結果を図3に示す．  

![判別分析法](/image/kadai5/kadai5_bin_img.png?raw=true)  
図3 判別分析法  

このとき，35行目にブレークポイントを設定しmax_thresの値を確認した結果，この画像を入力した際の閾値は120であった．  