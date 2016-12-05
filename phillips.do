*静态phillips曲线

tsset rear			/*声明时间序列*/
scatter inf unem	/*画散点图*/
line inf unem year	/*画线型图*/

*考察inf与unem的若相关性
reg inf L.inf		/*1阶自回归*/
reg unem L.unem

dffller inf, regress	/*DF检验*/
dfuller unem, regress

*OLS
reg inf unem
predict e1,resid	/*记录残差*/

scatter e1 L.e1		/*画残差图，L.e1为滞后一期，2期L2.*/
ac e1				/*自相关图*/
pac e1				/*偏自相关图*/

*序列相关检验
estat bgodfrey		/*BG检验，默认滞后p=1*/
estat bgodfrey, nomiss0 /*使用不添加0的BG检验*/
estat bgodfrey, lags(2)
/*一般命令：estat bgodfrey, lags(p)*/

estat dwatson		/*DW检验*/

*GLS法估计
prais inf unem		/*默认的PW法*/
prais inf unem, corc /*cochrane-Orcutt迭代法*/
