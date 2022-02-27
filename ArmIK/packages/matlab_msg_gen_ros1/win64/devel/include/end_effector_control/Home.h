// Generated by gencpp from file end_effector_control/Home.msg
// DO NOT EDIT!


#ifndef END_EFFECTOR_CONTROL_MESSAGE_HOME_H
#define END_EFFECTOR_CONTROL_MESSAGE_HOME_H

#include <ros/service_traits.h>


#include <end_effector_control/HomeRequest.h>
#include <end_effector_control/HomeResponse.h>


namespace end_effector_control
{

struct Home
{

typedef HomeRequest Request;
typedef HomeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Home
} // namespace end_effector_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::end_effector_control::Home > {
  static const char* value()
  {
    return "2489954a46d40c91afe244fac3b4fac9";
  }

  static const char* value(const ::end_effector_control::Home&) { return value(); }
};

template<>
struct DataType< ::end_effector_control::Home > {
  static const char* value()
  {
    return "end_effector_control/Home";
  }

  static const char* value(const ::end_effector_control::Home&) { return value(); }
};


// service_traits::MD5Sum< ::end_effector_control::HomeRequest> should match 
// service_traits::MD5Sum< ::end_effector_control::Home > 
template<>
struct MD5Sum< ::end_effector_control::HomeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::end_effector_control::Home >::value();
  }
  static const char* value(const ::end_effector_control::HomeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::end_effector_control::HomeRequest> should match 
// service_traits::DataType< ::end_effector_control::Home > 
template<>
struct DataType< ::end_effector_control::HomeRequest>
{
  static const char* value()
  {
    return DataType< ::end_effector_control::Home >::value();
  }
  static const char* value(const ::end_effector_control::HomeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::end_effector_control::HomeResponse> should match 
// service_traits::MD5Sum< ::end_effector_control::Home > 
template<>
struct MD5Sum< ::end_effector_control::HomeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::end_effector_control::Home >::value();
  }
  static const char* value(const ::end_effector_control::HomeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::end_effector_control::HomeResponse> should match 
// service_traits::DataType< ::end_effector_control::Home > 
template<>
struct DataType< ::end_effector_control::HomeResponse>
{
  static const char* value()
  {
    return DataType< ::end_effector_control::Home >::value();
  }
  static const char* value(const ::end_effector_control::HomeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // END_EFFECTOR_CONTROL_MESSAGE_HOME_H