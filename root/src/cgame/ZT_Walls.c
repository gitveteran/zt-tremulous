/*
 * ZT_Walls.c
 *
 *  Created on: Nov 9, 2010
 *      Author: john
 */
#include "cg_local.h"

void ZT_WallHack(refEntity_t *re)
{
	if ( ZT_Walls_Mode.integer > 0)
	{
		re->renderfx |= RF_DEPTHHACK;
	}
}
