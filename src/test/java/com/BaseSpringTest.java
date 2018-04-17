package com;

import com.controller.UserController;
import com.pojo.User;
import com.serviceImpl.UserService2_Impl;
import com.service_api.UserService_api;
import junit.framework.TestCase;

import org.easymock.EasyMock;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.util.ReflectionTestUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-mvc.xml")
public class BaseSpringTest extends TestCase {

    @Autowired
    public UserController userController;

    @Autowired
    private UserService_api userService_api;


    public <T extends User> void mock(T t) {

        UserService2_Impl mock = EasyMock.createMock(UserService2_Impl.class);
        User user = new User();
        user.setUserName("xiao ming");
        user.setPassword("123");
        EasyMock.expect(mock.getUserById(t.getUserName())).andReturn(user);
        EasyMock.replay(mock);


        // ReflectionTestUtils.setField(userService_api, "user_aip2", mock);
        // ReflectionTestUtils.setField(userController, "userService_api", userService_api);

       /* //mock商户查询
        MerchantCoreIntegration merchantCoreIntegration = EasyMock.createMock(MerchantCoreIntegration.class);
        MerchantInfoBO merchantInfoBO = new MerchantInfoBO();
        merchantInfoBO.setContractNo("001");
        merchantInfoBO.setMerchantNo(t.getMerchantNo());
        EasyMock.expect(merchantCoreIntegration.queryMerchantInfo(t.getMerchantNo())).andReturn(merchantInfoBO);
        EasyMock.replay(merchantCoreIntegration);

        //mock协议查询
        AgreeCenterProductIntegration agreeCenterProductIntegration = EasyMock.createMock(AgreeCenterProductIntegration.class);
        agreeCenterProductIntegration.checkMerchantAgreement(merchantInfoBO.getContractNo(),
                t.getProductCode());
        EasyMock.expectLastCall();

        //mock cif查询
        CifProductIntegration cifProductIntegration = EasyMock.createMock(CifProductIntegration.class);
        cifProductIntegration.checkCifAgreement(t.getTransOutOperatorNo(), t.getAgreementType());
        EasyMock.expectLastCall();

        //mock 3.0 下单和支付
        String tradeNo = UUID.randomUUID().toString().replace("-","").substring(0,12);
        TradeProductDeductService tradeProductDeductService = EasyMock.createMock(TradeProductDeductService.class);
        Result<TradeProductFundBaseResDTO> result = new Result<TradeProductFundBaseResDTO>();
        TradeProductFundBaseResDTO tradeProductFundBaseResDTO = new TradeProductFundBaseResDTO();
        tradeProductFundBaseResDTO.setTradeNo(tradeNo);
        tradeProductFundBaseResDTO.setTradeStatus("INIT");
        result.setResult(tradeProductFundBaseResDTO);
        EasyMock.expect(tradeProductDeductService.
                createDeductOrder(anyObject(TradeProductCreateDeductOrderReqDTO.class), (String) anyObject()))
                .andReturn(result);
        //.andThrow(new RuntimeException("123123123213213"));
        // EasyMock.replay(tradeProductDeductService);

        Result<TradeProductFundBaseResDTO> payResult = new Result<TradeProductFundBaseResDTO>();
        TradeProductFundBaseResDTO tradeProductFundBaseResDTO2 = new TradeProductFundBaseResDTO();
        tradeProductFundBaseResDTO2.setTradeNo(tradeNo);
        tradeProductFundBaseResDTO2.setTradeStatus("SUCCESS");
        tradeProductFundBaseResDTO2.setDiscountAmt(0L);
        tradeProductFundBaseResDTO2.setPayAmt(100L);
        payResult.setResult(tradeProductFundBaseResDTO2);
        EasyMock.expect(tradeProductDeductService.
                deductOrderPay(anyObject(TradeProductDeductPayReqDTO.class), (String) anyObject()))
                .andReturn(payResult);
        //.andThrow(new RuntimeException("ppppppppppppppppppp"));
        EasyMock.replay(tradeProductDeductService);


        //mock 支付列表查询
        TradeProductPayToolsQueryService tradeProductPayToolsQueryService = EasyMock.createMock(TradeProductPayToolsQueryService.class);

        Result<TradeProductPayToolsResDTO> payToolsResult = new Result<TradeProductPayToolsResDTO>();
        TradeProductPayToolsResDTO tradeProductPayToolsResDTO = new TradeProductPayToolsResDTO();
        tradeProductPayToolsResDTO.setDiscountFlag("TRUE");
        tradeProductPayToolsResDTO.setTradeProductMajorPayToolDTOs(BaseFunction.getMajorPayTools());
        tradeProductPayToolsResDTO.setTradeProductAssistPayToolDTOs(BaseFunction.getAssistPayTools());
        payToolsResult.setResult(tradeProductPayToolsResDTO);
        EasyMock.expect(tradeProductPayToolsQueryService.
                queryDeductPayTools(anyObject(TradeProductPayToolsReqDTO.class), (String) anyObject()))
                .andReturn(payToolsResult);
        // .andThrow(new RuntimeException("ppppppppppppppppppp"));
        EasyMock.replay(tradeProductPayToolsQueryService);


        AccBalanceQueryFacade accBalanceQueryFacade = EasyMock.createMock(AccBalanceQueryFacade.class);
        Response<QueryBalanceResDto> resDtoResponse = new Response<QueryBalanceResDto>();
        QueryBalanceResDto queryBalanceResDto = new QueryBalanceResDto();
        queryBalanceResDto.setAvailableBal(100L);
        resDtoResponse.setResult(queryBalanceResDto);
        EasyMock.expect(accBalanceQueryFacade.
                findBalanceByOperatorNo(anyObject(QueryByOperatorNoReqDto.class)))
                .andReturn(resDtoResponse);

        EasyMock.replay(accBalanceQueryFacade);



        //将mock的类放到spring中
        ReflectionTestUtils.setField(merchantInfoHandler, "merchantCoreIntegration", merchantCoreIntegration);
        ReflectionTestUtils.setField(baseDeductPayBiz, "merchantInfoHandler", merchantInfoHandler);
        ReflectionTestUtils.setField(baseDeductPayBiz, "cifProductIntegration", cifProductIntegration);
        ReflectionTestUtils.setField(baseDeductPayBiz, "agreeCenterProductIntegration", agreeCenterProductIntegration);
        ReflectionTestUtils.setField(loopTradeProductIntegration, "tradeProductDeductService", tradeProductDeductService);
        ReflectionTestUtils.setField(loopTradeProductIntegration, "tradeProductPayToolsQueryService", tradeProductPayToolsQueryService);
        ReflectionTestUtils.setField(accountBalanceQueryFacadeIntegration, "accBalanceQueryFacade", accBalanceQueryFacade);
        ReflectionTestUtils.setField(deductPayBiz, "loopTradeProductIntegration", loopTradeProductIntegration);
        ReflectionTestUtils.setField(deductPayBiz, "accountBalanceQueryFacadeIntegration", accountBalanceQueryFacadeIntegration);
        ReflectionTestUtils.setField(deductPayBiz, "baseDeductPayBiz", baseDeductPayBiz);
        ReflectionTestUtils.setField(deductPayService, "deductPayBiz", deductPayBiz);
    }
*/

    }
}
