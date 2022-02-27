// Generated by gencpp from file endeffector_controller/ActuatorFeedback.msg
// DO NOT EDIT!


#ifndef ENDEFFECTOR_CONTROLLER_MESSAGE_ACTUATORFEEDBACK_H
#define ENDEFFECTOR_CONTROLLER_MESSAGE_ACTUATORFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace endeffector_controller
{
template <class ContainerAllocator>
struct ActuatorFeedback_
{
  typedef ActuatorFeedback_<ContainerAllocator> Type;

  ActuatorFeedback_()
    : axis(0)
    , angle(0.0)
    , actualRate(0.0)  {
    }
  ActuatorFeedback_(const ContainerAllocator& _alloc)
    : axis(0)
    , angle(0.0)
    , actualRate(0.0)  {
  (void)_alloc;
    }



   typedef int8_t _axis_type;
  _axis_type axis;

   typedef double _angle_type;
  _angle_type angle;

   typedef double _actualRate_type;
  _actualRate_type actualRate;





  typedef boost::shared_ptr< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ActuatorFeedback_

typedef ::endeffector_controller::ActuatorFeedback_<std::allocator<void> > ActuatorFeedback;

typedef boost::shared_ptr< ::endeffector_controller::ActuatorFeedback > ActuatorFeedbackPtr;
typedef boost::shared_ptr< ::endeffector_controller::ActuatorFeedback const> ActuatorFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace endeffector_controller

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'endeffector_controller': ['C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/endeffector_controller/msg'], 'std_msgs': ['C:/Program Files/MATLAB/R2021b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4e86de48d5d451a19d9f7d58a318f00f";
  }

  static const char* value(const ::endeffector_controller::ActuatorFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4e86de48d5d451a1ULL;
  static const uint64_t static_value2 = 0x9d9f7d58a318f00fULL;
};

template<class ContainerAllocator>
struct DataType< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "endeffector_controller/ActuatorFeedback";
  }

  static const char* value(const ::endeffector_controller::ActuatorFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"int8 axis\n"
"float64 angle\n"
"float64 actualRate\n"
;
  }

  static const char* value(const ::endeffector_controller::ActuatorFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.axis);
      stream.next(m.angle);
      stream.next(m.actualRate);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ActuatorFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::endeffector_controller::ActuatorFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::endeffector_controller::ActuatorFeedback_<ContainerAllocator>& v)
  {
    s << indent << "axis: ";
    Printer<int8_t>::stream(s, indent + "  ", v.axis);
    s << indent << "angle: ";
    Printer<double>::stream(s, indent + "  ", v.angle);
    s << indent << "actualRate: ";
    Printer<double>::stream(s, indent + "  ", v.actualRate);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ENDEFFECTOR_CONTROLLER_MESSAGE_ACTUATORFEEDBACK_H
