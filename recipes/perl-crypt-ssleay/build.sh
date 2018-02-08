#!/bin/bash

# If it has Build.PL use that, otherwise use Makefile.PL
if [ -f Build.PL ]; then
    #perl Build.PL
    #./Build
    #./Build test
    # Make sure this goes in site
    #./Build install --installdirs site
    echo 'A Build.PL is found...but MakeFile is better.'
elif [ -f Makefile.PL ]; then
    # Make sure this goes in site
    perl Makefile.PL --incpath=$ENV{OPENSSL_INCLUDE} --libpath=$ENV{OPENSSL_LIB}
    echo '* * * make...'
    make
    echo '* * * make test...'
    make test
    echo '* * * make install...'
    make install
    echo 'End of makeFile...'
else
    echo 'Unable to find Build.PL or Makefile.PL. You need to modify build.sh.'
    exit 1
fi

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
