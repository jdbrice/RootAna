#!python
import subprocess
import os

env = Environment()

ROOTCFLAGS    	= subprocess.check_output( ['root-config',  '--cflags'] ).rstrip().decode( "utf-8" ).split( " " )
ROOTLDFLAGS    	= subprocess.check_output( ["root-config",  "--ldflags"] ).decode( "utf-8" )
ROOTLIBS      	= subprocess.check_output( ["root-config",  "--libs"] ).decode( "utf-8" )
ROOTGLIBS     	= subprocess.check_output( ["root-config",  "--glibs"] ).decode( "utf-8" )
ROOTLIBPATH 	= subprocess.check_output( ["root-config", "--libdir" ] ).decode( "utf-8" )
ROOT_SYS 		= os.environ[ "ROOTSYS" ]

cppDefines 		= {}
cppFlags 		= ['-Wall' ]#, '-Werror']
cxxFlags 		= ['-std=c++11', '-O3' ]
cxxFlags.extend( ROOTCFLAGS )

paths 			= [ '.', 			# dont really like this but ended up needing for root dict to work ok
					'include', 
					'/usr/local/include/XmlConfig',
					'/usr/local/include/RooPlotLib',
					'/usr/local/include/TaskEngine',
					ROOT_SYS + "/include"
					]
# paths.extend( Glob( "include/*" ) )


########################## Project Target #####################################
common_env = env.Clone()
common_env.Append(CPPDEFINES 	= cppDefines)
common_env.Append(CPPFLAGS 		= cppFlags)
common_env.Append(CXXFLAGS 		= cxxFlags)
common_env.Append(LINKFLAGS 	= cxxFlags ) 
common_env.Append(CPPPATH		= paths)

common_env[ "_LIBFLAGS" ] = common_env[ "_LIBFLAGS" ] + " " + ROOTLIBS + " " 


jdb_log_level = ARGUMENTS.get( "ll", 10 )
common_env.Append(CXXFLAGS 		= "-DJDB_LOG_LEVEL=" + str(jdb_log_level) )

target = common_env.StaticLibrary( target='RootAna', source=[ Glob( "*.cpp" ) ] )

# Install the Header files and lib file:
install = [
    common_env.Install( '/usr/local/include/RootAna/', [Glob("*.h")] ),
    common_env.Install( '/usr/local/lib', [Glob("*.a")] ) 
]


# set as the default target
Default( target, install )