From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: powernow-k8 on Athlon64 3200+ (s939) stability problem...
Date: Tue, 5 Apr 2005 11:28:29 +0200
Message-ID: <200504051128.29333.pytasz@lodz.home.pl>
References: <88056F38E9E48644A0F562A38C64FB60046298FE@scsmsx403.amr.corp.intel.com>
Reply-To: pytasz@lodz.home.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60046298FE@scsmsx403.amr.corp.intel.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi,

A while ago I bought the mentioned Athlon, with MSI K8T Neo2 mainboard. It 
works fine (without powernow/cool&quiet or with "performance" govenor), but 
encouraged by a perfectly working laptop (Mobile Sempron 2800) I tried to use 
it with desktop (tried ondemand govenor as well as powernowd deamon). 
Well, it does work, but after switching to lowest (1000) frequency (not 
immediately) system hangs hard or reboots.
I have 2.6.11.6 kernel, gcc 3.4.3.20050110. System is running in native 64 bit 
mode:
Linux 2.6.11-gentoo-r5 #1 Sat Apr 2 21:52:05 CEST 2005 x86_64 AMD Athlon(tm) 
64 Processor 3200+ AuthenticAMD GNU/Linux

I was wondering how to check if it is a hardware problem (for example too low 
voltage from mainboard, deffective CPU,... ) or something in the system.

All ideas are welcome,
Michal
