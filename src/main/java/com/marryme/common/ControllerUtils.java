package com.marryme.common;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.marryme.common.CommonString.ERROR_MSG;
import static com.marryme.common.CommonString.EXCEPTION;

public class ControllerUtils {

    /**
     * 檢核requestMap參數，需要檢核不為null或空字串的欄位
     * 若不合規則put 欄位名稱/該欄位錯誤訊息 -> 到錯誤訊息map
     */
    public static void validErrorForParameterMap(Map<String,String[]> rqMap, Map<String, String> inValidFieldsMsg, Map<String, String> errorMsg) {

        if(rqMap == null || inValidFieldsMsg == null){
            errorMsg.put(EXCEPTION, ERROR_MSG);
            return;
        }

        for(Map.Entry<String, String[]> entry : rqMap.entrySet()) {
            String[] values = entry.getValue();
            if(inValidFieldsMsg.containsKey(entry.getKey()) && (values == null || values.length == 0 || StringUtils.isBlank(values[0]))) {
                // 取得參數為 null，且為 inValidFieldsMsg 中限制需檢核的欄位，要顯示的錯誤訊息
                String fieldErrMsg = inValidFieldsMsg.get(entry.getKey());
                // 有錯誤的欄位名稱, 要顯示的錯誤訊息
                errorMsg.put(entry.getKey(), fieldErrMsg);
            }
        }
    }

    /**
     * 處理requestMap參數，將取得的基本型別參數 轉換到指定的bean物件
     * 欄位名稱需要一致
     * vo物件需要有空的建構子
     */
    public static <T> T parameterMapToVo(Map<String, String[]> rqMap, Class<T> voClassName) {
        try {
            T voBean = voClassName.getDeclaredConstructor().newInstance();
            // 把rq map對應的欄位與值，mapping 到 vo bean 物件中
            BeanUtils.populate(voBean, rqMap);
            return voBean;
        } catch (NoSuchMethodException | InvocationTargetException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
            throw new RuntimeException("取得參數失敗, " + e);
        }
    }
}
