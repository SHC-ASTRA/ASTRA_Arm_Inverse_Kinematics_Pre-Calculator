# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "end_effector_control: 2 messages, 2 services")

set(MSG_I_FLAGS "-Iend_effector_control:C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg;-Istd_msgs:C:/Program Files/MATLAB/R2021b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(end_effector_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv" NAME_WE)
add_custom_target(_end_effector_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "end_effector_control" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg" NAME_WE)
add_custom_target(_end_effector_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "end_effector_control" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv" NAME_WE)
add_custom_target(_end_effector_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "end_effector_control" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg" NAME_WE)
add_custom_target(_end_effector_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "end_effector_control" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
)
_generate_msg_cpp(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
)

### Generating Services
_generate_srv_cpp(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
)
_generate_srv_cpp(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
)

### Generating Module File
_generate_module_cpp(end_effector_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(end_effector_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(end_effector_control_generate_messages end_effector_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv" NAME_WE)
add_dependencies(end_effector_control_generate_messages_cpp _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(end_effector_control_generate_messages_cpp _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv" NAME_WE)
add_dependencies(end_effector_control_generate_messages_cpp _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(end_effector_control_generate_messages_cpp _end_effector_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(end_effector_control_gencpp)
add_dependencies(end_effector_control_gencpp end_effector_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS end_effector_control_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
)
_generate_msg_py(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
)

### Generating Services
_generate_srv_py(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
)
_generate_srv_py(end_effector_control
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
)

### Generating Module File
_generate_module_py(end_effector_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(end_effector_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(end_effector_control_generate_messages end_effector_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/EnableServos.srv" NAME_WE)
add_dependencies(end_effector_control_generate_messages_py _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(end_effector_control_generate_messages_py _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/srv/Home.srv" NAME_WE)
add_dependencies(end_effector_control_generate_messages_py _end_effector_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(end_effector_control_generate_messages_py _end_effector_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(end_effector_control_genpy)
add_dependencies(end_effector_control_genpy end_effector_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS end_effector_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/end_effector_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(end_effector_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control)
  install(CODE "execute_process(COMMAND \"C:/Users/trbin/AppData/Roaming/MathWorks/MATLAB/R2021b/ros1/win64/venv/Scripts/python2.exe\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/end_effector_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(end_effector_control_generate_messages_py std_msgs_generate_messages_py)
endif()
