From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: my dothan didn't work with cpufreq...
Date: Fri, 23 Jul 2004 21:38:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040723193859.GC8441@dominikbrodowski.de>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
	<1090517665.5267.9.camel@ixodes.goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090517665.5267.9.camel@ixodes.goop.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Thu, Jul 22, 2004 at 10:34:25AM -0700, Jeremy Fitzhardinge wrote:
> > > +static const struct cpu_id cpu_ids[] = {
> > > +	[CPU_BANIAS]	= { X86_VENDOR_INTEL,	6,  9, 5 },
> > > +	[CPU_DOTHAN_A1]	= { X86_VENDOR_INTEL,	6, 13, 1 },
> > > +	[CPU_DOTHAN_B0]	= { X86_VENDOR_INTEL,	6, 13, 6 },
> > 
> > Hm, I'm unsure whether this is proper CodingStyle... IIRC, much effort was
> > spent in converting such { }s to include the respective "fields", like
> > 	{ .x86_vendor = X86_VENDOR_INTEL, x86_family = 6 ... 
> > and so on.
> 
> For a tiny little structure like this, which is defined immediately
> above, this is fine. (CodingStyle makes no mention of structure
> initialization.)

Again IIRC, it's less about CodingStyle and more about some GCC 3.?
warnings? Though, gcc 3.3.4 doesn't complain...

	Dominik
