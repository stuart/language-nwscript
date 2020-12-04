#!/bin/sh

# Pulls all the constant and function definitions from nwscript.nss
# Puts them into the files noted.
# You may have to change the NWSCRIPT_PATH hardcoded in here to suit.
NWSCRIPT_PATH=~/Library/Application\ Support/Steam/steamapps/common/Neverwinter\ Nights/ovr/nwscript.nss

GRAMMAR_FILE=./grammars/nwscript.cson
CONSTANTS_FILE=./scripts/nwscript_constants.js
FUNCTIONS_FILE=./scripts/nwscript_functions.js

# Get all the constants
##tree-sitter query ./queries/nwscript_constants.scm "${NWSCRIPT_PATH}" |
##  awk -f ./scripts/constants.awk > ${CONSTANTS_FILE}

# Get all the functions
tree-sitter query ./queries/nwscript_functions.scm "${NWSCRIPT_PATH}" |
awk -f ./scripts/functions.awk > ${FUNCTIONS_FILE}

# Clean up the grammar file from previous runs.
sed -i .backup '/START_AUTOGENERATED_CONTENT/,/END_AUTOGENERATED_CONTENT/d' $GRAMMAR_FILE

# Write all the stuff to the grammar file.
echo "#START_AUTOGENERATED_CONTENT" >> $GRAMMAR_FILE
echo " 'identifier' : [\n" >> $GRAMMAR_FILE
cat $FUNCTIONS_FILE >> $GRAMMAR_FILE
echo "   {match: '[a-zA-Z_][a-zA-Z0-9_]*', scopes: 'variable'}" >> $GRAMMAR_FILE
echo "  ]\n #END_AUTOGENERATED_CONTENT" >> $GRAMMAR_FILE
