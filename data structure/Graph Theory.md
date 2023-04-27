# 数据结构：图

- [ ] ==联通分量==:[无向图](https://baike.baidu.com/item/无向图/1680427?fromModule=lemma_inlink)G的极大连通子图称为G的连通分量( Connected Component)。任何[连通图](https://baike.baidu.com/item/连通图/6460995?fromModule=lemma_inlink)的连通分量只有一个，即是其自身，非连通的[无向图](https://baike.baidu.com/item/无向图/1680427?fromModule=lemma_inlink)有多个连通分量。

- [ ] 如果无向图G必须进行==两次广度优先搜索==才能访问其所有顶点，则G中一定有回路。[<font color = red>x</font>]

- [ ] 在一个==有向图==中，所有顶点的入度与出度之和等于所有边之和的2倍。[<font color =red>$\surd$</font>]

- [ ] 如果无向图G必须进行两次广度优先搜索才能访问其所有顶点，则G一定有2个连通分量。[<font color =red>$\surd$</font>]

- [ ] ==无向连通图==所有顶点的度之和为偶数。[<font color =red>$\surd$</font>]

- [ ] Kruskal 算法是维护一个森林，每一步把两棵树合并成一棵。[<font color =red>$\surd$</font>]

- [ ] Prim 算法是通过每步添加一条边及其相连的顶点到一棵树，从而逐步生成最小生成树。[<font color =red>$\surd$</font>]

- [ ] ==最小生成树==：一个有 n 个结点的[连通图](https://baike.baidu.com/item/连通图/6460995?fromModule=lemma_inlink)的生成树是原图的极小连通子图，且包含原图中的所有 n 个结点，并且有保持图连通的最少的边。 [1] 最小生成树可以用[kruskal](https://baike.baidu.com/item/kruskal/10242089?fromModule=lemma_inlink)（克鲁斯卡尔）算法或[prim](https://baike.baidu.com/item/prim/10242166?fromModule=lemma_inlink)（普里姆）算法求出.      [<font color =red>$\surd$</font>]

- [ ]  对于带权无向图 G = (V, E)，M 是 G 的最小生成树，则 M 中任意两点 V1 到 V2 的路径一定是它们之间的最短路径。[<font color = red>x</font>]

- [ ] The minimum spanning tree of a connected weighted graph with vertex set V={ A, B, C, D, E } and weight set W={ 1, 3, 2, 5, 1, 7, 9, 8, 4} must be unique.   

  顶点集 V={ A, B, C, D, E } 权集 W={ 1, 3, 2, 5, 1, 7, 9, 8, E } 的连通加权图的最小生成树必须 是独一无二的。[<font color = red>x</font>]

- [ ] <font color =red>P 是顶点 S 到 T 的最短路径，如果该图中的所有路径的权值都加 1，P 仍然是 S 到 T 的最短路径。</font>[<font color = red>x</font>]

  ==解释==：若p中多段路都+1，而s到t的直线距离值只是+1，则就不是最短的了.

- [ ] 在一个有权无向图中，若`b`到`a`的最短路径距离是12，且`c`到`b`之间存在一条权为2的边，则`c`到`a`的最短路径距离一定不小于10。    [<font color =red>$\surd$</font>]

- [ ] Prim 算法是通过每步添加一条边及其相连的顶点到一棵树，从而逐步生成最小生成树。[<font color =red>$\surd$</font>]

- [ ] 在有向图中，所有顶点的入度和出度之和是边数的<font color =red >2倍</font>。[<font color =red>$\surd$</font>]

- [ ] 对于一个具有*N*个顶点的无向图，要连通所有顶点至少需要多少条边？

  答案：<b><font color = red> N-1</font></b>；

  一个有n个顶点的无向连通图最多有==n(n-1)/2==条边，最少有==**n-1条边**==。[<font color =red>$\surd$</font>]

- [ ] 对于有向图，其邻接矩阵表示比邻接表表示更易于:

  <font color = red><b>A:</b></font> 求一个顶点的入度

  B: 求一个顶点的出边邻接点

  C. 进行图的深度优先遍历

  D.进行图的广度优先遍历

- [ ] 如果无向图G必须进行两次广度优先搜索才能访问其所有顶点，则下列说法中不正确的是：
		|A|G肯定不是完全图|
		|B|G中一定有回路|
		|C|G一定不是连通图|
		|D|G中有两个连通分量|