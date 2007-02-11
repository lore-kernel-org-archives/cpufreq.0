From: Christian Unger <chakkerz@gmail.com>
Subject: Re: [Bug 7866] New: cpufreq fails to correctly identify Intel
	Conroe	operating frequencies
Date: Sun, 11 Feb 2007 01:59:10 +0000 (UTC)
Message-ID: <loom.20070211T025410-718@post.gmane.org>
References: <200701230813.l0N8Dtuj027723@fire-2.osdl.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

>            Summary: cpufreq fails to correctly identify Intel Conroe
>                     operating frequencies
> Intel Conroe E6660  <at>  2.4ghz
> 
> cat /proc/cpuinfo 
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 15
> model name      : Intel(R) Core(TM)2 CPU          6600   <at>  2.40GHz
> stepping        : 6
> cpu MHz         : 600.000
> cache size      : 4096 KB
> physical id     : 0
> siblings        : 2
> core id         : 0
> cpu cores       : 2
> 


Hello there

different hardware here:
MOBO GA-965P-DS3
uname -a :
Linux swamp-monkey 2.6.19-gentoo-r4 #1 SMP Sat Dec 30 10:42:07 UTC 2006 x86_64
Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz GenuineIntel GNU/Linux

chakkerz@swamp-monkey ~ $ cat /etc/sabayon-release
Sabayon Linux x86-64 3.25


Exactly the same symptom:

Workaround: Disable EIST in the BIOS - causes CPU to run at full speed.
Testing in Windows XP with Intel Thermal Analysis Tool indicates that although
the CPU Frequency remains up, power is still cut to the CPU, causing the CPU
temperature to drop.

NOTE: my CPU is overclocked. (which makes this a really ironic bug)

Also: Although my kernel is an older revision, it contains 2.6.20 backports.
