From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: cpufreq question
Date: Wed, 14 May 2008 13:52:37 -0500
Message-ID: <6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<200805141444.05019.jwilson@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Class: urn:content-classes:message
In-Reply-To: <200805141444.05019.jwilson@redhat.com>
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
To: Jarod Wilson <jwilson@redhat.com>, cpufreq@lists.linux.org.uk
Cc: "Frazier, John" <j-frazier2@ti.com>

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
