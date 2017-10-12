//
//  SortTest.m
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/27.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import "SortTest.h"
#import "SortAlgorithm.h"
@implementation SortTest
+ (NSInteger)getn:(NSInteger)n
{
     NSInteger sum1 = 0;
     NSInteger sum2 = 0;
    
    for(NSInteger i = 1; i <=n;i++)
    {
        if(i == 1)
        {
            sum1 = 0;
            sum2 = 1;
        }
        else if(i == 2)
        {
            sum1 = sum2;
            sum2 = sum1+1;
        }
        else
        {
             NSInteger temp = sum1;
             sum1 = sum2;
             sum2 += temp;
        }
    }
    return sum2;
}
+ (void)test
{
    NSLog(@"dddd%d",[self getn:20]);
         NSInteger array[] = {12,6,7,15,16,90,1};
//    [SortAlgorithm insertSort:array length:7];
    [SortAlgorithm shellSort:array length:7];
    NSArray *a = @[@12,@6,@7,@15,@16,@90,@1];
    NSMutableArray *muArray = [[NSMutableArray alloc]initWithArray:a];
//   NSLog(@"mu:%@",[SortAlgorithm heapSort:muArray]);
//   muArray = [SortAlgorithm quickSort:muArray];
//   NSLog(@"quickSort:%@",muArray);
    [SortAlgorithm binaryInsertionSort:muArray];
   NSLog(@"%@",muArray);
}
@end
