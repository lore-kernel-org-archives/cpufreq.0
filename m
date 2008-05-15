From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Remove deprecated speedstep-centrino driver
Date: Thu, 15 May 2008 12:58:25 +0200
Message-ID: <20080515105825.GC8015@dominikbrodowski.net>
References: <20080511161845.GH15445@codemonkey.org.uk>
	<4827F6A6.8070909@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4827F6A6.8070909@goop.org>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq <cpufreq@lists.linux.org.uk>

On Mon, May 12, 2008 at 08:49:58AM +0100, Jeremy Fitzhardinge wrote:
> Dave Jones wrote:
> > On Sat, May 03, 2008 at 09:53:21PM +0200, Thomas Renninger wrote:
> >  > Remove deprecated speedstep-centrino driver
> >  >
> >  > Not 100% sure whether there are machines out there that still need the
> >  > static Banias tables, Venkatesh?
> >
> > Hmm, if we decide to remove this for 2.6.27, I think we should
> > get a printk into .26 on module load to say that it's going away.
> > This likely has more valid use cases than the clockmod driver, so I
> > think a heads-up to any potential users of it who still haven't seen
> > the warning in the Kconfig might be a good idea.
> >   
> 
> The one function difference from cpufreq_acpi is that it doens't rely on 
> acpi.  On my laptop of the time that was a useful distinction, but it 
> may have been more due to the shoddy state of acpi in Linux rather than 
> the BIOS.

And that's the reason why I'd propose to keep it unless ACPI is actually
required to be set to "y" on those systems -- which I doubt.

Best,
	Dominik
