// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for endeffector_controller/HomeRequest
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
#include "endeffector_controller/Home.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class ENDEFFECTOR_CONTROLLER_EXPORT endeffector_controller_msg_HomeRequest_common : public MATLABROSMsgInterface<endeffector_controller::Home::Request> {
  public:
    virtual ~endeffector_controller_msg_HomeRequest_common(){}
    virtual void copy_from_struct(endeffector_controller::Home::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const endeffector_controller::Home::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void endeffector_controller_msg_HomeRequest_common::copy_from_struct(endeffector_controller::Home::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
  }
  //----------------------------------------------------------------------------
  MDArray_T endeffector_controller_msg_HomeRequest_common::get_arr(MDFactory_T& factory, const endeffector_controller::Home::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Home"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("endeffector_controller/HomeRequest");
    // home
    auto currentElement_home = (msg + ctr)->home;
    outArray[ctr]["Home"] = factory.createScalar(static_cast<bool>(currentElement_home));
    }
    return std::move(outArray);
  }
class ENDEFFECTOR_CONTROLLER_EXPORT endeffector_controller_msg_HomeResponse_common : public MATLABROSMsgInterface<endeffector_controller::Home::Response> {
  public:
    virtual ~endeffector_controller_msg_HomeResponse_common(){}
    virtual void copy_from_struct(endeffector_controller::Home::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const endeffector_controller::Home::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void endeffector_controller_msg_HomeResponse_common::copy_from_struct(endeffector_controller::Home::Response* msg, const matlab::data::Struct& arr,
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
  MDArray_T endeffector_controller_msg_HomeResponse_common::get_arr(MDFactory_T& factory, const endeffector_controller::Home::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Success"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("endeffector_controller/HomeResponse");
    // success
    auto currentElement_success = (msg + ctr)->success;
    outArray[ctr]["Success"] = factory.createScalar(static_cast<bool>(currentElement_success));
    }
    return std::move(outArray);
  } 
class ENDEFFECTOR_CONTROLLER_EXPORT endeffector_controller_Home_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~endeffector_controller_Home_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          endeffector_controller_Home_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<endeffector_controller::Home::Request,endeffector_controller_msg_HomeRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<endeffector_controller::Home::Response,endeffector_controller_msg_HomeResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          endeffector_controller_Home_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<endeffector_controller::Home::Request,endeffector_controller::Home::Request::ConstPtr,endeffector_controller_msg_HomeRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<endeffector_controller::Home::Response,endeffector_controller::Home::Response::ConstPtr,endeffector_controller_msg_HomeResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          endeffector_controller_Home_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<endeffector_controller::Home::Request,endeffector_controller::Home::Response,endeffector_controller_msg_HomeRequest_common,endeffector_controller_msg_HomeResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          endeffector_controller_Home_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<endeffector_controller::Home,endeffector_controller::Home::Request,endeffector_controller::Home::Response,endeffector_controller_msg_HomeRequest_common,endeffector_controller_msg_HomeResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          endeffector_controller_Home_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<endeffector_controller::Home::Request,endeffector_controller_msg_HomeRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<endeffector_controller::Home::Response,endeffector_controller_msg_HomeResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(endeffector_controller_msg_HomeRequest_common, MATLABROSMsgInterface<endeffector_controller::Home::Request>)
CLASS_LOADER_REGISTER_CLASS(endeffector_controller_msg_HomeResponse_common, MATLABROSMsgInterface<endeffector_controller::Home::Response>)
CLASS_LOADER_REGISTER_CLASS(endeffector_controller_Home_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
