# 翻转链表

> STL 实现：reverse(outputitera first, outputitera last)



# c语言实现

```cpp
//6-1 
List Reverse(List L)//将表L中的每个结点采用头插法插入表now中
{
	List now, p, tmp;//now为反转后的表头指针，p扫描表L中的每个结点
	now = NULL;//now为不带头结点的空表
	p = L;//p指向表L中的第一个元素结点（表L不带头结点）
	while(p)
	{
		tmp = p->Next;//tmp指向p的下一个结点，用来记住未处理的表头指针
		p->Next = now;
		now = p;//这两句采用头插法，将p结点插入到表头指针now后面
		p = tmp;//p重新指向未处理的表头元素
	}
	return now;
}
```

