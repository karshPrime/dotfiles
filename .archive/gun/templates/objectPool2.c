
#include <stdio.h>

#define OBJ_POOL_SIZE 10

typedef struct {
    int x, y, z;
} OBJ;

typedef union {
    OBJ obj;
    void  *pointer;
} OBJPool;

static OBJPool PoolBlock[OBJ_POOL_SIZE] = { 0 };
static OBJPool *Pool = PoolBlock;

void obj_init( void )
{
    for( int i = 0; i < ( OBJ_POOL_SIZE - 2 ); i++ )
    {
        PoolBlock[i].pointer = &(PoolBlock[i+1]);
    }

    PoolBlock[OBJ_POOL_SIZE-1].pointer = NULL;
}

OBJ *obj_borrow( void )
{
    OBJ *lOBJ = ( OBJ * )Pool;
    
    if ( lOBJ != NULL )
    {
        Pool = Pool->pointer;
    }

    return lOBJ;
}

void obj_return( OBJ *aOBJ )
{
    OBJPool *lOBJPool = ( OBJPool * )aOBJ;
    lOBJPool->pointer = Pool;
    Pool = lOBJPool;
}

