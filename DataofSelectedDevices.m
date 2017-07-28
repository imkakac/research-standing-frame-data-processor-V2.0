%Header for Selected Devices
function [FinalData, FileSuffix, StatusText] = DataofSelectedDevices (DeviceInfo, L_LC, R_LC, L_FP, R_FP)
% CommonHeader = 'RESEARCH STANDING FRAME DATA\nSCAN_RATE: 2000.0000\nSAMPLE_PER_PULSE: 250\n\n';
if DeviceInfo == [0 0 0 0]%0
    FinalData = nan;
    FileSuffix = nan;
    StatusText = nan;
elseif DeviceInfo == [0 0 0 1]%1
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [R_FP_COP];
    FileSuffix = '_RFP.txt';
    StatusText = 'Saving right force plate data... ';
elseif DeviceInfo == [0 0 1 0]%2
    L_FP_COP = COPcal_new (L_FP);
    FinalData = L_FP_COP;
    FileSuffix = '_LFP.txt';
    StatusText = 'Saving left force plate data... ';
elseif DeviceInfo == [0 0 1 1]%3
    L_FP_COP = COPcal_new (L_FP);
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [L_FP_COP R_FP_COP];
    FileSuffix = '_L&RFP.txt';
    StatusText = 'Saving left & right force plate data... ';
elseif DeviceInfo == [0 1 0 0]%4
    FinalData = R_LC;
    FileSuffix = '_RLC.txt';
    StatusText = 'Saving right load cell data... ';
elseif DeviceInfo == [0 1 0 1]%5
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [R_LC R_FP_COP];
    FileSuffix = '_RLC_RFP.txt';
    StatusText = 'Saving right load cell and right force plate data... ';
elseif DeviceInfo == [0 1 1 0]%6
    L_FP_COP = COPcal_new (L_FP);
    FinalData = [R_LC L_FP_COP];
    FileSuffix = '_RLC_LFP.txt';
    StatusText = 'Saving right load cell and left force plate data... ';
elseif DeviceInfo == [0 1 1 1]%7
    L_FP_COP = COPcal_new (L_FP);
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [R_LC L_FP_COP R_FP_COP];
    FileSuffix = '_RLC_L&RFP.txt';
    StatusText = 'Saving right load cell and left & right force plate data... ';
elseif DeviceInfo == [1 0 0 0]%8   
    FinalData = L_LC; 
    FileSuffix = '_LLC.txt';
    StatusText = 'Saving left load cell data... ';
elseif DeviceInfo == [1 0 0 1]%9
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [L_LC R_FP_COP];
    FileSuffix = '_LLC_RFP.txt';
    StatusText = 'Saving left load cell and right force plate data... ';
elseif DeviceInfo == [1 0 1 0]%10
    L_FP_COP = COPcal_new (L_FP);
    FinalData = [L_LC L_FP_COP];
    FileSuffix = '_LLC_RFP.txt';
    StatusText = 'Saving left load cell and left force plate data... ';
elseif DeviceInfo == [1 0 1 1]%11
    L_FP_COP = COPcal_new (L_FP);
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [L_LC L_FP_COP R_FP_COP];
    FileSuffix = '_LLC_L&RFP.txt';
    StatusText = 'Saving left load cell and left & right force plate data... ';
elseif DeviceInfo == [1 1 0 0]%12
    FinalData = [L_LC R_LC];
    FileSuffix = '_L&RLC.txt';
    StatusText = 'Saving left & right load cell data... ';
elseif DeviceInfo == [1 1 0 1]%13
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [L_LC R_LC R_FP_COP];
    FileSuffix = '_L&RLC_RFP.txt';
    StatusText = 'Saving left & right load cell and right force plate data... ';
elseif DeviceInfo == [1 1 1 0]%14
    L_FP_COP = COPcal_new (L_FP);
    FinalData = [L_LC R_LC L_FP_COP];
    FileSuffix = '_L&RLC_LFP.txt';
    StatusText = 'Saving left & right load cell and left force plate data... ';
elseif DeviceInfo == [1 1 1 1]%15
    L_FP_COP = COPcal_new (L_FP);
    R_FP_COP = COPcal_new (R_FP);
    FinalData = [L_LC R_LC L_FP_COP R_FP_COP];
    FileSuffix = '_L&RLC_L&RFP.txt';
    StatusText = 'Saving left & right load cell and left & right force plate data... ';
end