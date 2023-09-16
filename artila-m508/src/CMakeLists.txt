# note: when using CLion, if you get "cc1: error: unrecognized option `-fpch-preprocess'" follow those instructions:
# https://youtrack.jetbrains.com/issue/CPP-14437/Could-not-use-clion-for-remote-deploy-build-with-non-gcc-compiler-due-to-hardcoded-flag.?IssueComments
cmake_minimum_required(VERSION 3.20)

project(artila-m508-samples)

add_subdirectory(hello)
add_subdirectory(hello-module)