/*
 * ZT_Command.c
 *
 *  Created on: Oct 23, 2010
 *      Author: john
 *
 */

#include "cg_local.h"
//commands
typedef struct ZT_cmd_s{
	char  *cmd;
	void  (*function)( void );
}ZT_cmd_t;

//variables
typedef struct ZT_var_s{
	char *name;
	char *type;
	void *var;
}ZT_var_t;

int testvar;
void testcmd( void ){
	return;
}

static ZT_cmd_t ztcommands[ ] = {
		{ "testcmd", &testcmd },
		{ "Clickbot", &ZT_ClickBot },
		{ "rtd", &ZT_RTDChangeState}
};

static ZT_var_t ztvariables[ ] = {
		{ "testvar", "int", &testvar }
};

qboolean ZT_EchoVar( void ){
	char buffer[1024];
	int i;
	const char *cmd;

	cmd = CG_Argv( 1 );
	for (i = 0; i < sizeof( ztvariables ) / sizeof( ztvariables[ 0 ] ); i++){
		if (!Q_stricmp(cmd, ztvariables[i].name)){
			if ( !Q_stricmp( ztvariables[i].type, "int" ) )
			{
				Com_sprintf(buffer,MAX_STRING_CHARS, "%s:int: %i\n", ztvariables[i].name, *(int *)ztvariables[i].var);
				trap_Print(buffer);
				return qtrue;
			}
			else if ( !Q_stricmp( ztvariables[i].type, "char" ) )
			{
				Com_sprintf(buffer,MAX_STRING_CHARS, "%s:char*: %s\n", ztvariables[i].name, (char *)ztvariables[i].var);
				trap_Print(buffer);
				return qtrue;
			}
			else{return qfalse;}//no other conversions
		}
	}
	return qfalse;
}
qboolean ZT_SetVar( void ){
	const char *cmd;
	int i;
	int temp;
	cmd = CG_Argv( 1 );
	for (i = 0; i < sizeof( ztvariables ) / sizeof( ztvariables[ 0 ] ); i++){
		if (!Q_stricmp(cmd, ztvariables[i].name)){
			if ( !Q_stricmp( ztvariables[i].type, "int" ) )
			{
				cmd = CG_Argv( 2 );
				temp = atoi( cmd );
				memcpy( ztvariables[i].var, &temp,sizeof(int) );
				return qtrue;
			}
			if ( !Q_stricmp( ztvariables[i].type, "char" ) )
			{
				cmd = CG_Argv( 2 );
				memcpy( ztvariables[i].var, cmd, strlen( cmd ) );
				return qtrue;
			}
			else{return qfalse;}//no other conversions
		}
	}
	return qfalse;

}
qboolean ZT_Cmd( void ){
	const char *cmd;
	int i;
	float temp, temp2;
	int temp3;
	cmd = CG_Argv( 1 );
	for (i = 0; i < sizeof( ztcommands ) / sizeof( ztcommands[ 0 ] ); i++){
		if (!Q_stricmp(cmd, "testsmooth"))
		{
			cmd = CG_Argv( 2 );
			temp = (float) atoi( cmd );
			cmd = CG_Argv( 3 );
			temp2 = (float) atoi( cmd );
			CG_Printf("temp: %f\n temp2: %f\n",temp,temp2);
			trap_SetSmooth( &temp, &temp2);
			return qtrue;
		}
		if (!Q_stricmp(cmd,ztcommands[i].cmd)){
			ztcommands[i].function();
			return qtrue;
		}
	}
	return qfalse;

}
qboolean ZT_Command( void )
{
	const char  *cmd;
	qboolean r = qfalse;

	cmd = CG_Argv( 0 );
	if ( !Q_stricmp( cmd, "ZTcmd" ) )
	{
		r = ZT_Cmd();
		if ( r == qfalse )
		{
			trap_Print("ZTcmd command formated wrong or does not exits\n");
		}
	}
	else if ( !Q_stricmp( cmd, "ZTsetvar" ) )
	{
		r = ZT_SetVar();
		if ( r == qfalse )
		{
			trap_Print("ZTsetvar command formated wrong or does not exist\n");
		}
	}
	else if ( !Q_stricmp( cmd, "ZTechovar" ) )
	{
		r = ZT_EchoVar();
		if ( r == qfalse )
		{
			trap_Print("ZTechovar command formated wrong or does not exist\n");
		}
	}
	else if ( !Q_stricmp( cmd, "ZThelp" ) )
	{
		//need to add someday
	}
	else if ( !Q_stricmp( cmd, "leet" ) )
	{
		ZT_ToLeet( );
	}
	return r;
}
