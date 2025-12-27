#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<ctype.h>


int GetRandom(int min, int max)
{
    return min + (int)(rand() * (max - min + 1.0) / (1.0 + RAND_MAX));
}


int main(void){
int input, num1 = 0, num2 = 0, flag = 0;

// 入力確認と数字分け
while((input = getchar()) != EOF){
    if(isalpha(input)){// 文字：真ん中以外・複数個でエラー出るようにする
            //puts("D?");
        if(input == 'd' || input == 'D'){
            //puts("D");
            flag = 1;
        }
        else{flag = 2;}
    }
    if(isdigit(input)){// 数字：０でエラー出るようにする
        if(flag == 0){
            num1 *= 10;
            num1 += (input - '0');
            //printf("num1 %d input %d\n", num1, input);
            }
        else{num2 *= 10;num2 += (input - '0');}
        //printf("%d %d\n", num1, num2);
    }
}


// 終了処理
if(flag == 2){
    fprintf(stderr, "error\n");
return 1;
}
else{
// 乱数
srand((unsigned int)time(NULL));

for(int i = 0; i < num1; i++){
    printf("[%2d]out : %3d\n", i, GetRandom(1, num2));
}
//puts("end");printf("%d %d\n", num1, num2);
return 0;
}
}
