#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT


### 異常終了関数 ###
# テスト終了時にも表示できるようng_lineで失敗した行を記録
ng () {
    if [ "${1}" != 0 ]; then
        echo ${1}行目で失敗しました
        res=1
    fi
}


res=0
ng_line=0


### 異常入力 ###
# 異常入力で終了ステータスが1か確認
# 標準出力になにか出ていないか確認
# エラー出力にエラーが出ているか確認
out=$(echo 0d2 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ]  || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 0D23 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 2d0 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 34D0 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo -10D23 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 2d-10 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo -4D7 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 3d-2 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo d2 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo D5 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 3d | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 9D | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo  | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 23 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 0 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 00 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 000 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo *** | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo あ | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo d12d23 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo D21d34 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo D2D22 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 3d2d | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 8d97D | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 23D77D | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo １Ｄ３ | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo  3Ｄ6| ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo  8ｄ6| ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo  02d3| ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 08D6 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 8d03 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 6D07 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo 1.0d5.3 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 2.32d0.77 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 0.544d4.8 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 0.32d0.359 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }


out=$(echo -1.0d5.3 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 2.32d-0.77 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo -0.544d4.8 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 0.32d-0.359 | ./dice_roll 2>error.tmp)
[ "$?" = 1 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
[ "$out" = "" ]  || { ng_line="$LINENO" ; ng "$ng_line"; }
cat error.tmp | grep "error"
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }

rm error.tmp


### テスト結果 ###
ng "$ng_line"
if [ "${res}" = 0 ]; then
    echo -e "\e[32mAll test cases passed successfully.\e[0m"
else
    echo -e "\e[31mTest failed\e[0m"
fi

exit $res
