From: Dominik Brodowski <linux@brodo.de>
Subject: TODO list, patches will follow...
Date: Wed, 19 Nov 2003 19:29:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119182928.GA20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

Here are a few TODO items I'm aware of for cpufreq in 2.6.

* denotes a patch exists for 2.6.0-test9 and will be sent out in a few
moments.

Merged in cpufreq-bk
--------------------
- [speedstep-smi] fail on failure to aquire ownership
- [speedstep-centrino] 1 GHz Centrino support
- [powernow-k7] different error message on no PST for CPU
- [powernow-k8] resolve one #warning


2.6.0 / <2.6.2
--------------
* [speedstep-smi] Disable smi_detect_freqs() call on systems 
	which do not support it [BUG #1422]
* [speedstep-smi] Disable debug output
* [speedstep-smi] Spelling fix
* [speedstep-lib] Support for 533 MHz FSB
* [p4-clockmod] Detect CPU speed without relying on cpu_khz
* [core] remove unneeded #ifdefs in include/linux/cpufreq.h
* [core] latency in nanoseconds -- sometimes nanoseconds are used, 
	sometimes microseconds, sometimes even something else.
* [speedstep-smi] Do something about "cpufreq: change failed"
	Cause seems to be DMA by IDE and others. Possible 
	soultions are mdelay(250), notice to users, ignoring it, 
	retry etc.


>2.6.2 / 2.7
------------
- [powernow-k8] make it aware of frequency table helpers
	Have patches, AMD wanted to look into this
- [powernow-k7] override for PSTs
- [acpi-cpufreq] major rewrite
	patches exist, Len Brown liked them, but not now...
- [core] split up drivers/cpufreq.c into manageable pieces
- [core] use ->range() instead of ->setpolicy
- [longrun] remove special-handling of "policy"
- [ondemand] merge if patent issue is resolved
- [core] support of CPU groups (hyperthreading, SMT) 
	use cpumask_t instead of single CPU number
- [core] verify ->resume support is OK (I doubt it)
 

2.7
---
- [sa1100] move cpufreq_get code to arch/arm/sa1100-specific code
- [core] remove deprecated interfaces
	namely proc_intf, /proc/sys/ interface in userspace governor
