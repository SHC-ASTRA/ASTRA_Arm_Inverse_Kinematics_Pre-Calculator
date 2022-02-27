#ifndef END_EFFECTOR_CONTROL__VISIBILITY_CONTROL_H_
#define END_EFFECTOR_CONTROL__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define END_EFFECTOR_CONTROL_EXPORT __attribute__ ((dllexport))
    #define END_EFFECTOR_CONTROL_IMPORT __attribute__ ((dllimport))
  #else
    #define END_EFFECTOR_CONTROL_EXPORT __declspec(dllexport)
    #define END_EFFECTOR_CONTROL_IMPORT __declspec(dllimport)
  #endif
  #ifdef END_EFFECTOR_CONTROL_BUILDING_LIBRARY
    #define END_EFFECTOR_CONTROL_PUBLIC END_EFFECTOR_CONTROL_EXPORT
  #else
    #define END_EFFECTOR_CONTROL_PUBLIC END_EFFECTOR_CONTROL_IMPORT
  #endif
  #define END_EFFECTOR_CONTROL_PUBLIC_TYPE END_EFFECTOR_CONTROL_PUBLIC
  #define END_EFFECTOR_CONTROL_LOCAL
#else
  #define END_EFFECTOR_CONTROL_EXPORT __attribute__ ((visibility("default")))
  #define END_EFFECTOR_CONTROL_IMPORT
  #if __GNUC__ >= 4
    #define END_EFFECTOR_CONTROL_PUBLIC __attribute__ ((visibility("default")))
    #define END_EFFECTOR_CONTROL_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define END_EFFECTOR_CONTROL_PUBLIC
    #define END_EFFECTOR_CONTROL_LOCAL
  #endif
  #define END_EFFECTOR_CONTROL_PUBLIC_TYPE
#endif
#endif  // END_EFFECTOR_CONTROL__VISIBILITY_CONTROL_H_
// Generated 26-Feb-2022 16:57:28
// Copyright 2019-2020 The MathWorks, Inc.
