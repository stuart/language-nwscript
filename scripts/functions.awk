#!/bin/awk -f
{
  if(match($1,"capture")){
    gsub(/"/, "", $NF);
    printf("   {exact: '%s', scopes: 'support.function.nwscript'},\n",$NF)
    }
}
