//
//  BinaryTreeTest.m
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/27.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import "BinaryTreeTest.h"
#import "BinaryTreeNode.h"
@implementation BinaryTreeTest
+ (void)test
{
    
    BinaryTreeNode *rootNode = [BinaryTreeNode createTreeWithValues:@[@13,@7,@10,@12,@11,@9,@34,@21,@56,@20,@30,@35,@57]];
  BinaryTreeNode *indexNode = [BinaryTreeNode treeNodeAtIndex:4 inTree:rootNode];
  NSLog(@"%lu",indexNode.value);
  [BinaryTreeNode levelPrintBinaryTreeNode:rootNode handler:^(BinaryTreeNode *treeNode) {
    printf("%lu   ",treeNode.value);
}];
   printf("\n");
  [BinaryTreeNode preOrderTraverseTree:rootNode handler:^(BinaryTreeNode *treeNode) {
    printf("%lu   ",treeNode.value);
}];
 printf("\n");
   [BinaryTreeNode inOderOrderTraverseTree:rootNode handler:^(BinaryTreeNode *treeNode) {
 printf("%lu   ",treeNode.value);
}];
 printf("invert\n");
    rootNode = [BinaryTreeNode invertBinaryTree:rootNode];
      [BinaryTreeNode inOderOrderTraverseTree:rootNode handler:^(BinaryTreeNode *treeNode) {
 printf("%lu   ",treeNode.value);
}];
 printf("\n");
   [BinaryTreeNode lastOrderTraverseTree:rootNode handler:^(BinaryTreeNode *treeNode) {
    printf("%lu   ",treeNode.value);
}];

    NSLog(@"depth:%lu",[BinaryTreeNode depthOfTree:rootNode]);
    
    NSLog(@"width:%lu",[BinaryTreeNode widthOfTree:rootNode]);
    NSLog(@"count:%lu",[BinaryTreeNode numberOfNodesInTree:rootNode]);
    NSLog(@"levelcount:%lu",[BinaryTreeNode numberOfNodesOnLevel:4 inTree:rootNode]);
    NSLog(@"leafs:%lu",[BinaryTreeNode numberOfLeafsInTree:rootNode]);
     NSLog(@"Distance:%lu",[BinaryTreeNode maxDistanceOfTree:rootNode]);
     BinaryTreeNode *node = [BinaryTreeNode new];
     node.value = 11;
          NSLog(@"path%@",[BinaryTreeNode pathOfTreeNode:node inTree:rootNode handler:^BOOL(BinaryTreeNode *treeNode, BinaryTreeNode *rootNode) {
             if(treeNode.value == rootNode.value)
             {
                return YES;
             }
             return NO;
}]);
   BinaryTreeNode *nodeA = [[BinaryTreeNode alloc]initWithValue:21];
   BinaryTreeNode *nodeB = [[BinaryTreeNode alloc]initWithValue:11];
 BinaryTreeNode *nodeP = [ BinaryTreeNode parentOfNode:nodeA andNode:nodeB inTree:rootNode handler:^BOOL(BinaryTreeNode *nodeA, BinaryTreeNode *nodeB) {
         if(nodeA.value == nodeB.value)
         {
             return YES;
         }
         return NO;
   }];
   
   NSArray *pathArray=  [BinaryTreeNode pathFromNode:nodeA toNode:nodeB inTree:rootNode handler:^BOOL(BinaryTreeNode *nodeA, BinaryTreeNode *nodeB) {
           if(nodeA.value == nodeB.value)
         {
             return YES;
         }
         return NO;
}];
   NSLog(@"path:%@",pathArray);
   NSLog(@"parentNode:%@",nodeP);
   NSLog(@"%ld",[BinaryTreeNode isCompleteBinaryTree:rootNode]);
   NSLog(@"%lu",[BinaryTreeNode isFullBinaryTree:rootNode]);
        // insert code here...
}
@end
