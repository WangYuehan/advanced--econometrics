*航空公司
*群组异方差
gen lncost=log(cost)
gen lnq=log(q)
gen lnpf=log(pf)
gen lnlf=log(lf)

reg lncost lnq lnpf lf d2 d3 d4 d5 d6

predict e1,res
g e2=e1^2

*对数据进行分组统计方差和数量，计算方差均值
bysort d2 d3 d4 d5 d6: egen x=sum(e2) 
bysort d2 d3 d4 d5 d6: egen num=count(x)

g e2f=x/num

reg lncost lnq lnpf lf d2 d3 d4 d5 d6 [aw=1/e2f]
