From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: cpufreq question
Date: Wed, 14 May 2008 14:25:22 -0500
Message-ID: <6453C3CB8E2B3646B0D020C11261327309395B@sausexmb4.amd.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<200805141444.05019.jwilson@redhat.com>
	<6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com>
	<200805141522.46055.jwilson@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200805141522.46055.jwilson@redhat.com>
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
To: Jarod Wilson <jwilson@redhat.com>
Cc: cpufreq@lists.linux.org.uk, "Frazier, John" <j-frazier2@ti.com>

> > RHEL4 doesn't support
> > /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus and
> > cpuspeed 1.2.1 requires them.  You need to revert to a
> > previous version of cpuspeed, such as the one that came
> > with your RHEL4 installation.  Current versions of RHEL4
> > support SMP/CMP cpufreq with their native tools.
> 
> Erm, RHEL4 has been shipping cpuspeed 1.2.1 since mid 2005... 
> From the kernel-utils changelog:
> 
> * Mon Jun 20 2005 Dave Jones <davej@redhat.com>
> - Update cpuspeed to 1.2.1, featuring improved dual-core/SMP support. 
> (#146179)

Apologies for the misinformation.

But I'm reasonably sure it isn't stock cpuspeed-1.2.1, 
which is what John apparently installed.

-Mark Langdorf
Operating System Research Center
AMD
