# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "arm_relay: 2 messages, 2 services")

set(MSG_I_FLAGS "-Iarm_relay:C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg;-Istd_msgs:C:/Program Files/MATLAB/R2021b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(arm_relay_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv" NAME_WE)
add_custom_target(_arm_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_relay" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg" NAME_WE)
add_custom_target(_arm_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_relay" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg" NAME_WE)
add_custom_target(_arm_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_relay" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv" NAME_WE)
add_custom_target(_arm_relay_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arm_relay" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
)
_generate_msg_cpp(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
)

### Generating Services
_generate_srv_cpp(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
)
_generate_srv_cpp(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
)

### Generating Module File
_generate_module_cpp(arm_relay
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(arm_relay_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(arm_relay_generate_messages arm_relay_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv" NAME_WE)
add_dependencies(arm_relay_generate_messages_cpp _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(arm_relay_generate_messages_cpp _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(arm_relay_generate_messages_cpp _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv" NAME_WE)
add_dependencies(arm_relay_generate_messages_cpp _arm_relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arm_relay_gencpp)
add_dependencies(arm_relay_gencpp arm_relay_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arm_relay_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
)
_generate_msg_py(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
)

### Generating Services
_generate_srv_py(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
)
_generate_srv_py(arm_relay
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
)

### Generating Module File
_generate_module_py(arm_relay
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(arm_relay_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(arm_relay_generate_messages arm_relay_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/HomeArmBase.srv" NAME_WE)
add_dependencies(arm_relay_generate_messages_py _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(arm_relay_generate_messages_py _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(arm_relay_generate_messages_py _arm_relay_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/arm_relay/srv/EnableActuators.srv" NAME_WE)
add_dependencies(arm_relay_generate_messages_py _arm_relay_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arm_relay_genpy)
add_dependencies(arm_relay_genpy arm_relay_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arm_relay_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arm_relay
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(arm_relay_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay)
  install(CODE "execute_process(COMMAND \"C:/Users/trbin/AppData/Roaming/MathWorks/MATLAB/R2021b/ros1/win64/venv/Scripts/python2.exe\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arm_relay
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(arm_relay_generate_messages_py std_msgs_generate_messages_py)
endif()
