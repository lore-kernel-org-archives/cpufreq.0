From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at
	driver	initialization
Date: Thu, 01 Dec 2005 22:05:31 +0100
Message-ID: <438F659B.3070103@tremplin-utc.net>
References: <11333087111183-git-send-email-malattia@linux.it>	<438D9111.2000306@tremplin-utc.net>	<20051130223038.GD3620@inferi.kami.home>	<438E38B3.3080009@tremplin-utc.net>
	<20051201193147.GB4432@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051201193147.GB4432@inferi.kami.home>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

01.12.2005 20:31, Mattia Dongili wrote/a =C3=A9crit:
> ok, updated patch attached (with a shiny diffstat!!). Looks a lot
> nicer now :)
>=20
> Oh, what do you think of the request to report out-of-range frequencies
> and set CPUFREQ_ETERNAL instead of setting an arbitrary high value? If
> ok, shall I use my email address instead of the list's?
>=20
I was about to say this is fairly reasonable... until I tried it on my=20
laptop and notice that _I_ got this message :-( Transition measured:=20
4500 nSec. It's probably because the clock source on my laptop is the=20
TSC, which on this old processor stops during transition. Therefore,=20
after being in the shoe of the poor user still not having the ondemand=20
governor working, I'd tend to prefer if the fallback transition latency=20
could be a high and safe, but still usable, value. Anyway, we _know_=20
that those processors are not so slugish to do transition that it should=20
be considered "eternal" :-)

So what about putting it to 500 uSec, knowing that on my 1GHz PIII it=20
took something like 200uSec, it should be safe everywhere:


:
> +	/* sanytize the latency measurement if too high or too low
> +	 * and ask for reports of out-of-range values
> +	 */
> +	if (*transition_latency > 10000000 || *transition_latency < 50000) {
> +		printk (KERN_ERR "CPUFreq: measured latency of the frequency transitio=
n out "
> +				"of range, please report the following value to "
> +				"cpufreq@lists.linux.org.uk\n%u nSec\n", *transition_latency);
> +		*transition_latency =3D CPUFREQ_ETERNAL;
> +	}
It would be something like:
*transition_latency =3D 500000;
KERN_WARNING "speedstep: frequency transition measured seems out of "
              "range, falling back to a safe one of %u nSec.\n",=20
*transition_latency


Eric
