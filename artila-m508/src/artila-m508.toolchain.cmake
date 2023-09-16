# the name of the target operating system
set(CMAKE_SYSTEM_NAME Linux)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   arm-linux-gcc)
set(CMAKE_CXX_COMPILER arm-linux-g++)

# where is the target environment located
set(CMAKE_FIND_ROOT_PATH  /usr/local/arm-linux/)

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

function(set_path_if_not_defined_or_empty varname defaultvalue docstring)
    if(NOT DEFINED "${varname}"  OR ("${${varname}}" EQUAL ""))
        message("CMAKE PATH variable not defined: ${varname} -> setting to ${defaultvalue}")
        set(${varname} ${defaultvalue} CACHE PATH ${docstring})
    else()
        message("CMAKE PATH variable ${varname}: " ${${varname}})
    endif()
endfunction()

function(set_string_if_not_defined_or_empty varname defaultvalue docstring)
    if(NOT DEFINED "${varname}"  OR ("${${varname}}" EQUAL ""))
        message("CMAKE STRING variable not defined: ${varname} -> setting to ${defaultvalue}")
        set(${varname} ${defaultvalue} CACHE STRING ${docstring})
    else()
        message("CMAKE STRING variable ${varname}: " ${${varname}})
    endif()
endfunction()

set_path_if_not_defined_or_empty(LINUX_KERNEL_SOURCE_PATH "/opt/artila-m508-dev/linux-2.6.x" "path to the linux kernel source (e.g. /opt/artila-m508-dev/linux-2.6.x)")
set_path_if_not_defined_or_empty(CROSS_COMPILE_TOOLCHAIN_PATH "/opt/artila-m508-dev/local3.3.2" "path to the cross compilation toolchain (e.g. /opt/artila-m508-dev/local3.3.2)")

set_string_if_not_defined_or_empty(MAKE_ARCH "arm" "parameter for make: ARCH= (e.g. arm)")
set_string_if_not_defined_or_empty(MAKE_CROSS_COMPILE "arm-linux-" "parameter for make: CROSS_COMPILE= (e.g. arm-linux-)")

set(kerneldir "/opt/artila-m508-dev/linux-2.6.x/" CACHE STRING "Path to the kernel build directory")

# making sure to specify NO_CMAKE_FIND_ROOT_PATH:
# https://gitlab.kitware.com/cmake/cmake/-/issues/17383
find_file(kernel_makefile NAMES Makefile PATHS ${LINUX_KERNEL_SOURCE_PATH} NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
if(NOT kernel_makefile)
    execute_process(COMMAND "ls" "-la" ${LINUX_KERNEL_SOURCE_PATH} RESULT_VARIABLE ls)
    message(FATAL_ERROR "There is no Makefile in ${LINUX_KERNEL_SOURCE_PATH}!")
endif()
