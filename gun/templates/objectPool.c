
// main.c

#include <stdio.h>

typedef struct {
} Object;

typedef union {
    void   *Pointer;
    Object  Object;
} ObjectPool;

#define POOL_SIZE 10

ObjectPool PoolList[POOL_SIZE] = { 0 };
ObjectPool *PoolPtr = PoolList;

void object_init( void )
{
    for ( int i = 0; i < POOL_SIZE - 2; i++ )
    {
        PoolList[i].Pointer = &PoolList[i+1];
    }

    PoolList[POOL_SIZE-1].Pointer = NULL;
}

Object *object_borrow( void )
{
    Object *Result = (Object *)PoolPtr;

    if ( !Result ) { PoolPtr = PoolPtr->Pointer; }

    return Result;
}

void object_return( Object *aObject )
{
    ObjectPool *lNewPoolPtr = (ObjectPool *)aObject;

    lNewPoolPtr->Pointer = PoolPtr;

    PoolPtr = lNewPoolPtr;
}

int main()
{
    object_init();
    printf( "%p\n", PoolPtr );

    Object *obj = object_borrow();
    printf( "%p %p\n", PoolPtr, obj );

    Object *obj2 = object_borrow();
    printf( "%p %p\n", PoolPtr, obj2 );

    object_return( obj );
    printf( "%p\n", PoolPtr );

    object_return( obj2 );
    printf( "%p\n", PoolPtr );

    return 0;
}





