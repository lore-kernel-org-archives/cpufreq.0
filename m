From: Hans Ulrich Niedermann <linux-kernel@n-dimensional.de>
Subject: [PATCH 2.6] Make 'powersave' cpufreq governor a possible default
 governor
Date: Wed, 14 Jan 2004 22:17:43 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <86fzei1b7s.fsf@n-dimensional.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@www.linux.org.uk

You can import this changeset into BK by piping this whole message to:
'| bk receive [path to repository]' or apply the patch as usual.

===================================================================


ChangeSet@1.1511, 2004-01-13 04:10:11+01:00, kdim@n-dimensional.de
  [CPUFREQ] Make 'powersave' cpufreq governor a possible default governor


 drivers/cpufreq/Kconfig             |    8 ++++++++
 drivers/cpufreq/cpufreq_powersave.c |    5 +++--
 include/linux/cpufreq.h             |    3 +++
 3 files changed, 14 insertions(+), 2 deletions(-)


diff -Nru a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
--- a/drivers/cpufreq/Kconfig	Wed Jan 14 22:14:14 2004
+++ b/drivers/cpufreq/Kconfig	Wed Jan 14 22:14:14 2004
@@ -26,6 +26,14 @@
 	  the frequency statically to the highest frequency supported by
 	  the CPU.
 
+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
+	bool "powersave"
+	select CPU_FREQ_GOV_POWERSAVE
+	help
+	  Use the CPUFreq governor 'powersave' as default. This sets
+	  the frequency statically to the lowest frequency supported by
+	  the CPU.
+
 config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	bool "userspace"
 	select CPU_FREQ_GOV_USERSPACE
diff -Nru a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_powersave.c
--- a/drivers/cpufreq/cpufreq_powersave.c	Wed Jan 14 22:14:14 2004
+++ b/drivers/cpufreq/cpufreq_powersave.c	Wed Jan 14 22:14:14 2004
@@ -29,11 +29,12 @@
 	return 0;
 }
                                                             
-static struct cpufreq_governor cpufreq_gov_powersave = {
+struct cpufreq_governor cpufreq_gov_powersave = {
 	.name		= "powersave",
 	.governor	= cpufreq_governor_powersave,
 	.owner		= THIS_MODULE,
 };
+EXPORT_SYMBOL(cpufreq_gov_powersave);
 
 
 static int __init cpufreq_gov_powersave_init(void)
@@ -52,5 +53,5 @@
 MODULE_DESCRIPTION("CPUfreq policy governor 'powersave'");
 MODULE_LICENSE("GPL");
 
-module_init(cpufreq_gov_powersave_init);
+fs_initcall(cpufreq_gov_powersave_init);
 module_exit(cpufreq_gov_powersave_exit);
diff -Nru a/include/linux/cpufreq.h b/include/linux/cpufreq.h
--- a/include/linux/cpufreq.h	Wed Jan 14 22:14:14 2004
+++ b/include/linux/cpufreq.h	Wed Jan 14 22:14:14 2004
@@ -299,6 +299,9 @@
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 extern struct cpufreq_governor cpufreq_gov_performance;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE)
+extern struct cpufreq_governor cpufreq_gov_powersave;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_powersave
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace

===================================================================


This BitKeeper patch contains the following changesets:
1.1511
## Wrapped with gzip_uu ##


M'XL( ":Q!4   \U6;6_;-A#^;/X*H@'6%H4EONF%+CPD39PL:%I[3M)MZ J!
MENA(M2QZ$ITVF'[\*/DE=A([:=( LPW9)N^.=\\]=\<=>%[(O-481<D8[,#?
M5*%;C:QI_LFL2%0F4BN29J.OE-FP8S66]BB2E_;('HSLS,@UP\ETF,M_@)'J
M"1W&\%+F1:N!+;I<T5<3V6KT.T?G)WM] -IMN!^+[$*>2@W;;:!5?BG2J-@5
M.DY59NE<9,58:F&%:EPN14N"$#%O!WL4.6Z)7<2\,L01QH)A&2'"?)==6ZN<
MM501I9;*+];-,(01QQQYE)?4Q8B! X@M[& ,$;,1MC$U/UH8M3!^@W +(5@A
MM'L3&?B&PB8"[^#/#6$?A/#S?N_\L-_Y_0O\($82OIRH;P97<2E?PCGB\$(9
MJ#.50P$GJBB202IA)(=BFNKE'G@/J>=0"GK7F(/F#[X 0 *!7V&:9-/ONX-<
M1<H$_WD1])<RRI,JZ_;<,_M]J+)A<E&%2Q'!#D&,8;=$C)N@0^*$B'#"Q( 3
M/]P [3:;)GV8&LL^0B4CE%'C6V2@^;J;RR@6N@;]IO[\.U@":84S_S@BA#J8
MH9(RY+#2,XM#[CO,P4.'\NB!_FVPO_#5<WCI$,]S;^%8)EF83B-IU\L+.U8\
M(PLG'/L$$U*ZB'*_Q-+ST3",.(F8""G=X-T6FZL>F81XK*[(!X13U>KSP?P3
M3./200CY=3&3M4I&7LOA]U8R>99*?FK]SEC3A<W\6_TQ]=A[2+H>4>8'E$ ,
MCNMGH?-IJ!?.!DMG5Q:N3X-M^*_1<XU>Y\]>MW\6G/[UX5WWY-6=TJ_?@@/'
MJ4ZJG\,B2+)$AR)-[Y:OMXW273R=MX6*F\_3GN[GY7IG,I3P&66D),0EO.:B
MO\Y%W[!P.Q?]YYHJ3^7BK-O>P\4Y'H_@WS'QH0_F&34#,*@F8'#0.=P[/SD+
MCKJ?@E[WCT[_=.]3!S0&2J7PQ3*6%Z!1R%0:RBX5;RC$,IV !JRN/%#'LI([
M7(M]%1A1+.*WX%F<%+"0NJBT*\TJS*G,PBM8:*&3BKE7)EOU7FIL%'I59#J9
MJ%S+" ZN%@;,T1;XNR;TADY]F]!/FQ.W:;Q]1%0TII14W9ISMZ8QY8_HJ?]3
M'M=S[P:/-P#R&!Y3A*&Y_\HT&5;')YF,7NUW/QX>'P7;:?T:R._:> E_J/V^
M!3NS4^#\UKAJO-/_V.TW?KE3\?K6'L8R'!73<9N[_D"$IN_]!WVXUN\<#   
