#!/bin/bash
#WARNING!
#Some of the subordinate scripts execute
##### rm -rf #####
#on all contents in the current directory.

#Please don't mess around with the code carelessly, and realize that realpath may have some glitches with symlinks.

#Regenerate BOM files.
echo -en '\E[1;32;46m Regenerating BOMs... \E[0m'

find . -name genBOM.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./genBOM.sh' \; >& /dev/null

echo -e '\E[1;32;46m done. \E[0m\n'

echo -en '\E[1;32;46m Regenerating oshpark/oshstencil specifications... \E[0m'

#Regerenate oshpark-compatible gerber packages.
find . -name generate-gerbers.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./generate-gerbers.sh' \; > /dev/null

#Regerenate oshpark-compatible gerber packages.
find . -name generate-stencils.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./generate-stencils.sh' \; > /dev/null

echo -e '\E[1;32;46m done. \E[0m\n'

echo -en '\E[1;32;46m Regenerating CAD data... \E[0m'

#Regerenate CAD data.
find . -name generate-cad.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./generate-cad.sh' \; >& /dev/null

echo -e '\E[1;32;46m done. \E[0m\n'

echo -en '\E[1;32;46m Regenerating CNC isolation milling assets, this may take a few minutes... \E[0m'

#Regenerate isolation milling data.
find . -name generate-cnc.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./generate-cnc.sh' \; >& /dev/null

echo -e '\E[1;32;46m done. \E[0m\n'

echo -en '\E[1;32;46m Regenerating photolithography fabrication assets, this may take a few minutes... \E[0m'

#Regerenate photolithography assets.
find . -name generate-photolitho.sh -type f -exec bash -c 'cd $(dirname $(realpath {})) ; ./generate-photolitho.sh' \; >& /dev/null

echo -e '\E[1;32;46m done. \E[0m\n'