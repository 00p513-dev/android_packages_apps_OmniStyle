#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_STATIC_ANDROID_LIBRARIES := androidx.core_core \
    androidx.cardview_cardview \
    androidx.recyclerview_recyclerview \
    androidx.gridlayout_gridlayout

LOCAL_STATIC_JAVA_LIBRARIES := lib-picasso-target

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_USE_AAPT2 := true

LOCAL_AAPT_FLAGS := --auto-add-overlay

LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_PACKAGE_NAME := OmniStyle
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_PRIVATE_PLATFORM_APIS := true
LOCAL_PROGUARD_FLAG_FILES := proguard.flags

include packages/apps/OmniLib/common.mk

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := lib-picasso:libs/picasso-2.5.2.jar
include $(BUILD_HOST_PREBUILT)

# Enumerate target prebuilts to avoid linker warnings
include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := lib-picasso-target
LOCAL_SRC_FILES := libs/picasso-2.5.2.jar
LOCAL_UNINSTALLABLE_MODULE := true

include $(BUILD_PREBUILT)
