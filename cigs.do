*香烟数据进行WLS回归
gen lnincome=log(income)
gen lncigpric=log(cigpric)
gen age2=age*age

reg cigs lnincome lncigpric educ age age2 restaurn
predict e1,res

*怀特检验
estat imtest, white
*BP检验
estat hettest,rhs iid

g e2=e1^2
g lne2=log(e2)
reg lne2 lnincome lncigpric educ age age2 restaurn

predict lne2f
g e2f=exp(lne2f)
reg cigs lnincome lncigpric educ age age2 restaurn [aw=1/e2f]
reg cigs lnincome lncigpric educ age age2 restaurn [aw=1/e2f],robust



test lnincome lncigpric

