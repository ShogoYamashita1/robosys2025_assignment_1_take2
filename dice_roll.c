#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<ctype.h>


int GetRandom(int min, int max)
{
    return min + (int)(rand() * (max - min + 1.0) / (1.0 + RAND_MAX));
}


int main(void){
int input, num1 = 0, num2 = 0, take = 0;
static int flag;

// 入力確認と数字分け
while((input = getchar()) != EOF){
    if(isalpha(input)){// 文字
            //puts("D?");
        if( (input == 'd' || input == 'D') && flag != 2 && take != 0 ){
            //puts("D");
            flag = 1;
            take = 0;
        }
        else{flag = 2;}
    }
    else if(isdigit(input)){// 数字
        if(flag == 0){
            if( !(take == 0 && input == '0') ){
                num1 *= 10;
                num1 += (input - '0');
                take++;
                //printf("num1 %d input %d\n", num1, input);
            }
            else{
                flag = 2;
                //printf("out!! : flag = %d\n", flag);
            }
        }
        else if(flag == 1){
            if( !(take == 0 && input == '0') ){
                num2 *= 10;num2 += (input - '0');
                take++;
                flag = 3;
            }
            else{flag = 2;}
        }
        //printf("%d %d\n", num1, num2);
    }
    else if(input != '\n'){
        puts("not d");
        flag = 2;
    }
//printf("take = %d : flag = %d\n", take, flag);
//printf("input = %c\n", input);
}


// 終了処理
if(flag == 3){
// 乱数
srand((unsigned int)time(NULL));

for(int i = 0; i < num1; i++){
    printf("[%2d]out : %3d\n", i, GetRandom(1, num2));
}
    //puts("end");printf("%d %d\n", num1, num2);
    return 0;
}
else{
    fprintf(stderr, "error\n");
    return 1;
}
}
