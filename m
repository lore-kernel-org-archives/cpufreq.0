From: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Subject: Re: cpufreq files missing in Linux 2.6.5
Date: Thu, 20 May 2004 17:16:53 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.GSO.4.30.0405201709180.23636-100000@rigel.oac.uci.edu>
References: <1085097449.18969.1.camel@delerium.codemonkey.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1085097449.18969.1.camel@delerium.codemonkey.org.uk>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

I'm running a Pentium M with enhanced speedstep.

If I type "modprobe -l |grep cpufreq" I get the following:

/lib/modules/2.6.5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko
/lib/modules/2.6.5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-lib.ko
/lib/modules/2.6.5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-ich.ko
/lib/modules/2.6.5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko
/lib/modules/2.6.5/kernel/arch/i386/kernel/cpu/cpufreq/acpi.ko
/lib/modules/2.6.5/kernel/drivers/cpufreq/proc_intf.ko
/lib/modules/2.6.5/kernel/drivers/cpufreq/freq_table.ko
/lib/modules/2.6.5/kernel/drivers/cpufreq/cpufreq_userspace.ko
/lib/modules/2.6.5/kernel/drivers/cpufreq/cpufreq_powersave.ko

So it looks like the modules are appearing. I don't understand why the
files to which you write the CPU frequency are not appearing.


On Fri, 21 May 2004, Dave Jones wrote:

> On Thu, 2004-05-20 at 23:56, Vasanth Venkatachalam wrote:
>
> > 1. The directory /sys/devices/system/cpu/cpu0 exists but is empty; there
> > is no cpufreq subdirectory inside it.
>
> Sounds like it didn't detect whatever processor you have.
> What CPU is it ? cpufreq related msgs from dmesg please ?
> have you tried modprobe'ing the relevant driver ?
>
> > 2. There's also no /proc/cpufreq or /proc/sys/cpu/*/speed directory.
>
> Thats the deprecated 2.4 interface.
>
> 	Dave
>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
