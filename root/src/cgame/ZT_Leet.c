/*
 * ZT_Leet.c
 *
 *  Created on: May 13, 2011
 *      Author: john
 *
 *      leet speak converter
 *      	--one way for now
 *
 *      TODO: add a check so the varable leet does not overload
 */
#include "cg_local.h"

void ZT_ToLeet( void )
{
	int leetsize = 0;
	char leet[1024];
	char a[1024];
	int numargs = trap_Argc();
	int i, j;
	int arglen;

	leet[leetsize] = 's';
	leetsize ++;
	leet[leetsize] = 'a';
	leetsize ++;
	leet[leetsize] = 'y';
	leetsize ++;
	leet[leetsize] = ' ';
	leetsize ++;


	for (i=1; i < numargs; i++)
	{
		strncpy(a, CG_Argv( i ), 1024);
		arglen = strlen(a);
		for (j=0;j<arglen;j++)
		{
			switch(a[j])
			{
			case 'A':
				leet[leetsize] = '4';
				leetsize ++;
				break;
			case 'B':
				leet[leetsize] = '8';
				leetsize ++;
				break;
			case 'C':
				leet[leetsize] = '<';
				leetsize ++;
				break;
			case 'D':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = ')';
				leetsize ++;
				break;
			case 'E':
				leet[leetsize] = '3';
				leetsize ++;
				break;
			case 'F':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '=';
				leetsize ++;
				break;
			case 'G':
				leet[leetsize] = '6';
				leetsize ++;
				break;
			case 'H':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '-';
				leetsize ++;
				leet[leetsize] = '|';
				leetsize ++;
				break;
			case 'I':
				leet[leetsize] = '!';
				leetsize ++;
				break;
			case 'J':
				leet[leetsize] = '_';
				leetsize ++;
				leet[leetsize] = '|';
				leetsize ++;
				break;
			case 'K':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '<';
				leetsize ++;
				break;
			case 'L':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '_';
				leetsize ++;
				break;
			case 'M':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = 'v';
				leetsize ++;
				leet[leetsize] = '|';
				leetsize ++;
				break;
			case 'N':
				leet[leetsize] = '/';
				leetsize ++;
				leet[leetsize] = '\\';
				leetsize ++;
				leet[leetsize] = '/';
				leetsize ++;
				break;
			case 'O':
				leet[leetsize] = '0';
				leetsize ++;
				break;
			case 'P':
				leet[leetsize] = '9';
				leetsize ++;
				break;
			case 'Q':
				leet[leetsize] = '(';
				leetsize ++;
				leet[leetsize] = ',';
				leetsize ++;
				leet[leetsize] = ')';
				leetsize ++;
				break;
			case 'R':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '2';
				leetsize ++;
				break;
			case 'S':
				leet[leetsize] = '5';
				leetsize ++;
				break;
			case 'T':
				leet[leetsize] = '7';
				leetsize ++;
				break;
			case 'U':
				leet[leetsize] = '|';
				leetsize ++;
				leet[leetsize] = '_';
				leetsize ++;
				leet[leetsize] = '|';
				leetsize ++;
				break;
			case 'V':
				leet[leetsize] = '\\';
				leetsize ++;
				leet[leetsize] = '/';
				leetsize ++;
				break;
			case 'W':
				leet[leetsize] = '\\';
				leetsize ++;
				leet[leetsize] = '/';
				leetsize ++;
				leet[leetsize] = '\\';
				leetsize ++;
				leet[leetsize] = '/';
				leetsize ++;
				break;
			case 'X':
				leet[leetsize] = '>';
				leetsize ++;
				leet[leetsize] = '<';
				leetsize ++;
				break;
			case 'Y':
				leet[leetsize] = 'y';
				leetsize ++;
				break;
			case 'Z':
				leet[leetsize] = '2';
				leetsize ++;
				break;
			default:
				leet[leetsize] = a[j];
				leetsize ++;
				break;
			}
		}
		//space between each arg
		leet[leetsize] = ' ';
		leetsize ++;
	}
	leet[leetsize] = 0;

	trap_SendConsoleCommand( leet );

}
