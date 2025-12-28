#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT


### 異常終了関数 ###
ng () {
        echo ${1}行目で失敗しました
        res=1
}

### 行数チェック関数 ###
row_counter () {
    out_row=$(echo ${2} | tr ' ' '\n' | wc -l)

    if [ "${1}" = "$out_row" ]; then
        res=0
    else
        ng "$LINENO"
    fi
}


res=0


### 通常入力 ###
out=$(echo 3d2 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 3 "${out}"

out=$(echo 23d43 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 23 "${out}"

out=$(echo 65D53 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 65 "${out}"

out=$(echo 7d10 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 7 "${out}"

out=$(echo 8D20 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 8 "${out}"

out=$(echo 30d5 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 3 "${out}"

out=$(echo 40D4 | ./dice_roll)
[ "$?" = 0 ] || ng "$LINENO"
row_counter 40 "${out}"


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


#out=$(echo 1.0d5.3 | ./dice_roll)
#[ "$?" = 1 ] || ng "$LINENO"

#out=$(echo 2.32d0.77 | ./dice_roll)
#[ "$?" = 1 ] || ng "$LINENO"

#out=$(echo 0.544d4.8 | ./dice_roll)
#[ "$?" = 1 ] || ng "$LINENO"

#out=$(echo 0.32d0.359 | ./dice_roll)
#[ "$?" = 1 ] || ng "$LINENO"

### テスト結果 ###
[ "${res}" = 0 ] && echo OK
exit $res
