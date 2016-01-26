#!/bin/sh -e

PREFIX="$1"

rm -rf "${PREFIX}"/bin "${PREFIX}"/lib "${PREFIX}"/man

sed -i bak -e 's|OCAMLDIR|'${PREFIX}'|g' ocamloptrev

sed -i junk -e '1 s|^.*$|#!'${PREFIX}'/bin/ocamlrun|g' bin/ocamlopt

mv bin "${PREFIX}"
cp ocamloptrev "${PREFIX}"/bin
# cp wrapped "${PREFIX}"/bin/ocamlopt
mv lib "${PREFIX}"
mv man "${PREFIX}"
