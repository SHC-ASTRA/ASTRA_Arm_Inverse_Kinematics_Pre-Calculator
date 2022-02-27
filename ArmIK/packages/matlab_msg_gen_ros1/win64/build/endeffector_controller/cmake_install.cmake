# Install script for directory: C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller/msg" TYPE FILE FILES
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg"
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller/srv" TYPE FILE FILES
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv"
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller/cmake" TYPE FILE FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/build/endeffector_controller/catkin_generated/installspace/endeffector_controller-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/devel/include/endeffector_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "C:/Users/trbin/AppData/Roaming/MathWorks/MATLAB/R2021b/ros1/win64/venv/Scripts/python2.exe" -m compileall "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/devel/lib/site-packages/endeffector_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/site-packages" TYPE DIRECTORY FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/devel/lib/site-packages/endeffector_controller")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/build/endeffector_controller/catkin_generated/installspace/endeffector_controller.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller/cmake" TYPE FILE FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/build/endeffector_controller/catkin_generated/installspace/endeffector_controller-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller/cmake" TYPE FILE FILES
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/build/endeffector_controller/catkin_generated/installspace/endeffector_controllerConfig.cmake"
    "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/build/endeffector_controller/catkin_generated/installspace/endeffector_controllerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/endeffector_controller" TYPE FILE FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/devel/lib/endeffector_controller_matlab.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/devel/bin/endeffector_controller_matlab.dll")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

