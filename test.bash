#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT

ng () {
        echo ${1}行目で失敗しました
        res=1
}

res=0


### 通常入力 ###
out=$(echo 3d2 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"

out=$(echo 3D10 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"


### 特殊入力 ###
out=$(echo 0d2 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 0D23 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 2d0 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 34D0 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo d2 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo D5 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 3d | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 9D | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo  | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 23 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 0 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 00 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 000 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo *** | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo あ | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo d12d23 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo D21d34 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo D2D22 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 3d2d | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 8d97D | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 23D77D | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo １Ｄ３ | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo  3Ｄ6| ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo  8ｄ6| ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo  02d3| ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 08D6 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 8d03 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"

out=$(echo 6D07 | ./dice_roll)
[ "$?" = 1 ] || ng "$LINENO"


### テスト結果 ###
[ "${res}" = 0 ] && echo OK
exit $res
