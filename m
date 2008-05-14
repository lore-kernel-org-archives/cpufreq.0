From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: cpufreq question
Date: Wed, 14 May 2008 15:43:39 -0400
Message-ID: <200805141543.39277.jwilson@redhat.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com>
	<200805141522.46055.jwilson@redhat.com>
	<6453C3CB8E2B3646B0D020C11261327309395B@sausexmb4.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <6453C3CB8E2B3646B0D020C11261327309395B@sausexmb4.amd.com>
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

On Wednesday 14 May 2008 03:25:22 pm Langsdorf, Mark wrote:
> > > RHEL4 doesn't support
> > > /sys/devices/system/cpu/cpu%u/cpufreq/affected_cpus and
> > > cpuspeed 1.2.1 requires them.  You need to revert to a
> > > previous version of cpuspeed, such as the one that came
> > > with your RHEL4 installation.  Current versions of RHEL4
> > > support SMP/CMP cpufreq with their native tools.
> >
> > Erm, RHEL4 has been shipping cpuspeed 1.2.1 since mid 2005...
> > From the kernel-utils changelog:
> >
> > * Mon Jun 20 2005 Dave Jones <davej@redhat.com>
> > - Update cpuspeed to 1.2.1, featuring improved dual-core/SMP support.
> > (#146179)
>
> Apologies for the misinformation.
>
> But I'm reasonably sure it isn't stock cpuspeed-1.2.1,
> which is what John apparently installed.

Yeah, its not 100% stock, but I don't see anything major we're patching in or 
out of it... Latest RHEL4.7 srpm:

http://people.redhat.com/jwilson/misc/kernel-utils-2.4-14.1.116.src.rpm


-- 
Jarod Wilson
jwilson@redhat.com
