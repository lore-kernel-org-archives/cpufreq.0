From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at
	driver	initialization
Date: Fri, 2 Dec 2005 06:38:02 +0200
Message-ID: <20051202043802.GA11942@sci.fi>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
	<20051130223038.GD3620@inferi.kami.home>
	<438E38B3.3080009@tremplin-utc.net>
	<20051201193147.GB4432@inferi.kami.home>
	<438F659B.3070103@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <438F659B.3070103@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

On Thu, Dec 01, 2005 at 10:05:31PM +0100, Eric Piel wrote:
> 01.12.2005 20:31, Mattia Dongili wrote/a =E9crit:
> >ok, updated patch attached (with a shiny diffstat!!). Looks a lot
> >nicer now :)
> >
> >Oh, what do you think of the request to report out-of-range frequencies
> >and set CPUFREQ_ETERNAL instead of setting an arbitrary high value? If
> >ok, shall I use my email address instead of the list's?
> >
> I was about to say this is fairly reasonable... until I tried it on my=20
> laptop and notice that _I_ got this message :-( Transition measured:=20
> 4500 nSec. It's probably because the clock source on my laptop is the=20
> TSC, which on this old processor stops during transition. Therefore,=20
> after being in the shoe of the poor user still not having the ondemand=20
> governor working, I'd tend to prefer if the fallback transition latency=20
> could be a high and safe, but still usable, value. Anyway, we _know_=20
> that those processors are not so slugish to do transition that it should =

> be considered "eternal" :-)
>=20
> So what about putting it to 500 uSec, knowing that on my 1GHz PIII it=20
> took something like 200uSec, it should be safe everywhere:

I'm going to jump in here with some measurements I got with=20
do_gettimeofday().

speedstep-ich on my 933 MHz Tualatin seems to agree with the 200 usec=20
figure.

speedstep-smi takes ~1670 usec on my 700 MHz Coppermine. That is when it=20
succeeds to change the frequency on the first try. That fails quite=20
often and with one retry the time goes up to ~72 msec (thanks to the=20
mdelay() in the loop). It will try to change the frequency six times=20
before giving up and at that point it may have wasted over one second.=20
Isn't that a "bit" too long to spend with irqs disabled?

--=20
Ville Syrj=E4l=E4
syrjala@sci.fi
http://www.sci.fi/~syrjala/
