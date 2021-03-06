#!/bin/sh
#
# gen_build_info.sh -- creates vr_build_info.c in dp-core/ for dkms
# builds
#
# Copyright (c) 2015, Juniper Networks, Inc.
# All rights reserved
#

build_info_file="$2/dp-core/vr_buildinfo.c"
build_info_header="$2/include/vr_buildinfo.h"

printf "/*\n" > $build_info_file
printf " * Autogenerated file. Do not edit.\n" >> $build_info_file
printf " */\n\n" >> $build_info_file
printf "char *ContrailBuildInfo = \"{\\\"build-info\\\": [{\\\"build-time\\\": \\\"`date`\\\"," >> $build_info_file
printf "\\\"build-hostname\\\": \\\"`hostname`\\\", \\\"build-git-ver\\\": \\\"dkms\\\"," >> $build_info_file
printf "\\\"build-user\\\": \\\"`whoami`\\\", \\\"build-version\\\": \\\"$1-dkms\\\"}]}\";\n" >> $build_info_file

printf "/*\n" > $build_info_header
printf " * Autogenerated file. Do not edit.\n" >> $build_info_header
printf " */\n\n" >> $build_info_header
printf "#ifndef __VR_BUILDINFO_H__\n" >> $build_info_header
printf "#define __VR_BUILDINFO_H__\n" >> $build_info_header
printf "\n" >> $build_info_header
printf "#define VROUTER_VERSIONID \"$1\"\n" >> $build_info_header
printf "\n" >> $build_info_header
printf "#endif /* __VR_BUILDINFO_H__ */\n" >> $build_info_header
