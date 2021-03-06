// Generated by gencpp from file end_effector_control/HomeResponse.msg
// DO NOT EDIT!


#ifndef END_EFFECTOR_CONTROL_MESSAGE_HOMERESPONSE_H
#define END_EFFECTOR_CONTROL_MESSAGE_HOMERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace end_effector_control
{
template <class ContainerAllocator>
struct HomeResponse_
{
  typedef HomeResponse_<ContainerAllocator> Type;

  HomeResponse_()
    : success(false)  {
    }
  HomeResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::end_effector_control::HomeResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::end_effector_control::HomeResponse_<ContainerAllocator> const> ConstPtr;

}; // struct HomeResponse_

typedef ::end_effector_control::HomeResponse_<std::allocator<void> > HomeResponse;

typedef boost::shared_ptr< ::end_effector_control::HomeResponse > HomeResponsePtr;
typedef boost::shared_ptr< ::end_effector_control::HomeResponse const> HomeResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::end_effector_control::HomeResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::end_effector_control::HomeResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace end_effector_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['C:/Program Files/MATLAB/R2021b/sys/ros1/win64/ros1/share/std_msgs/cmake/../msg'], 'end_effector_control': ['C:/Users/trbin/Documents/GitHub/ASTRA_Arm_Inverse_Kinematics_Pre-Calculator/ArmIK/packages/matlab_msg_gen_ros1/win64/src/end_effector_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::end_effector_control::HomeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::end_effector_control::HomeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::end_effector_control::HomeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::end_effector_control::HomeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::end_effector_control::HomeResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::end_effector_control::HomeResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::end_effector_control::HomeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::end_effector_control::HomeResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::end_effector_control::HomeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "end_effector_control/HomeResponse";
  }

  static const char* value(const ::end_effector_control::HomeResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::end_effector_control::HomeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"bool success\n"
;
  }

  static const char* value(const ::end_effector_control::HomeResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::end_effector_control::HomeResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HomeResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::end_effector_control::HomeResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::end_effector_control::HomeResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // END_EFFECTOR_CONTROL_MESSAGE_HOMERESPONSE_H
