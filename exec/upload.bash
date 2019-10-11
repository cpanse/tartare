#!/bin/bash

# Christian Panse <cp@fgz.ethz.ch> 2019-10-11

exit 1
pkg=tartare

for f in 20190716_004_PierceHeLa.raw 20190716_004_PierceHeLa.mzXML 20190710_003_PierceHeLaProteinDigestStd.raw 20190710_003_PierceHeLaProteinDigestStd.raw;
do
    aws --profile AnnotationContributor s3 cp ${f} s3://annotation-contributor/${pkg}/${f} --acl public-read
done
