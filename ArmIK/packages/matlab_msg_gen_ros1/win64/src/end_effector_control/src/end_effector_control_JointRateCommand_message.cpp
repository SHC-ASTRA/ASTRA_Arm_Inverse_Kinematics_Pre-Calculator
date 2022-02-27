// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for end_effector_control/JointRateCommand
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
#include "end_effector_control/JointRateCommand.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class END_EFFECTOR_CONTROL_EXPORT end_effector_control_msg_JointRateCommand_common : public MATLABROSMsgInterface<end_effector_control::JointRateCommand> {
  public:
    virtual ~end_effector_control_msg_JointRateCommand_common(){}
    virtual void copy_from_struct(end_effector_control::JointRateCommand* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const end_effector_control::JointRateCommand* msg, MultiLibLoader loader, size_t size = 1);
};
  void end_effector_control_msg_JointRateCommand_common::copy_from_struct(end_effector_control::JointRateCommand* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //axis
        const matlab::data::TypedArray<int8_t> axis_arr = arr["Axis"];
        msg->axis = axis_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Axis' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Axis' is wrong type; expected a int8.");
    }
    try {
        //desiredRate
        const matlab::data::TypedArray<double> desiredRate_arr = arr["DesiredRate"];
        msg->desiredRate = desiredRate_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'DesiredRate' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'DesiredRate' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T end_effector_control_msg_JointRateCommand_common::get_arr(MDFactory_T& factory, const end_effector_control::JointRateCommand* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Axis","DesiredRate"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("end_effector_control/JointRateCommand");
    // axis
    auto currentElement_axis = (msg + ctr)->axis;
    outArray[ctr]["Axis"] = factory.createScalar(currentElement_axis);
    // desiredRate
    auto currentElement_desiredRate = (msg + ctr)->desiredRate;
    outArray[ctr]["DesiredRate"] = factory.createScalar(currentElement_desiredRate);
    }
    return std::move(outArray);
  } 
class END_EFFECTOR_CONTROL_EXPORT end_effector_control_JointRateCommand_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~end_effector_control_JointRateCommand_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          end_effector_control_JointRateCommand_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<end_effector_control::JointRateCommand,end_effector_control_msg_JointRateCommand_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         end_effector_control_JointRateCommand_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<end_effector_control::JointRateCommand,end_effector_control::JointRateCommand::ConstPtr,end_effector_control_msg_JointRateCommand_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         end_effector_control_JointRateCommand_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<end_effector_control::JointRateCommand,end_effector_control_msg_JointRateCommand_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(end_effector_control_msg_JointRateCommand_common, MATLABROSMsgInterface<end_effector_control::JointRateCommand>)
CLASS_LOADER_REGISTER_CLASS(end_effector_control_JointRateCommand_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1