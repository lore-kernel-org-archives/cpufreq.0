From: Keld =?iso-8859-1?Q?J=F8rn?= Simonsen <keld@dkuug.dk>
Subject: Re: Mobile Intel Celeron 2.0 GHz with ICH4 bridge
Date: Tue, 24 Feb 2004 17:26:21 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040224162621.GA32142@rap.rap.dk>
References: <20040223213619.GA4634@rap.rap.dk>
	<20040224082222.GA8123@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040224082222.GA8123@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Keld =?iso-8859-1?Q?J=F8rn?= Simonsen <keld@dkuug.dk>, cpufreq@www.linux.org.uk

On Tue, Feb 24, 2004 at 09:22:22AM +0100, Dominik Brodowski wrote:
> On Mon, Feb 23, 2004 at 10:36:19PM +0100, Keld J=F8rn Simonsen wrote:
> > Hi
> >=20
> > I have an Acer Travelmate 233 and I am trying to save some battery
> > power. Is that possible with cpufreq?=20
> >=20
> > The CPU is a Mobile Intel Celeron 2.0 GHz and the southbridge is an
> > Intel 82801DB 845G/GL Chipset ISA Bridge (ICH4)
> >=20
> > I run Mandrake 10.0 RC1 with kernel 2.6.2 and cpufreq 1.0.1,
> > unfortunately I get the following message:
> > cpufreq: Intel(R) SpeedStep(TM) for this chipset not (yet) available.
> > Is this because I am running an outdated version of cpufreq,
> > or just because the CPU is not recognized properly?
>=20
> The problem is that you have a Mobile Celeron which does not support
> SpeedStep. All you could get from cpufreq is Clock Throttling,
> (p4-clockmod), but this won't save you much in terms of battery power.

OK, understood.

> > Are there other ways to save power with this machine, on the CPU?
> ACPI processor support with working C1 and C2 idle states [check
> /proc/acpi/processor/*/power ]

As I can see it, my system already goes in autohalt. The normal=20
system power drainage is about 38 W, but I can measure the power use to
about 18 W when I do nothing, (with my harddisk in sleep, and my screen
turned to lowest intensity).

I understand that throttling is actually putting the CPU off power.
I would like to be able to shut off just the CPU, getting a savings of
about 7,5 W. Is this possible, is there a way to shut off the CPU while
having the screen and ram on power? What commands should I issue, or is
this something I need to make a program to do?

The idea is to shut off the CPU after it being idle for about a second,
and resuming the operation next time I touch the keyboard or the mouse.
1 second would allow normal typing or normal mouse movement to perform
as usual, while having the screen lit would give the impression of=20
the machine being on. Going from 18 W to about 11 W would give me about
2 hours more of battery time.

best regards
keld
