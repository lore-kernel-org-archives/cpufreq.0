From: Len Brown <len.brown@intel.com>
Subject: Re: [PATCH] Longhaul - Add ignore_latency option
Date: Thu, 24 Aug 2006 15:54:11 -0400
Message-ID: <200608241554.11782.len.brown@intel.com>
References: <44DED1C4.7060108@interia.pl>
	<200608232322.19005.len.brown@intel.com>
	<44EDDF56.2060807@interia.pl>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44EDDF56.2060807@interia.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-2?q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Thursday 24 August 2006 13:18, you wrote:
> >> Some laptops with VIA C3 processor, CLE266 chipset and
> >> AMI BIOS have incorrect latency values in FADT table. These
> >> laptops seems to be C3 capable, but latency values are to
> >> big: 101 for C2 and 1017 for C3. This option will allow
> >> user to skip C3 latency test but not C3 address test. AMI
> >> BIOS is setting C3 address to correct value in DSDT table.
> > 
> > This looks very fishy.
> 
> So why P_BLK address is valid and have proper lenght?

One possible scenario is that the same BIOS source runs on
multiple hardware steppings.  If a broken stepping is found,
the BIOS writer knows that setting the latency above the
legal threshold is sufficient to disable the C-state in
all known ACPI-enabled operating systems, per below.

> > C2 latency above 100usec and C3 latency above 1000 usec
> > are the official way for the BIOS to tell the OS to NOT USE
> > those C-states.  Under no conditions should Linux second
> > guess those explicit instructions -- the BIOS may have put
> > those values there because you get silent data corruption
> > on that particular stepping of the processor or chipset
> > if they are enabled.
> > 
> 
> It is disabled by default.
> It is only needed for some laptops.
> As far I know there is no data corruption. Chipset and processor 
> are exacly the same as on Epia M10000 so I don't expect any.
> 
> Why force user to recompilation of distro kernel?

Why should a distro support this if the BIOS vendor disabled it?
Is the fact that you have not noticed data corruption a
sufficient test such that they can suport this?

> > But the real question is why the longhaul driver is checking
> > for C2 and C3 support in the first place -- as they are not
> > directly related to the availability of P-states.
> 
> Because Longhaul isn't using P-states.

I guess I don't understand what longhaul.c is doing.
Why is it using ACPI's C2 and C3 register addresses in order
to do frequency/voltage scaling?

In the case there those addresses have been deemed invalid for
the purpose of ACPI C-states, why are they still valid for longhaul?

-Len
