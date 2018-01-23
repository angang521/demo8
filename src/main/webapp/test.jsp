package groovy.core
import com.bestpay.bboss.web.core.processor.executor.DefaultGroovyExecutor
import com.bestpay.bboss.web.utils.constant.Constants
import com.bestpay.bboss.web.utils.model.InvokeRequest
import javax.servlet.http.HttpServletRequest
import com.bestpay.bboss.web.core.support.utils.WebUtils
import com.bestpay.bboss.web.core.support.xss.XSSServletRequest

/**
* 首页banner查询
* @param params
* @return
*/
Map selectByPage(Map<String,Object> params){

HttpServletRequest orgRequest = XSSServletRequest.getOrgRequest(WebUtils.servletRequest);
params.put(Constants.REMOTE_SERVICE,"appBannerService");
params.put(Constants.REMOTE_METHOD,"selectByPage");

def parameterTypes = ["com.bestpay.mobilebiz.launch.facade.dto.request.AppBannerReqDTO"] as String[];
params.put(Constants.REMOTE_PARAM_TYPE,parameterTypes);

def query = params.get("query");
String bannerName = params.get("bannerName");
params.put("bannerName",bannerName);

return  DefaultGroovyExecutor.INSTANCE.execute(InvokeRequest.getRemoteServiceInvokeRequest(params,false));
}