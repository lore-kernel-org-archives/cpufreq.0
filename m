From: Dan Hollis <spamtrap3074431@anime.net>
Subject: frequency scaling for desktop opteron?
Date: Fri, 16 Apr 2004 04:05:03 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0404160359580.21826-100000@sasami.anime.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cpufreq@www.linux.org.uk

Does desktop opteron support frequency scaling?

I have Opteron 140 in Tyan Tomcat K8S (S2850).

kernel 2.6.5:

$ cat /proc/cpuinfo 
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 5
model name      : AMD Opteron(tm) Processor 140
stepping        : 8
cpu MHz         : 1403.198
cache size      : 1024 KB
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 3dnowext 3dnow
bogomips        : 2760.70
TLB size        : 1088 4K pages
clflush size    : 64
address sizes   : 40 bits physical, 48 bits virtual
power management: ts ttp

$ /sbin/lspci 
00:06.0 PCI bridge: Advanced Micro Devices [AMD] AMD-8111 PCI (rev 07)
00:07.0 ISA bridge: Advanced Micro Devices [AMD] AMD-8111 LPC (rev 05)
00:07.1 IDE interface: Advanced Micro Devices [AMD] AMD-8111 IDE (rev 03)
00:07.2 SMBus: Advanced Micro Devices [AMD] AMD-8111 SMBus 2.0 (rev 02)
00:07.3 Bridge: Advanced Micro Devices [AMD] AMD-8111 ACPI (rev 05)
00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
01:00.0 USB Controller: Advanced Micro Devices [AMD] AMD-8111 USB (rev 0b)
01:00.1 USB Controller: Advanced Micro Devices [AMD] AMD-8111 USB (rev 0b)
01:0b.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
01:0d.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5705 Gigabit Ethernet (rev 03)
01:0e.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5705 Gigabit Ethernet (rev 03)

-Dan
