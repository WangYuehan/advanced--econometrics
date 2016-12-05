*处理数据
g exp2=exp76^2

*OLS估计
reg lwage76 ed76 exp76 exp2 black smsa76 south76
reg lwage76 ed76 iqscore exp76 exp2 black smsa76 south76 /*使用代理变量*/
estimates store ols		/*存储OLS结果*/

*IV估计
ivregress 2sls lwage76 ed76 exp76 exp2 black smsa76 south76 (iqscore=momed kww)
estimates store iv		/*保存IV估计结果*/
*ivregress esls Y X1 (X2=Z1 Z2), r[或vce(r) [VCE(hac)]] /*当存在异方差或自相关时用*/

*过渡识别检验（检验工具变量外生性）
estat overid

*弱工具变量检验（工具变量与内生解释变量相关性检验）
estat firststage	/*第一阶段中相关性*/

*检验X是否真的是内生变量
estat endogenous
