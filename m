From: Len Brown <len.brown@intel.com>
Subject: Re: [SchreiberX@Altmuehlnet.de: Re: hp omnibook xe4500 hangs while
	loading acpi module]
Date: 15 Jan 2004 17:15:48 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1074204948.3582.2.camel@dhcppc4>
References: <BF1FE1855350A0479097B3A0D2A80EE0CC894B@hdsmsx402.hd.intel.com>
	<20031229115624.GA4489@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031229115624.GA4489@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Martin Schreiber <SchreiberX@Altmuehlnet.de>, cpufreq@www.linux.org.uk


On Mon, 2003-12-29 at 06:56, Dominik Brodowski wrote:
> On Tue, Dec 23, 2003 at 01:31:30AM -0500, Brown, Len wrote:
> > This was  http://bugzilla.kernel.org/show_bug.cgi?id=1349
> > The fix is in current 2.4.24, and the latest ACPI patch for 2.6.0:
> > 
> > http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/patches/release/
> > 2.6.0/
> > 
> > Cheers,
> > -Len
> > 
> > Ps. Sorry I didn't reply earlier, I got bounced off this list for a
> > spell.
> 
> AFAICS, Veki's patch isn't in acpi-20031203-2.6.0.diff.gz.
> 
> 	Dominik

oops -- looks like i applied it to 24 but didn't roll in the 26 version.

Here's the broken out 26 patch -- it will be rolled in tonight.

http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/patches/test/2.6.0/20040115170330-processor.patch

thanks,
-Len
