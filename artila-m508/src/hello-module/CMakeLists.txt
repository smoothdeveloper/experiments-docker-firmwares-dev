# how to make linux kernel module with cmake
# https://musteresel.github.io/posts/2020/02/cmake-template-linux-kernel-module.html
# https://github.com/enginning/cmake-kernel-module/blob/main/CMakeLists.txt

# note: NOT WORKING YET

set(kernel_module_name hello_module)

# Module info
add_definitions(-D__KERNEL__ -DMODULE)

# Ref:
# https://gitlab.com/christophacham/cmake-kernel-module
# https://gitioc.upc.edu/open-source/xenomai-cmake/blob/master/cmake-modules/FindKernelHeaders.cmake
# https://stackoverflow.com/questions/50877135/cmake-specify-linux-kernel-module-output-build-directory


add_library(${kernel_module_name}
    hello-module.c
)

get_target_property(kernel_module_sources ${kernel_module_name} SOURCES)

message(${kernel_module_sources})
string(REPLACE ";" " " module_sources_string "${kernel_module_sources}")
configure_file(Kbuild.in Kbuild @ONLY)

foreach(src ${kernel_module_sources})
    message("src " ${src})
    configure_file(${src} ${src} COPYONLY)
endforeach()

set(module_cmd ${CMAKE_MAKE_PROGRAM} V=1 ARCH=arm CROSS_COMPILE=arm-linux- -C ${kerneldir} SUBDIRS=${CMAKE_CURRENT_BINARY_DIR})
add_custom_command(OUTPUT ${kernel_module_name}.ko
        COMMAND ${module_cmd} modules
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${kernel_module_sources} ${CMAKE_CURRENT_BINARY_DIR}/Kbuild
        VERBATIM)
add_custom_target(module DEPENDS {kernel_module_name}.ko)
add_custom_target(module-clean COMMAND ${module_cmd} clean)

target_include_directories(${kernel_module_name} PRIVATE "/opt/artila-m508-dev/linux-2.6.x/include")
target_include_directories(${kernel_module_name} PRIVATE "/opt/artila-m508-dev/local3.3.2/arm-linux/sys-include")
#add_compile_definitions(__KERNEL__
#        __LINUX_ARM_ARCH__=4
#        MODULE
#KBUILD_BASENAME=k_attac
#        KBUILD_MODNAME=k_sir
#)
#target_include_directories(sirenium PRIVATE
#        ${LINUX_KERNEL_INCLUDE}
#        ${ARTILA_TOOLCHAIN_INCLUDE}
#)

# -DARTILA_TOOLCHAIN_INCLUDE=/Users/gauthiersegay/dev/src/mecaviv/messing.with.artila/artiladownloads/toolchain/bz2/local3.3.2/arm-linux/sys-include/


# -DLINUX_KERNEL_INCLUDE=/Users/gauthiersegay/dev/src/mecaviv/messing.with.artila/linux-2.6.x/include/ -DARTILA_TOOLCHAIN_INCLUDE=/Users/gauthiersegay/dev/src/mecaviv/messing.with.artila/artiladownloads/toolchain/bz2/local3.3.2/arm-linux/sys-include/
