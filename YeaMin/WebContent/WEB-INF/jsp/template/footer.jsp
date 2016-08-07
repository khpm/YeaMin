<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="ax-footer">
    <div class="ax-wrap">
        <div style="width: 900px; margin: 0 auto;">
            <div class="ax-unit">
                <ul class="ax-version">
                    <li><span class="store_name" ></span>  |  사업자등록번호 : 118-82-02004  |  대표자 : 김성균  |  담당자 : 정한영  |   개인정보관리책임자 : 김지엽</li>
                </ul>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
    <div class="ax-wrap">
        <div style="width: 900px; margin: 0 auto;">
            <div class="ax-unit">
                <ul class="ax-version">
                    <li>가게 주소 : <span class="store_addr" ></span> | 가게 전화 번호 : <span class="store_tel" ></span></li>
                </ul>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
    <div class="ax-wrap">
        <div style="width: 900px; margin: 0 auto;">
            <div class="ax-unit">
                <ul class="ax-version">
                    <li>주중 영업 시간 : <span class="store_week_business_time" ></span> | 주말 영업 시간 : <span class="store_weekend_business_time" ></span></li>
                </ul>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
    <div class="ax-wrap">
        <div style="width: 900px; margin: 0 auto;">
            <div class="ax-unit">
                <ul class="ax-version">
                    <li>Copyright © 1998-2016 <span class="store_name" ></span> All Right Reserved</li>
                </ul>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
</div>

<script type="text/javascript">
	$.ajax({
	    url: "/YeaMin/selectStore.json",
	    type: "post",
	    data: "",
	    success: function(data) {
	    	var ret = JSON.parse(data);
	    	
	    	if(ret.result === "ok") {
	    		var data = ret.data;
	    		
	    		$(".store_name").text(data.store_name);
	    		$(".store_addr").text(data.store_addr);
	    		$(".store_tel").text(data.store_tel);
	    		$(".store_week_business_time").text(data.store_week_business_time);
	    		$(".store_weekend_business_time").text(data.store_weekend_business_time);
	    	}
	    }
	});
</script>