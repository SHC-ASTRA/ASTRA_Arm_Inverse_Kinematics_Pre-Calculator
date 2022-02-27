#ifndef ARM_RELAY__VISIBILITY_CONTROL_H_
#define ARM_RELAY__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define ARM_RELAY_EXPORT __attribute__ ((dllexport))
    #define ARM_RELAY_IMPORT __attribute__ ((dllimport))
  #else
    #define ARM_RELAY_EXPORT __declspec(dllexport)
    #define ARM_RELAY_IMPORT __declspec(dllimport)
  #endif
  #ifdef ARM_RELAY_BUILDING_LIBRARY
    #define ARM_RELAY_PUBLIC ARM_RELAY_EXPORT
  #else
    #define ARM_RELAY_PUBLIC ARM_RELAY_IMPORT
  #endif
  #define ARM_RELAY_PUBLIC_TYPE ARM_RELAY_PUBLIC
  #define ARM_RELAY_LOCAL
#else
  #define ARM_RELAY_EXPORT __attribute__ ((visibility("default")))
  #define ARM_RELAY_IMPORT
  #if __GNUC__ >= 4
    #define ARM_RELAY_PUBLIC __attribute__ ((visibility("default")))
    #define ARM_RELAY_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define ARM_RELAY_PUBLIC
    #define ARM_RELAY_LOCAL
  #endif
  #define ARM_RELAY_PUBLIC_TYPE
#endif
#endif  // ARM_RELAY__VISIBILITY_CONTROL_H_
// Generated 26-Feb-2022 16:57:27
// Copyright 2019-2020 The MathWorks, Inc.
