From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH 2/2] Measure transition latency at driver initialization
Date: Thu, 01 Dec 2005 00:41:39 +0100
Message-ID: <438E38B3.3080009@tremplin-utc.net>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
	<20051130223038.GD3620@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051130223038.GD3620@inferi.kami.home>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

30.11.2005 23:30, Mattia Dongili wrote/a =C3=A9crit:
> Hello Eric!
>=20
> On Wed, Nov 30, 2005 at 12:46:25PM +0100, Eric Piel wrote:
>=20
>>As stated before, the whole idea is probably good, at least it should=20
>>finally get rid of CPUFREQ_ETERNAL transition. BTW, maybe some other=20
>>drivers could benefit of the same approach :-)
>=20
>=20
> grepping around I've just seen that CPUFREQ_ETERNAL is much more in use
> than I expected! It's a shame so few people can benefit from
> ondemand/conservative governors...
Well, finding out the maximum transition is quite difficult (as the=20
technical papers usually don't describe it directly). Once we've done=20
with speedstep we could try to bother some other drivers, but let's stay=20
concentrated ;-)

:
>>* At initialisation, the driver already changes twice of frequency (in=20
>>speedstep_get_freqs()). No need to change twice more to measure the=20
>=20
>=20
> I have a patch ready that does it in speedstep_get_freqs but it
> looks ugly, it adds a lot of do_gettimeofay's around... It's probably
> still not optimal and maybe trying to think of it as a more general
> solution (from which all of the drivers could also benefit) should
> result in nicer code.
IMHO, this patch looks already quite good. Granted, the=20
speedstep_get_freqs() contains too many do_gettimeofday()s. Why not=20
removing all the MAX() stuff and triple measurements and only measure=20
set_state(SPEEDSTEP_HIGH) ? It will always do a _real_ transition, and=20
we've noticed that transitions from high to low or from low to high are=20
similar in term of duration.

> I also had to modify speedstep-smi that still doesn't benefit 100% of
> the times of the feature.
Indeed, only buggy systems will benefit of it, quite weird! Well, let's=20
keep the things simple for now. If Venki and/or Dave approve your=20
patches, then in a second time, we could try to generalise this idea (to=20
all speedstep-smi and even more).


>>transitions! We should put the time measurement inside=20
>>speedstep_get_freqs() or inside __speedstep_set_state(). Just check if=20
>>transition_latency =3D=3D CPUFREQ_ETERNAL, if so, do the measurement.
>=20
>=20
> well, in speedstep_get_freqs the above check is not really necessary, as
> the only current paths reaching that function will return true.
Sure :-)

>=20
> Oh, and do you think __speedstep_set_state should remain? The reason I
> added it was to avoid disabling interrupts twice. The attached
> implementation without it is in fact a little less precise (values
> have increased of ~25-30uSec on my PIIIM)
You're right, __speedstep_set_state() is probably not needed. Actually,=20
in speedstep_get_freqs(), local_irq_save()/local_irq_restore() could go=20
away as all the set_state() functions do it internally.

Concerning the precision, this is probably even better now. What we are=20
really interested in is how long the _whole_ latency transition impacts=20
the system. So if the transition contains the irq stuff, it should be=20
measured too.

c u
Eric
