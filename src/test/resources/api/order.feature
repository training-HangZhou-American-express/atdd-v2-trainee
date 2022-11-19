# language: zh-CN
@api-login
功能: 订单

  场景: 订单列表
    假如存在"订单":
      | code  | productName | total | status        |
      | SN001 | 电脑          | 19999 | toBeDelivered |
    当GET "/orders"
    那么response should be:
    """
    body.json= [{
        code: "SN001"
        productName: "电脑"
        total: 19999
        status: "toBeDelivered"
    }]
    """

  场景: 订单详情 - 无物流
    假如存在"未发货的 订单":
      | code  | productName | total | recipientName | recipientMobile | recipientAddress |
      | SN001 | 电脑          | 19999 | 张三            | 13085901735     | 上海市长宁区           |
    当GET "/orders/SN001"
    那么response should be:
    """
    body.json: {
        code: "SN001"
        productName: "电脑"
        total: 19999
        recipientName: "张三"
        recipientMobile: "13085901735"
        recipientAddress: "上海市长宁区"
        status: "toBeDelivered"
    }
    """

  场景: 订单发货
    假如存在"未发货的 订单":
      | code  |
      | SN001 |
    当POST "/orders/SN001/deliver":
    """
    {
      "deliverNo": "SF001"
    }
    """
    那么所有"订单"应为:
    """
    : [{
      code: 'SN001'
      deliverNo: 'SF001'
      status: 'delivering'
    }]
    """

  场景: 订单详情 - 查询物流
    假如存在"订单":
      | code  | productName | total | recipientName | recipientMobile | recipientAddress | status     | deliverNo     | deliveredAt          |
      | SN001 | 电脑          | 19999 | 张三            | 13085901735     | 上海市长宁区           | delivering | 4313751158896 | 2022-02-26T16:25:01Z |
    并且存在快递单"4313751158896"的物流信息如下
    """
    {
        "status": 0,
        "msg": "ok",
        "result": {
            "number": "4313751158896",
            "type": "yunda",
            "typename": "韵达快运",
            "logo": "https://api.jisuapi.com/express/static/images/logo/80/yunda.png",
            "list": [
                {
                    "time": "2021-04-16 23:51:55",
                    "status": "【潍坊市】已离开 山东潍坊分拨中心；发往 成都东地区包"
                },
                {
                    "time": "2021-04-16 23:45:47",
                    "status": "【潍坊市】已到达 山东潍坊分拨中心"
                },
                {
                    "time": "2021-04-16 16:47:35",
                    "status": "【潍坊市】山东青州市公司-赵良涛(13606367012) 已揽收"
                }
            ],
            "deliverystatus": 1,
            "issign": 0
        }
    }
    """
    当GET "/orders/SN001"
    那么response should be:
    """
    body.json.logistics= {
        deliverNo: "4313751158896"
        companyCode: "yunda"
        companyName: "韵达快运"
        companyLogo: "https://api.jisuapi.com/express/static/images/logo/80/yunda.png"
        details:
        | time                  | status                                           |
        | '2021-04-16 23:51:55' | "【潍坊市】已离开 山东潍坊分拨中心；发往 成都东地区包"   |
        | '2021-04-16 23:45:47' | "【潍坊市】已到达 山东潍坊分拨中心"                   |
        | '2021-04-16 16:47:35' | "【潍坊市】山东青州市公司-赵良涛(13606367012) 已揽收"  |
        deliveryStatus: "在途中"
        isSigned: "未签收"
    }
    """

  场景: buy
    假如存在"用户":
      | userName |
      | Tom      |
    假如存在"权益产品":
      | amount | name |
      | 99     | 火锅   |
    那么所有"用户"应为:
    """
    =[]
    """

  场景: query
    假如存在"权益产品":
      | amount | name |
      | 99     | 火锅   |
    假如存在"用户权益":
      | benefitProduct.name |
      | 火锅                  |
      | 火锅                  |
    那么所有"用户权益"应为:
    """
    =[]
    """
