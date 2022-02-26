// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for arm_relay/EnableActuatorsRequest
#include "boost/date_time.hpp"
#include "boost/shared_array.hpp"
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4244)
#pragma warning(disable : 4265)
#pragma warning(disable : 4458)
#pragma warning(disable : 4100)
#pragma warning(disable : 4127)
#pragma warning(disable : 4267)
#pragma warning(disable : 4068)
#pragma warning(disable : 4245)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#endif //_MSC_VER
#include "ros/ros.h"
#include "arm_relay/EnableActuators.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class ARM_RELAY_EXPORT arm_relay_msg_EnableActuatorsRequest_common : public MATLABROSMsgInterface<arm_relay::EnableActuators::Request> {
  public:
    virtual ~arm_relay_msg_EnableActuatorsRequest_common(){}
    virtual void copy_from_struct(arm_relay::EnableActuators::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const arm_relay::EnableActuators::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void arm_relay_msg_EnableActuatorsRequest_common::copy_from_struct(arm_relay::EnableActuators::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //enable
        const matlab::data::TypedArray<bool> enable_arr = arr["Enable"];
        msg->enable = enable_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Enable' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Enable' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T arm_relay_msg_EnableActuatorsRequest_common::get_arr(MDFactory_T& factory, const arm_relay::EnableActuators::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Enable"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("arm_relay/EnableActuatorsRequest");
    // enable
    auto currentElement_enable = (msg + ctr)->enable;
    outArray[ctr]["Enable"] = factory.createScalar(static_cast<bool>(currentElement_enable));
    }
    return std::move(outArray);
  }
class ARM_RELAY_EXPORT arm_relay_msg_EnableActuatorsResponse_common : public MATLABROSMsgInterface<arm_relay::EnableActuators::Response> {
  public:
    virtual ~arm_relay_msg_EnableActuatorsResponse_common(){}
    virtual void copy_from_struct(arm_relay::EnableActuators::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const arm_relay::EnableActuators::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void arm_relay_msg_EnableActuatorsResponse_common::copy_from_struct(arm_relay::EnableActuators::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //enabled
        const matlab::data::TypedArray<bool> enabled_arr = arr["Enabled"];
        msg->enabled = enabled_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Enabled' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Enabled' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T arm_relay_msg_EnableActuatorsResponse_common::get_arr(MDFactory_T& factory, const arm_relay::EnableActuators::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Enabled"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("arm_relay/EnableActuatorsResponse");
    // enabled
    auto currentElement_enabled = (msg + ctr)->enabled;
    outArray[ctr]["Enabled"] = factory.createScalar(static_cast<bool>(currentElement_enabled));
    }
    return std::move(outArray);
  } 
class ARM_RELAY_EXPORT arm_relay_EnableActuators_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~arm_relay_EnableActuators_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          arm_relay_EnableActuators_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<arm_relay::EnableActuators::Request,arm_relay_msg_EnableActuatorsRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<arm_relay::EnableActuators::Response,arm_relay_msg_EnableActuatorsResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          arm_relay_EnableActuators_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<arm_relay::EnableActuators::Request,arm_relay::EnableActuators::Request::ConstPtr,arm_relay_msg_EnableActuatorsRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<arm_relay::EnableActuators::Response,arm_relay::EnableActuators::Response::ConstPtr,arm_relay_msg_EnableActuatorsResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          arm_relay_EnableActuators_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<arm_relay::EnableActuators::Request,arm_relay::EnableActuators::Response,arm_relay_msg_EnableActuatorsRequest_common,arm_relay_msg_EnableActuatorsResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          arm_relay_EnableActuators_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<arm_relay::EnableActuators,arm_relay::EnableActuators::Request,arm_relay::EnableActuators::Response,arm_relay_msg_EnableActuatorsRequest_common,arm_relay_msg_EnableActuatorsResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          arm_relay_EnableActuators_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<arm_relay::EnableActuators::Request,arm_relay_msg_EnableActuatorsRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<arm_relay::EnableActuators::Response,arm_relay_msg_EnableActuatorsResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(arm_relay_msg_EnableActuatorsRequest_common, MATLABROSMsgInterface<arm_relay::EnableActuators::Request>)
CLASS_LOADER_REGISTER_CLASS(arm_relay_msg_EnableActuatorsResponse_common, MATLABROSMsgInterface<arm_relay::EnableActuators::Response>)
CLASS_LOADER_REGISTER_CLASS(arm_relay_EnableActuators_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
