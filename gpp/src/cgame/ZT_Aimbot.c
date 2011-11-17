/*
 * ZT_Aimbot.c
 *
 *  Created on: Oct 22, 2010
 *      Author: john
 *
 *
 *      lots of code from OGC bot here

 *
 *	ZT_Targeting
 *	ZT_Extrapolation
 *	ZT_PredictTarget
 *	ZT_DoAimbot
 */

#include "cg_local.h"

char sensitivity[16];
#define vecmul(a,b,c) (a[0 ]=b[0]*c[0 ]+b[4]*c[1 ]+b[8 ]*c[2 ]+b[12]*c[3 ],\
		      a[1 ]=b[1]*c[0 ]+b[5]*c[1 ]+b[9 ]*c[2 ]+b[13]*c[3 ],\
		      a[2 ]=b[2]*c[0 ]+b[6]*c[1 ]+b[10]*c[2 ]+b[14]*c[3 ],\
		      a[3 ]=b[3]*c[0 ]+b[7]*c[1 ]+b[11]*c[2 ]+b[15]*c[3 ])

float TIME_MATRIX[16] = {	// This is a precomputed inverse matrix for the time values 0.3, 0.2, 0.1, 0.0
    -166.666779, 100.000008, -18.333330, 1.000000,
    500.000153, -250.000031, 29.999994, 0.000000,
    -500.000092, 200.000031, -15.000001, 0.000000,
    166.666702, -50.000008, 3.333334, 0.000000
};
int targ_sub = 100;
float veloc_scale = 10.0f;
float blu[4] = { 0.0f, 0.0f, 1.0f, 1.0f };

void ZT_Extrapolation(centity_t * cent)
{
    float scale;
    vec3_t lerp;
    vec3_t diff;
    int i;
    int nextframe;
    int targtime;


    if (cent->currentState.clientNum != cg.snap->ps.clientNum) {
		/************************ BEGIN VELOCITY EXTRAPOLATION **************************/
	VectorCopy(cent->lerpOrigin, cent->history[cent->hindex].origin);
	cent->history[cent->hindex].time = trap_Milliseconds();
	targtime = cent->history[cent->hindex].time - targ_sub;
	i = nextframe = cent->hindex;
	do {
	    if (targtime >= cent->history[i].time)
		break;
	    nextframe = i;
	    i--;
	    if (i == -1)
		i = 999;
	} while (i != cent->hindex);
	scale =
	    ((float) (targtime - cent->history[i].time)) /
	    (float) (cent->history[nextframe].time -
		     cent->history[i].time);
	VectorSubtract(cent->history[nextframe].origin,
		       cent->history[i].origin, diff);
	VectorMA(cent->history[i].origin, scale, diff, lerp);
	VectorSubtract(cent->lerpOrigin, lerp, cent->vel);
	VectorScale(cent->vel, veloc_scale, cent->vel);

	targtime -= targ_sub;
	do {
	    if (targtime >= cent->history[i].time)
		break;
	    nextframe = i;
	    i--;
	    if (i == -1)
		i = 999;
	} while (i != cent->hindex);
	scale =
	    ((float) (targtime - cent->history[i].time)) /
	    (float) (cent->history[nextframe].time -
		     cent->history[i].time);
	VectorSubtract(cent->history[nextframe].origin,
		       cent->history[i].origin, diff);
	VectorMA(cent->history[i].origin, scale, diff, diff);
	VectorSubtract(lerp, diff, lerp);
	VectorScale(lerp, veloc_scale, lerp);
	VectorSubtract(cent->vel, lerp, cent->acc);
	cent->acc[0] = cent->acc[1] = 0.0f;
	VectorScale(cent->acc, veloc_scale, cent->acc);

	cent->hindex++;
	if (cent->hindex == 1000)
	    cent->hindex = 0;
		/************************ END VELOCITY EXTRAPOLATION **************************/
    }
}

float A,B,C,D,E;

float func(float t) {
	float tt,ttt,tttt;
	tt=t*t;
	ttt=tt*t;
	tttt=ttt*t;
	return A*tttt+B*ttt+C*tt+D*t+E;
}

float func_d(float t) {
	float tt,ttt;
	tt=t*t;
	ttt=tt*t;
	return 4*A*ttt+3*B*tt+2*C*t+D;
}
#define NEWTON_REP 8
int ZT_PredictTarget(centity_t *cent,vec3_t origin)
{
	vec3_t org,fo,ri,up,vel;
	float t,f,a,b,c;
	int i;
	float myping;
	float eping;
	float wepSpeed;
	VectorCopy(cent->vel,vel);
	if( ZT_Aimbot_Unlagged.integer)
		VectorCopy(cent->lerpOrigin,origin);
	else
	{
		//get ping
		myping = 100;//need to find a way
		if (ZT_Aimbot_PingPredict.value != -1.0)
		{
			eping = ZT_Aimbot_PingPredict.value;
		}
		else
		{
			//TODO get ping from scoreboard
			eping = 100;
		}
		VectorMA(cent->lerpOrigin,(myping/1000.0f)*(eping/1000.0f),vel,origin);
	}
	//get weapon speed
	if (ZT_Aimbot_WeaponSpeed.value != -1)
	{
		wepSpeed = ZT_Aimbot_WeaponSpeed.value;
	}
	else
	{
		//TODO need to look for weapon speeds
		wepSpeed = 999;
	}
	if((f=wepSpeed)!=0.0f) {
		VectorCopy(cg.refdef.vieworg,org);
		VectorSubtract(origin,org,org);
		a=vel[0]*vel[0]+vel[1]*vel[1]+vel[2]*vel[2]-f*f;
		b=2.0* (org[0]*vel[0]+
		      org[1]*vel[1]+
		      org[2]*vel[2]);
		c=org[0]*org[0]+org[1]*org[1]+org[2]*org[2];
		//at^2+bt+c = 0
		t=(b*b)-(4*a*c); //determinant
		if(t<=0.0f)
			return -1; //projectile slower than/same speed as player
		t=(-b-sqrt(t))/(2*a);
		A=(cent->acc[2]*cent->acc[2])/4.0;
		B=cent->acc[2]*vel[2];
		C=a+org[2]*cent->acc[2];
		D=b;
		E=c;
		for(i=NEWTON_REP;i>0;i--) t=t-func(t)/func_d(t);
		if(t<0.0f || t>3.0f)
			return -1;
		VectorMA(origin,t,vel,org);
		VectorMA(org,t*t*0.5,cent->acc,org);
		VectorCopy(org,origin);
	}
	AngleVectors(cent->lerpAngles,fo,ri,up);
	//i think this is offset for weapons; i dont think there are any offsets in this game
	//VectorMA(origin,ogcMod->weapons[cg.snap->ps.weapon].v[0],fo,origin);
	//VectorMA(origin,ogcMod->weapons[cg.snap->ps.weapon].v[1],ri,origin);
	//VectorMA(origin,ogcMod->weapons[cg.snap->ps.weapon].v[2],up,origin);
	return 0;
}

void ZT_DoAimbot(vec3_t targ)
{
    vec3_t org, ang;
    float y,p;
    float jerkx,jerky;
    float speed = 1;

    VectorSubtract(targ, cg.refdef.vieworg, org);

    vectoangles( org, ang );
    if (ang[YAW] > 180.0f)
	ang[YAW] -= 360.0f;
    else if (ang[YAW] < -180.0f)
	ang[YAW] += 360.0f;
    if (ang[PITCH] > 180.0f)
	ang[PITCH] -= 360.0f;
    else if (ang[PITCH] < -180.0f)
	ang[PITCH] += 360.0f;

    //AnglesToAxis(ang,cg.refdef.viewaxis);//<------ we are changing the view axis be4 we render; hmm doen't sound like a good idea

    ang[YAW] -= cg.refdefViewAngles[YAW];

    if (ang[YAW] > 180.0f)
	ang[YAW] -= 360.0f;
    else if (ang[YAW] < -180.0f)
	ang[YAW] += 360.0f;

    ang[PITCH] -= cg.refdefViewAngles[PITCH];

    if (ang[PITCH] > 180.0f)
	ang[PITCH] -= 360.0f;
    else if (ang[PITCH] < -180.0f)
	ang[PITCH] += 360.0f;

    y = ang[YAW];
    p = ang[PITCH];
    //Com_Printf("aim: %f %f\n",y,p);

	if (abs(y) > 10)
	{
		jerkx = 10;
	}
	else
	{
		jerkx = 0;
	}
	if (abs(p) > 10)
	{
		jerky = 10;
	}
	else
	{
		jerky = 0;
	}

    if (abs(y) < ZT_Aimbot_CutOff.value)
    {
    	y = 0;
    }
    if (abs(p) < ZT_Aimbot_CutOff.value)
    {
    	p = 0;
    }

	if (y != 0)
	{
		if (y < 0)
			y = -1*(speed+jerkx);
		if (y > 0)
			y = (speed+jerkx);
	}
	if (p != 0)
	{
		if (p < 0)
			p = -1*(speed+jerky);
		if (p > 0)
			p = (speed+jerky);
	}

    trap_ZTMoveAim(&y,&p);
}

void ZT_Aimbot( void )
{
	int i;
	int aimbutton = 0;
	vec3_t temp;

	if (!ZT_Aimbot_Mode.integer)
	{
		return;
	}
	ZT_ClickCheck();

	trap_ZTAimbutton(&aimbutton);
	if (!aimbutton)
	{
		return;
	}

	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		ZT_Extrapolation( &cg_entities[ cg.snap->entities[ i ].number ] );
		ZT_PredictTarget( &cg_entities[ cg.snap->entities[ i ].number ], cg_entities[ cg.snap->entities[ i ].number ].predictedOrigin );
	}

	ZT_GetTarget();
	//Com_Printf("targ: %i : %s\n",ZT_Targ(),cgs.clientinfo[cg_entities[ZT_Targ()].currentState.clientNum].name);
	if (ZT_Targ() == -1)
	{
		return;
	}
	if ( cg_entities[ZT_Targ()].currentState.eFlags & EF_DEAD )
		return;

	VectorCopy(cg_entities[ZT_Targ()].predictedOrigin,temp);

	if (cg.predictedPlayerState.stats[ STAT_TEAM ] == TEAM_ALIENS)
	{
		temp[2] += 40;
	}
	ZT_DoAimbot(temp);

	return;
}

int clickOn = 0;
int clickStart = -1;
void ZT_ClickCheck( void )
{
	trace_t   trace;
	vec3_t    start, end;
	int       distance = ZT_AttackDistance();
	int i;

	if (clickOn == 0)
		return;

	VectorCopy( cg.refdef.vieworg, start );
	VectorMA( start, distance, cg.refdef.viewaxis[ 0 ], end );

	CG_Trace( &trace, start, vec3_origin, vec3_origin, end,
			cg.snap->ps.clientNum, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_STRUCTURAL );

	//once we hit our target the job is done turn click bot off
	if (ZT_Targ() == trace.entityNum )
	{
		clickOn = 0;
		return;
	}
	//click bot has ran for too long stop it
	if ( (cg.latestSnapshotTime - clickStart) >= 1800 )
	{
		clickOn = 0;
		return;
	}
	if (ZT_Targ() == -1)
	{
		Com_Printf("lost Target\n");
		clickOn = 0;
		return;
	}
	if ( cg_entities[ZT_Targ()].currentState.eFlags & EF_DEAD )
			return;
	for( i = 0; i < cg.snap->numEntities; i++ )
	{
		ZT_Extrapolation( &cg_entities[ cg.snap->entities[ i ].number ] );
		ZT_PredictTarget( &cg_entities[ cg.snap->entities[ i ].number ], cg_entities[ cg.snap->entities[ i ].number ].predictedOrigin );
	}
	ZT_DoAimbot(cg_entities[ZT_Targ()].predictedOrigin);

}
void ZT_ClickBot( void )
{
	Com_Printf("clickBot\n");
	clickOn = !clickOn;
	if (clickOn == 1)
	{
		clickStart = cg.latestSnapshotTime;
	}
}
