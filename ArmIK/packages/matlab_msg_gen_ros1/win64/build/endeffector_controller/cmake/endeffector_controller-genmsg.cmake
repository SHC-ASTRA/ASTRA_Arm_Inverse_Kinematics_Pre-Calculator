# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "endeffector_controller: 2 messages, 2 services")

set(MSG_I_FLAGS "-Iendeffector_controller:C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg;-Istd_msgs:C:/Program Files/MATLAB/R2021b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(endeffector_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv" NAME_WE)
add_custom_target(_endeffector_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "endeffector_controller" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg" NAME_WE)
add_custom_target(_endeffector_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "endeffector_controller" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg" NAME_WE)
add_custom_target(_endeffector_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "endeffector_controller" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg" ""
)

get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv" NAME_WE)
add_custom_target(_endeffector_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "endeffector_controller" "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
)
_generate_msg_cpp(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
)

### Generating Services
_generate_srv_cpp(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
)
_generate_srv_cpp(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
)

### Generating Module File
_generate_module_cpp(endeffector_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(endeffector_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(endeffector_controller_generate_messages endeffector_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_cpp _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_cpp _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_cpp _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_cpp _endeffector_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(endeffector_controller_gencpp)
add_dependencies(endeffector_controller_gencpp endeffector_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS endeffector_controller_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
)
_generate_msg_py(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
)

### Generating Services
_generate_srv_py(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
)
_generate_srv_py(endeffector_controller
  "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
)

### Generating Module File
_generate_module_py(endeffector_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(endeffector_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(endeffector_controller_generate_messages endeffector_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/EnableServos.srv" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_py _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/JointRateCommand.msg" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_py _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg/ActuatorFeedback.msg" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_py _endeffector_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/srv/Home.srv" NAME_WE)
add_dependencies(endeffector_controller_generate_messages_py _endeffector_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(endeffector_controller_genpy)
add_dependencies(endeffector_controller_genpy endeffector_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS endeffector_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/endeffector_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(endeffector_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller)
  install(CODE "execute_process(COMMAND \"C:/Users/trbin/AppData/Roaming/MathWorks/MATLAB/R2021b/ros1/win64/venv/Scripts/python2.exe\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/endeffector_controller
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(endeffector_controller_generate_messages_py std_msgs_generate_messages_py)
endif()
