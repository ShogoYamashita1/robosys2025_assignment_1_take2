#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Yamashita
# SPDX-License-Identifier: MIT


### 異常終了関数 ###
ng () {
    if [ "${1}" != 0 ]; then
        echo ${1}行目で失敗しました
        res=1
    fi
}

### 行数チェック関数 ###
row_checker () {
    out_row=$(echo ${2} | tr ' ' '\n' | wc -l)

    if [ "${1}" = "$out_row" ]; then
        :
    else
        echo "[Failed] row_checker failed"
        return 1
    fi

    return 0
}

### 出目チェック関数 ###
roll_checker () {
    for i in ${2}; do
        if [ $i -gt ${1} ];then
            echo "[Failed] roll_checker failed"
            return 1
        fi
    done

    return 0
}


res=0
ng_line=0


### 通常入力 ###
out=$(echo 3d2 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 3 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 2 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 23d43 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 23 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 43 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 65D53 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 65 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 53 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 7d10 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 7 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 10 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 8D20 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 8 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 20 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 30d5 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 30 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 5 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }

out=$(echo 40D44 | ./dice_roll)
[ "$?" = 0 ] || { ng_line="$LINENO" ; ng "$ng_line"; }
row_checker 40 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }
roll_checker 44 "${out}" || { ng_line="$LINENO" ; ng "$ng_line"; }


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
ng "$ng_line"
if [ "${res}" = 0 ]; then
    echo "All test cases passed successfully."
else
    echo "Test failed"
fi

exit $res
