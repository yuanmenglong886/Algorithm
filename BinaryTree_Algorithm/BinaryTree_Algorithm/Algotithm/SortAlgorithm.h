//
//  SortAlgorithm.h
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/26.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
排序算法


*/
@interface SortAlgorithm : NSObject
/*
   待排序的数组
*/
+ (void)binaryInsertionSort:(NSMutableArray *)list;
+ (void)insertSort:(NSInteger [])a length:(NSInteger)length;
+ (void)shellSort:(NSInteger [])a length:(NSInteger )length;
+ (NSMutableArray *)heapSort:(NSMutableArray *)array;
+ (NSMutableArray *)quickSort:(NSMutableArray *)list;
//+ (void)heapSort:(NSInteger [])a length:(NSInteger )length;
+ (void)shellInsertSort:(NSInteger [])arr length:(NSInteger)length dk:(NSInteger)dk;
@end
