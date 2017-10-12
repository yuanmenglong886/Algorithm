//
//  BinaryTreeNode.h
//  BinaryTree_Algorithm
//
//  Created by 58 on 2017/9/26.
//  Copyright © 2017年 yuanmenglong. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
   1. 创建二叉树
   2. 向二叉树中某个位置插入结点： 类似索引操作，按层次遍历，位置从零开始
   3. 二叉树的遍历
      1. 层次遍历 ： 从上到下 ，从左到右
      2. 先序遍历 ： 先访问根，在访问左子树，后访问右子树
      3. 中序遍历 ： 先访问左子树， 再访问根，后访问右子树
      4. 后续遍历 ： 先访问左子树，在访问 右子树，最后访问根
   4. 二叉树的深度： 从根节点到叶子结点依次经过的结点形成树的一条路径，最长路径的长度为树的深度
      1. 如果根节点为空，则深度为0；
      2. 如果左右节点都为空，则深度为一；
      3. 递归思想： 二叉树的深度 = max(左子树的深度，右子树的深度)+1；
   5. 二叉树的宽度： 二叉树的宽度定义为各层次节点数的最大值
       1.使用队列将当前层级所有结点，压入队列，之后压入Tag 位
       2. 下次将取出队列中的所有结点，将他们的左右子结点压入，之后压入Tag位
       3. 每次队列中压入子结点的数目，即为当前层级的宽度，取出所有层级中最大数
   6
   7
   8
   9. 二叉树的最大距离(二叉树的直径)
      二叉树中任意两个节点都有且仅有一条路径，这个路径的长度叫这两个节点的距离。二叉树中所有节点之间的距离的最大值就是二叉树的直径
    有一种解法，把这个最大距离划分了3种情况：
       1）这2个节点分别在根节点的左子树和右子树上，他们之间的路径肯定经过根节点，而且他们肯定是根节点左右子树上最远的叶子节点（他们到根节点的距离=左右子树的深度）。
       2）这2个节点都在左子树上
       3）这2个节点都在右子树上
      综上，只要取这3种情况中的最大值，就是二叉树的直径。
 
   10.  二叉树中某个节点到根节点的路径
   11.  二叉树中两个节点最近的公共父节点
   12   二叉树中两个节点之间的路径
   13   二叉树中两个节点之间的距离
   14   反转二叉树（二叉树的镜像）：反转后的跟结点不变 ，做节点变为右节点  右节点变为左节点
   15   判断二叉树是否完全二叉树 
   16   判断二叉树是否为满二叉树  :除了叶结点外每一个结点都有左右子叶且叶子结点都处在最底层的二叉树节点上
              满二叉树的特性： 叶子数 = 2^(深度-1)
   17   判断二叉树是否 为平衡二叉树
   18   是否平衡二叉树:(AVL树)
        是一颗空树，或者左右子树的高度差的绝对值不超过1，并且左右两个子树都是一颗平衡二叉树
   
*/
@interface BinaryTreeNode : NSObject
@property  (nonatomic,assign) NSInteger value;
@property  (nonatomic,strong) BinaryTreeNode *leftNode;
@property  (nonatomic,strong) BinaryTreeNode *rightNode;
- ( instancetype)initWithValue:(NSInteger)value;
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values;

//   向二叉树中插入结点
+ (BinaryTreeNode *)insertBinaryTree:(BinaryTreeNode *)rootNode value:(NSInteger )value;

+ (BinaryTreeNode *)treeNodeAtIndex:(NSInteger )index inTree:(BinaryTreeNode *)rootNode;

//  遍历
//1. 层次遍历
+  (void)levelPrintBinaryTreeNode:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler;
//2. 先序遍历
+  (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handelr;
// 3. 中序遍历
+  (void)inOderOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handelr;
// 4.后序遍历
+  (void)lastOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handelr;

+ (NSInteger )depthOfTree:(BinaryTreeNode *)rootNode;

+ (NSInteger)widthOfTree:(BinaryTreeNode *)rootNode;
+ (NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode;
+ (NSInteger)numberOfNodesOnLevel:(NSInteger )level inTree:(BinaryTreeNode *)rootNode;
+ (NSInteger)numberOfLeafsInTree:(BinaryTreeNode *)rootNode;
+ (NSInteger)maxDistanceOfTree:(BinaryTreeNode *)rootNode;
+ (NSArray *)pathOfTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode handler:(BOOL(^)(BinaryTreeNode *treeNode,BinaryTreeNode *rootNode))handler;
+ (BinaryTreeNode *)parentOfNode:(BinaryTreeNode *)nodeA andNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL(^)(BinaryTreeNode *nodeA,BinaryTreeNode *nodeB))handler;
+ (NSArray *)pathFromNode:(BinaryTreeNode *)nodeA toNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL(^)(BinaryTreeNode *nodeA,BinaryTreeNode *nodeB))handler;;
+ (NSInteger )distanceFromNode:(BinaryTreeNode *)nodeA toNode:(BinaryTreeNode *)nodeB inTree:(BinaryTreeNode *)rootNode handler:(BOOL(^)(BinaryTreeNode *nodeA,BinaryTreeNode *nodeB))handler;

+  (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode;

+  (BOOL)isCompleteBinaryTree:(BinaryTreeNode *)rootNode;
+  (BOOL)isFullBinaryTree:(BinaryTreeNode *)rootNode;
+  (BOOL)isAVLBinaryTree:(BinaryTreeNode *)rootNode;

@end

@interface  TreeNodeProperty:NSObject
@property (nonatomic,assign) NSInteger  distance;
@property (nonatomic,assign) NSInteger  depth;
@end
