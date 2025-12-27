# dice_rollコマンド

ターミナル上でダイスロールをするコマンドです。

## 必要なソフトウェア
- gcc

## テスト環境
- Ubuntu 22.04.5 LTS
- gcc 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04.2)

## コンパイル方法
```bash
gcc dice_roll.c -o dice_roll
```

## 使い方
```bash
$ git clone git@github.com:ShogoYamashita1/robosys2025_assignment_1_take2.git
$ cd robosys2025_assignment_1_take2
$ echo 5D10 | ./dice_roll
[ 0]out :   5
[ 1]out :   9
[ 2]out :   1
[ 3]out :   1
[ 4]out :   3
```

## 説明
ダイスの個数と面の数を入力すると、結果が入力に対応してランダムに出力します。  
入力は以下のような、TRPGで一般的に使われる表記法で入力してください。  
```bash
[ダイスの個数]D[ダイスの面数]
```
Dは大文字と小文字のどちらでも入力できます。  
また、ダイスの個数と面数は１以上の整数で指定してください。  
異常な入力を受けた場合は標準エラー出力にエラーメッセージを表示し、終了ステータス１で終了します。

## 著作権
このリポジトリはMITライセンスで提供しています。  
詳細はLICENSEファイルを参照してください。  
© 2025 Shogo Yamashita
