From: Dave Jones <davej@redhat.com>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Thu, 23 Dec 2004 18:33:17 -0500
Message-ID: <20041223233317.GF32326@redhat.com>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
	<20041222203136.GB21861@redhat.com>
	<1103769532.16431.52.camel@localhost>
	<20041223182424.GA32326@redhat.com>
	<1103832303.16431.60.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1103832303.16431.60.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Thu, Dec 23, 2004 at 12:05:03PM -0800, Jeremy Fitzhardinge wrote:

 > Sebastian is reporting the problem with speedfreqd, which will use the
 > same number of steps both ways (and, depending on the CPU load curve, at
 > the same rate).
 > 
 > Does rate-limiting the transitions help stability?

that's something worth trying maybe.

 > > We're not doing voltage scaling in longhaul yet, but that shouldn't
 > > matter, as we should be booting at max voltage (as we boot at max speed)
 > 
 > Is voltage switching complex?  It might be worth trying - its not
 > something which normally improves stability, but maybe there's some
 > regulator issue under load changes, or something...

With longhaul, its a little more complicated than it is with powernow,
as theres no bios table telling us which voltage should be used
for each frequency, and they vary depending on stepping & speed of the part.
The first version of the longhaul driver did actually do voltage scaling,
but the 'match the voltage to the speed' code was very crude, and
assumed that the voltage table was 1:1 with the frequency, which
worked for the most part, but was far from being 'the right thing'.

I'm not convinced that adding it back in would fix the stability problems.
If anything, it would add another variable.

		Dave
