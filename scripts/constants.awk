#!/bin/awk -f
{
  if(match($1,"capture")){
    gsub(/"/, "", $NF);
    printf("   {exact: '%s', scopes: 'builtin.constant.nwscript'},\n",$NF)
    }
}
