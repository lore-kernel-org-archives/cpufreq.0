From: Len Brown <lenb@kernel.org>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 2 Jan 2007 13:55:07 -0500
Message-ID: <200701021355.07564.lenb@kernel.org>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
	<20070102173601.GD7656@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070102173601.GD7656@redhat.com>
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
To: cpufreq@lists.linux.org.uk
Cc: Dave Jones <davej@redhat.com>, jorgen@greven.dk

On Tuesday 02 January 2007 12:36, Dave Jones wrote:
> On Tue, Jan 02, 2007 at 01:17:05PM +0100, jorgen@greven.dk wrote:
>  > Hi
>  > 
>  > I have just bought a nice little sbc mainboard with a Via C7 cpu. It run
>  > Centos with stock kernel 2.6.19.1 that I downloaded and installed a few
>  > days ago.
>  > But cpufreq does not work.
>  > 
>  > Can I in some way help with testing/debugging the cpufreq driver (centrino
>  > or longhaul?) for this cpu?
> 
> The C7 works fine with acpi-cpufreq if the correct BIOS tables are present.
> Support *could* be added to speedstep-centrino to use hardcoded tables
> for these CPUs for systems where the BIOSes lack them, but hasn't been
> done yet.
> 
> Given speedstep-centrino is due to be obsoleted by acpi-cpufreq at some stage,
> the feature of using hardcoded tables probably needs to be added to
> acpi-cpufreq at some point too.

(I view) the whole concept of acpi-cpufreq as the driver which uses the
tables provided by ACPI to talk to the hardware.  (and happily it actually
does what the name of the driver advertises:-)

(I view) speedstep-centrino as a historical artifact from the days before
Intel properly documented and helped the Linux community enable
(MSR-based) processor power management.

I view acpi-cpufreq as supportable.
I view speedstep-centrino as unsupportable.

I have no problem with the community having a driver someplace that does
undocumented hard-coded tables for a machine where acpi-cpufreq is for
some reason unable to do what they need.
But I'd very much like to keep those tables out of acpi-cpufreq.

That said, on the machine in question, please check BIOS SETUP to  see
if there are any options to enable Processor Power Management.  That
would be the ideal solution (though not knowing anything about the C7,
I don't know if it is likely that it has the knobs, and that the BIOS for
this platform knows how to turn them.)

thanks,
-Len
