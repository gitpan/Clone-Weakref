use 5.006;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
    'NAME'            =>    'Clone::Weakref',
    'VERSION_FROM'    =>    'lib/Clone/Weakref.pm',     # finds $VERSION
    'INSTALLDIRS'     =>    'site',
    'PREREQ_PM'       =>    { # e.g. Module::Name => 1.1
        'Data::Dumper'	=> 2.121,
        'Scalar::Util'	=> 1.01, # for weaken(), isweak()
        'Test::More'	=> 0,
    },         
    'LIBS'            =>    [''],         # e.g. '-lm'
    # 'DEFINE'        =>    '-DCLONE_WEAKREF_DEBUG',
    # 'DEFINE'        =>    '-DCLONE_WEAKREF_CLONE_DEBUG',
    # 'OPTIMIZE'      =>    '-g',
    # 'OPTIMIZE'      =>    '-pg',
    'OPTIMIZE'        =>    '-O3',
    'INC'             =>    ''         # e.g. '-I/usr/include/other'
);
