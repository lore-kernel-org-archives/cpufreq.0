From: Robin at Home <cremersdh@hotmail.com>
Subject: Unknown p4-clockmod-capable CPU
Date: Sun, 23 Dec 2007 14:48:03 +0100
Message-ID: <BAY128-W46E3FE474337AD482C59CBE580@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Hi there,
 
I try to use p4-clockmod on my Intel D201GLY2 board with the Intel Celeron (I thought P4 based) and get the following error:
 
[    0.000000] Initializing CPU#0[   26.858800] SLUB: Genslabs=22, HWalign=64, Order=0-1, MinObjects=4, CPUs=1, Nodes=1[   26.939086] CPU: After generic identify, caps: afebfbff 20100000 00000000 00000000 0000e31d 00000000 00000001[   26.939107] CPU: L1 I cache: 32K, L1 D cache: 32K[   26.939111] CPU: L2 cache: 512K[   26.939115] CPU: After all inits, caps: afebfbff 20100000 00000000 00003940 0000e31d 00000000 00000001[   27.460620] CPU0: Intel(R) Celeron(R) CPU          220  @ 1.20GHz stepping 01[   27.606666] Brought up 1 CPUs[   27.722820] checking if image is initramfs...<6>Switched to high resolution mode on CPU 0[   30.413214] ACPI: Processor [CPU0] (supports 8 throttling states)[  178.426634] p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux
 .org.uk>[ 1169.599736] p4-clockmod: Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>[ 2441.131010] acpi_cpufreq: no version for "struct_module" found: kernel tainted.
I am using Mythbuntu 7.10 (which is a version off Ubuntu 7.10) with kernel 2.6.22-14-generic
 
Some more info about the CPU:
/proc/cpuinfoprocessor       : 0vendor_id       : GenuineIntelcpu family      : 6model           : 22model name      : Intel(R) Celeron(R) CPU          220  @ 1.20GHzstepping        : 1cpu MHz         : 1200.134cache size      : 512 KBfdiv_bug        : nohlt_bug         : nof00f_bug        : nocoma_bug        : nofpu             : yesfpu_exception   : yescpuid level     : 10wp              : yesflags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmovpat pse36 clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx lm constant_tsc up pni monitor ds_cpl tm2 ssse3 cx16 xtpr lahf_lmbogomips        : 2401.82clflush size    : 64
Is there a way I can use/patch the p4-clockmod so it will work in my system ?
 
 
_________________________________________________________________
Download Messenger op je mobiel!
http://www.windowslivemobile.msn.com/nl/ 
