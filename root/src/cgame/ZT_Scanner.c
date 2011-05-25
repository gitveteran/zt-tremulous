/*
 * ZT_Scanner.c
 *
 *  Created on: Oct 22, 2010
 *      Author: john
 */
#include "cg_local.h"

void ZT_DrawScanner( void )
{
    int i;

    vec3_t  origin       = { 0.0f, 0.0f, 0.0f };
    vec3_t  drawOrigin   = { 0.0f, 0.0f, 0.0f };
    vec3_t  relOrigin    = { 0.0f, 0.0f, 0.0f };

    vec3_t up          = { 0.0f, 0.0f, 1.0f };

    vec4_t buildcolor  = { 1.0f, 1.0f, 0.0f, 1.0f };
    vec4_t humancolor  = { 0.0f, 0.0f, 1.0f, 1.0f };
    vec4_t aliencolor  = { 1.0f, 0.0f, 0.0f, 1.0f };

    vec4_t color       = { 1.0f, 1.0f, 1.0f, 0.50f};
    vec4_t colorB      = { 0.0f, 0.0f, 0.0f, 0.50f};

    if ( !ZT_Scanner_Mode.integer ) { return; }

    //Fill background first

    CG_FillRect(ZT_Scanner_X.integer, ZT_Scanner_Y.integer, ZT_Scanner_Width.integer,
    ZT_Scanner_Height.integer, colorB);


    //Now lines

    CG_FillRect(ZT_Scanner_X.integer + (ZT_Scanner_Width.integer / 2),
    ZT_Scanner_Y.integer, 1, ZT_Scanner_Height.integer, color);

    CG_FillRect(ZT_Scanner_X.integer,
    ZT_Scanner_Y.integer + (ZT_Scanner_Height.integer /2 ),
    ZT_Scanner_Height.integer, 1, color);

    CG_UpdateEntityPositions();

    //Now actual blips

    VectorCopy( entityPositions.origin, origin );

    //draw human buildables

    for( i = 0; i < entityPositions.numHumanBuildables; i++ )
    {
        VectorClear( relOrigin );
        VectorSubtract( entityPositions.humanBuildablePos[ i ], origin, relOrigin );

        if( VectorLength( relOrigin ) < ZT_Scanner_Range.integer )
        {
            RotatePointAroundVector( drawOrigin, up, relOrigin,
            -entityPositions.vangles[ 1 ] - 90 );

            drawOrigin[ 0 ] /= ( (float)(1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);
            drawOrigin[ 1 ] /= ( (float)(1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Height.integer);
            drawOrigin[ 2 ] /= ( (float)(1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);

            CG_FillRect( ZT_Scanner_X.integer + (ZT_Scanner_Width.integer / 2) +
            -drawOrigin[0], ZT_Scanner_Y.integer + (ZT_Scanner_Height.integer / 2) +
            drawOrigin[1], 4, 4, buildcolor );
        }

    }

    //draw human players

    for( i = 0; i < entityPositions.numHumanClients; i++ )
    {

        VectorClear( relOrigin );
        VectorSubtract( entityPositions.humanClientPos[ i ], origin, relOrigin );

        if( VectorLength( relOrigin ) < ZT_Scanner_Range.integer )
        {
            RotatePointAroundVector( drawOrigin, up, relOrigin,
            -entityPositions.vangles[ 1 ] - 90 );

            drawOrigin[ 0 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);
            drawOrigin[ 1 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Height.integer);
            drawOrigin[ 2 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);

            CG_FillRect( ZT_Scanner_X.integer + (ZT_Scanner_Width.integer / 2) +
            -drawOrigin[0], ZT_Scanner_Y.integer + (ZT_Scanner_Height.integer / 2) +
            drawOrigin[1], 2, 2, humancolor );
        }
    }


    //draw alien buildables

    for( i = 0; i < entityPositions.numAlienBuildables ; i++ )
    {
        VectorClear( relOrigin );
        VectorSubtract( entityPositions.alienBuildablePos[ i ], origin, relOrigin );

        if( VectorLength( relOrigin ) < ZT_Scanner_Range.integer )
        {

            RotatePointAroundVector( drawOrigin, up, relOrigin,
            -entityPositions.vangles[ 1 ] - 90 );

            drawOrigin[ 0 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);
            drawOrigin[ 1 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Height.integer);
            drawOrigin[ 2 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);

            CG_FillRect( ZT_Scanner_X.integer + (ZT_Scanner_Width.integer / 2) +
            -drawOrigin[0], ZT_Scanner_Y.integer + (ZT_Scanner_Height.integer / 2) +
            drawOrigin[1], 4, 4, buildcolor);
        }
    }

    //draw alien clients

    for( i = 0; i < entityPositions.numAlienClients; i++ )
    {
        VectorClear( relOrigin );
        VectorSubtract( entityPositions.alienClientPos[ i ], origin, relOrigin );

        if( VectorLength( relOrigin ) < ZT_Scanner_Range.integer )
        {

            RotatePointAroundVector( drawOrigin, up, relOrigin,
            -entityPositions.vangles[ 1 ] - 90 );

            drawOrigin[ 0 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);
            drawOrigin[ 1 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Height.integer);
            drawOrigin[ 2 ] /= ( (float)( 1.25f * (float)ZT_Scanner_Range.integer) /
            (float)ZT_Scanner_Width.integer);

            CG_FillRect( ZT_Scanner_X.integer + (ZT_Scanner_Width.integer / 2) +
            -drawOrigin[0], ZT_Scanner_Y.integer + (ZT_Scanner_Height.integer / 2) +
            drawOrigin[1], 2, 2, aliencolor);
        }
    }
}
