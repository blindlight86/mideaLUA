if #arg < 2 then
    print ("usage: lua " .. arg[0] .. " <J2C/C2J> <JSONString/CMDString>")
    return
end

-- require "bit32"
if arg[1]=='J2C' then
    jsonstr = arg[2]
    -- '{"deviceinfo":{"deviceSubType": 33}, "control": {"power": "off"}}'
    print(jsonToData(jsonstr))
    return jsonToData(jsonstr)
elseif arg[1]=='C2J' then
    cmdstr = arg[2]
    -- '{"deviceinfo":{"deviceSubType": 33}, "msg":{"data":"aa29db0000000000000303000000030520040300000000000000003a0000db34634c00000000000000cf"}}'
    print(dataToJson(cmdstr))
    return dataToJson(cmdstr)
end

-- jsonstr = '{"deviceinfo":{"deviceSubType": 33}, "control": {"power": "off", "soak":"off","detergent":"0","fast_clean_wash":"off","dehydration_time_value":0,"disinfectant":"0","dehydration_time":0,"mode":"normal","wash_time":0,"steam_wash":"off","beforehand_wash":"off","dirty_degree":"0","super_clean_wash":"off","water_level":"auto","ultraviolet_lamp":"0","data_type":"0303","error_code":0,"down_light":"off","active_oxygen":"0","memory":"off","stains":"0","lock":"off","running_status":"idle","speedy":"off","project_no":25396,"appointment_time":0,"expert_step":0,"strong_wash":"off","progress":0,"intelligent_wash":"off","old_speedy":"off","dehydration_speed":"800","remain_time":58,"easy_ironing":"off","add_rinse":"0","ai_flag":"off","microbubble":"0","eye_wash":"0","nightly":"off","appointment":"off","dryer":"0","spray_wash":"off","wash_time_value":0,"softener":"0","soak_count":"2","program":"mixed_wash","version":33,"wind_dispel":"0","temperature":"40"}}'
-- cmdstr = '{"deviceinfo":{"deviceSubType": 33}, "msg":{"data":"aa29db0000000000000303000000030520040300000000000000003a0000db34634c00000000000000cf"}}'
-- print(dataToJson(cmdstr))


