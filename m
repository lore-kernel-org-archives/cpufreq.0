From: Mick Reed <mickreed@freeshell.org>
Subject: Panic booting livecd dual opteron powernow
Date: Mon, 13 Sep 2004 02:16:04 +0000 (UTC)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.NEB.4.60.0409130154330.18088@sverige.freeshell.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: mickreed@freeshell.org

I am booting the 2004.2 Gentoo livecd and get a panic.  I use the smp 
kernel, and I have tried turning off ACPI and /or APM in my bios.  Also I 
have tried different kernl arguments, but it still panics.

noacpi acpi=0 noapm   none of these have helped...

I can however boot the UP version.  Snippets 
transcribed below.  Tyan S2881 with latest bios, dual opteron 246.  Any 
other info I can send let me know.

smp 'dmesg':

powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.20.08b 
- March 20, 2004)
powernow-k8: MP systems not supported by PSB BIOS structure
Unable to handle kernel NULL pointer dereference at 0000000000000028 RIP:
<ffffffff80120ada>{powernowk8_verify+10}PML4 0
Oops: 0000 [1] SMP
CPU 0
Pid: 1, comm: swapper Not tainted 2.6.5-gentoo-smp
...
Call Trace:<fffffff803b0950>{__cpufreq_set_policy+48} 
<fffffff803b0acf>{cpufreq_set_policy+79}
...{cpufreq_add_dev+446}..
{sysdev_driver_register+135}...
{powernowk8_init+507}... {do_initcalls+106}... {init+87} ...{child_rip+8}
{init+0}... {child_rip+0}...

Thanks,
Mick
