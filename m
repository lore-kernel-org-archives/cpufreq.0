From: "Frazier, John" <j-frazier2@ti.com>
Subject: RE: cpufreq question
Date: Wed, 14 May 2008 14:11:48 -0500
Message-ID: <B6790881E7413D4092359CC9B3D8EEFD04EADB27@dlee12.ent.ti.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<200805141444.05019.jwilson@redhat.com>
	<6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>, Jarod Wilson <jwilson@redhat.com>, cpufreq@lists.linux.org.uk

Mark,
Mark,

Please excuse my ignorance but when I look at the help for cpuspeed on
the box:
cpuspeed -help
========================================================================
cpuspeed v1.2.1

This program monitors the system's idle percentage and reduces or raises
the
CPUs' clock speeds and voltages accordingly to minimize power
consumption
when idle and maximize performance when needed.  This is the default.

The program may also optionally be configured to reduce the CPUs' clock
speeds if the temperature gets too high, NOT minimize their speeds if
the
computer's AC adapter is disconnected or maximize their speeds when the
AC
adapter is connected.

By default this program will manage every CPU found in the system.
 
 Left the rest off.

========================================================================

Then when I look in /sys/system/devices/cpu
ls /sys/devices/system/cpu/*/cpufreq
========================================================================
/sys/devices/system/cpu/cpu0/cpufreq:
cpuinfo_cur_freq  cpuinfo_min_freq
scaling_available_governors  scaling_driver    scaling_max_freq
scaling_setspeed
cpuinfo_max_freq  scaling_available_frequencies  scaling_cur_freq
scaling_governor  scaling_min_freq

/sys/devices/system/cpu/cpu1/cpufreq:
cpuinfo_cur_freq  cpuinfo_min_freq
scaling_available_governors  scaling_driver    scaling_max_freq
scaling_setspeed
cpuinfo_max_freq  scaling_available_frequencies  scaling_cur_freq
scaling_governor  scaling_min_freq

/sys/devices/system/cpu/cpu2/cpufreq:
cpuinfo_cur_freq  cpuinfo_min_freq
scaling_available_governors  scaling_driver    scaling_max_freq
scaling_setspeed
cpuinfo_max_freq  scaling_available_frequencies  scaling_cur_freq
scaling_governor  scaling_min_freq

/sys/devices/system/cpu/cpu3/cpufreq:
cpuinfo_cur_freq  cpuinfo_min_freq
scaling_available_governors  scaling_driver    scaling_max_freq
scaling_setspeed
cpuinfo_max_freq  scaling_available_frequencies  scaling_cur_freq
scaling_governor  scaling_min_freq
========================================================================
====

The version I am running is 1.2.1 and it works somewhat however I am
having some issues with the dual core cpus not scaling correctly. That
is what led me down this path. I got a new version of cpuspeed from Carl
Thomas and it does need the affected_cpus file which of course is not
there. Is there a way to just add the file? 


Thanks,
 
John Frazier

-----Original Message-----
From: Langsdorf, Mark [mailto:mark.langsdorf@amd.com] 
Sent: Wednesday, May 14, 2008 1:53 PM
To: Jarod Wilson; cpufreq@lists.linux.org.uk
Cc: Frazier, John
Subject: RE: cpufreq question

> On Wednesday 14 May 2008 02:28:02 pm Frazier, John wrote:
> > I am new to Linux and I am having a little problem with my cpu power
> > saving.
> >
> > Kernel: 2.6.9-67.0.4.ELsmp
> >
> > I am using cpuspeed to control my cpus and I have just upgraded to a
> > newer version of it and it is looking for the file
> > /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus.
> >
> > This file does not exist on my system. What is the correct way to
> > resolve this issue?
> 
> Probably best to file a bug at bugzilla.redhat.com for issues 
> on a RHEL4 system -- wildly divergent from upstream by now. 

RHEL4 doesn't support 
/sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus and 
cpuspeed 1.2.1 requires them.  You need to revert to a 
previous version of cpuspeed, such as the one that came
with your RHEL4 installation.  Current versions of RHEL4
support SMP/CMP cpufreq with their native tools.

-Mark Langsdorf
Operating System Research Center
AMD
