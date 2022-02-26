// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for arm_relay/HomeArmBaseRequest
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
#include "arm_relay/HomeArmBase.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class ARM_RELAY_EXPORT arm_relay_msg_HomeArmBaseRequest_common : public MATLABROSMsgInterface<arm_relay::HomeArmBase::Request> {
  public:
    virtual ~arm_relay_msg_HomeArmBaseRequest_common(){}
    virtual void copy_from_struct(arm_relay::HomeArmBase::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const arm_relay::HomeArmBase::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void arm_relay_msg_HomeArmBaseRequest_common::copy_from_struct(arm_relay::HomeArmBase::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T arm_relay_msg_HomeArmBaseRequest_common::get_arr(MDFactory_T& factory, const arm_relay::HomeArmBase::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Home"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("arm_relay/HomeArmBaseRequest");
    // home
    auto currentElement_home = (msg + ctr)->home;
    outArray[ctr]["Home"] = factory.createScalar(static_cast<bool>(currentElement_home));
    }
    return std::move(outArray);
  }
class ARM_RELAY_EXPORT arm_relay_msg_HomeArmBaseResponse_common : public MATLABROSMsgInterface<arm_relay::HomeArmBase::Response> {
  public:
    virtual ~arm_relay_msg_HomeArmBaseResponse_common(){}
    virtual void copy_from_struct(arm_relay::HomeArmBase::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const arm_relay::HomeArmBase::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void arm_relay_msg_HomeArmBaseResponse_common::copy_from_struct(arm_relay::HomeArmBase::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //success
        const matlab::data::TypedArray<bool> success_arr = arr["Success"];
        msg->success = success_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Success' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Success' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T arm_relay_msg_HomeArmBaseResponse_common::get_arr(MDFactory_T& factory, const arm_relay::HomeArmBase::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Success"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("arm_relay/HomeArmBaseResponse");
    // success
    auto currentElement_success = (msg + ctr)->success;
    outArray[ctr]["Success"] = factory.createScalar(static_cast<bool>(currentElement_success));
    }
    return std::move(outArray);
  } 
class ARM_RELAY_EXPORT arm_relay_HomeArmBase_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~arm_relay_HomeArmBase_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          arm_relay_HomeArmBase_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<arm_relay::HomeArmBase::Request,arm_relay_msg_HomeArmBaseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<arm_relay::HomeArmBase::Response,arm_relay_msg_HomeArmBaseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          arm_relay_HomeArmBase_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<arm_relay::HomeArmBase::Request,arm_relay::HomeArmBase::Request::ConstPtr,arm_relay_msg_HomeArmBaseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<arm_relay::HomeArmBase::Response,arm_relay::HomeArmBase::Response::ConstPtr,arm_relay_msg_HomeArmBaseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          arm_relay_HomeArmBase_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<arm_relay::HomeArmBase::Request,arm_relay::HomeArmBase::Response,arm_relay_msg_HomeArmBaseRequest_common,arm_relay_msg_HomeArmBaseResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          arm_relay_HomeArmBase_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<arm_relay::HomeArmBase,arm_relay::HomeArmBase::Request,arm_relay::HomeArmBase::Response,arm_relay_msg_HomeArmBaseRequest_common,arm_relay_msg_HomeArmBaseResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          arm_relay_HomeArmBase_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<arm_relay::HomeArmBase::Request,arm_relay_msg_HomeArmBaseRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<arm_relay::HomeArmBase::Response,arm_relay_msg_HomeArmBaseResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(arm_relay_msg_HomeArmBaseRequest_common, MATLABROSMsgInterface<arm_relay::HomeArmBase::Request>)
CLASS_LOADER_REGISTER_CLASS(arm_relay_msg_HomeArmBaseResponse_common, MATLABROSMsgInterface<arm_relay::HomeArmBase::Response>)
CLASS_LOADER_REGISTER_CLASS(arm_relay_HomeArmBase_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
