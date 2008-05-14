From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: cpufreq question
Date: Wed, 14 May 2008 15:22:45 -0400
Message-ID: <200805141522.46055.jwilson@redhat.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<200805141444.05019.jwilson@redhat.com>
	<6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk, "Frazier, John" <j-frazier2@ti.com>

On Wednesday 14 May 2008 02:52:37 pm Langsdorf, Mark wrote:
> > On Wednesday 14 May 2008 02:28:02 pm Frazier, John wrote:
> > > I am new to Linux and I am having a little problem with my cpu power
> > > saving.
> > >
> > > Kernel: 2.6.9-67.0.4.ELsmp
> > >
> > > I am using cpuspeed to control my cpus and I have just upgraded to a
> > > newer version of it and it is looking for the file
> > > /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus.
> > >
> > > This file does not exist on my system. What is the correct way to
> > > resolve this issue?
> >
> > Probably best to file a bug at bugzilla.redhat.com for issues
> > on a RHEL4 system -- wildly divergent from upstream by now.
>
> RHEL4 doesn't support
> /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus and
> cpuspeed 1.2.1 requires them.  You need to revert to a
> previous version of cpuspeed, such as the one that came
> with your RHEL4 installation.  Current versions of RHEL4
> support SMP/CMP cpufreq with their native tools.

Erm, RHEL4 has been shipping cpuspeed 1.2.1 since mid 2005... From the 
kernel-utils changelog:

* Mon Jun 20 2005 Dave Jones <davej@redhat.com>
- Update cpuspeed to 1.2.1, featuring improved dual-core/SMP support. 
(#146179)


-- 
Jarod Wilson
jwilson@redhat.com
