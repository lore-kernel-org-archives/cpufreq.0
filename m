From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Re: powernow-k8 on Athlon64 3200+ (s939) stability problem...
Date: Tue, 26 Apr 2005 09:18:02 +0200
Message-ID: <200504260918.02662.pytasz@lodz.home.pl>
References: <84EA05E2CA77634C82730353CBE3A843023AE1D6@SAUSEXMB1.amd.com>
Reply-To: pytasz@lodz.home.pl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843023AE1D6@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hi,

On Tuesday 05 of April 2005 17:16, Devriendt, Paul wrote:
> > I am not 100% certain about it, but I think it hangs/reboots
> > "on return" to
> > high frequency (or at least when the frequency is low and I
> > start lots of
> > applications or start using gcc)
> >
> > I was wondering how to check if it is a hardware problem (for
> > example too low
> > voltage from mainboard, deffective CPU,... ) or something in
> > the system.
>
> If you configure CPUFreq for debug, the powernow-k8 driver will
> output which frequencies/voltages it is using at startup. These
> can be compared against the published values for your processor.
> This would eliminate the question of a BIOS problem where the
> BIOS might be supplying bad data.
>
> If you can get the debug output going over a serial console, then
> you can verify what it was doing when it dies. I assume you can
> manually change to a higher frequency successfully.
>
> How many DIMM slots do you have, and are they fully populated ?
> Try removing some of the DRAM so that now all slots are populated
> and see if the systems is any more stable.
>
> Paul.

=46inally I got something that could lead to a conclusion about my stabilit=
y=20
problem. Well, I think there is nothing wrong with powernow nor the ondeman=
d=20
govenor (transitions seem to work fine). I tried starting it when the syste=
m=20
is "warm" (as well as using powernowd with userspace govenor), system is=20
fully stable, but when any of those is loaded on (cold) startup system is=20
badly unstable, last thing I can see in the console (after transition from=
=20
low frequency to high, rewritten by hand) is:

CPU0: Machine check exception: 4Bank0 f614c00(zeroes)0135
TSC 3456e2e319=20
Addr 1c0cbdc0

Am I right it would be a memory problem?
I have one 512MB PC3100 non ECC module, Hynix.

Micha=B3
