import cooler
c1 = cooler.Cooler('D4_WT.mm9.mapq_30.10000.mcool::resolutions/10000')
mybins1 = c1.bins().fetch('chr14:58887800-68880800')
mybins1.shape
mybins1.head()
mybins1.tail()
Cmatrix = c1.matrix(balance=True, as_pixels=True, join=True)[195688:196688, 195688:196688]
Cmatrix.to_csv("D4_WT_Bin_195688_to196688.csv")

c2 = cooler.Cooler('D4_BrmKO.mm9.mapq_30.10000.mcool::resolutions/10000')
mybins2 = c2.bins().fetch('chr14:58887800-68880800')
mybins2.shape
mybins2.head()
mybins2.tail()
Cmatrix = c2.matrix(balance=True, as_pixels=True, join=True)[195688:196688, 195688:196688]
Cmatrix.to_csv("D4_BrmKO_Bin_195688_to196688.csv")