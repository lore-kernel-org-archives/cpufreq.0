From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH 2/2] Measure transition latency at driver initialization
Date: Wed, 30 Nov 2005 12:46:25 +0100
Message-ID: <438D9111.2000306@tremplin-utc.net>
References: <11333087111183-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <11333087111183-git-send-email-malattia@linux.it>
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

As stated before, the whole idea is probably good, at least it should=20
finally get rid of CPUFREQ_ETERNAL transition. BTW, maybe some other=20
drivers could benefit of the same approach :-)

However, I disagree a bit with the implementation:
* don't make it a module parameter: either this aproach works and the=20
module should always use it or it doesn't. The problem with parameters=20
is that only few users will end up using this feature.

* You should add a test to check that the transition measurement didn't=20
go wrong. It would be a pitty that a user burns his CPU simply because=20
the resolution of gettimeofday() was not good enough ;-) cf in the code

* At initialisation, the driver already changes twice of frequency (in=20
speedstep_get_freqs()). No need to change twice more to measure the=20
transitions! We should put the time measurement inside=20
speedstep_get_freqs() or inside __speedstep_set_state(). Just check if=20
transition_latency =3D=3D CPUFREQ_ETERNAL, if so, do the measurement.

Few more comments below.



11/30/2005 12:58 AM, Mattia Dongili wrote/a =C3=A9crit:
:
> =20
> @@ -128,11 +127,8 @@ static void speedstep_set_state (unsigne
>  	/* check if transition was successful */
>  	value =3D inb(pmbase + 0x50);
> =20
> -	/* Enable IRQs */
> -	local_irq_restore(flags);
> -
>  	dprintk("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
> -
> +=09
Watch out not to insert non needed tabs ;-)

:
> =20
>  /**
>   * speedstep_activate - activate SpeedStep control in the chipset
> @@ -320,6 +378,7 @@ static int speedstep_cpu_init(struct cpu
>  {
>  	int result =3D 0;
>  	unsigned int speed;
> +	unsigned int transition_latency =3D CPUFREQ_ETERNAL;
>  	cpumask_t cpus_allowed;
> =20
>  	/* only run on CPU to be set, or on its sibling */
> @@ -334,7 +393,7 @@ static int speedstep_cpu_init(struct cpu
>  	result =3D speedstep_get_freqs(speedstep_processor,
>  				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
>  				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
> -				     &speedstep_set_state);
> +				     &__speedstep_set_state);
>  	set_cpus_allowed(current, cpus_allowed);
>  	if (result)
>  		return result;
> @@ -348,9 +407,14 @@ static int speedstep_cpu_init(struct cpu
>  		(speed =3D=3D speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "hig=
h",
>  		(speed / 1000));
> =20
> +	if (measure_latency) {
> +		transition_latency =3D speedstep_measure_latency() * 1000;
> +		dprintk("measured transition latency is %u mS\n", transition_latency);
> +	}
> +=09
The measurement was done only once, while transition_latency should be=20
the maximum possible. It's safer to multiply the measurement by some=20
factor. As we've noticed it's very stable, maybe 120% should be OK:
/*
  * converts from microseconds to nanoseconds and add 20% security margin
  */
transition_latency =3D speedstep_measure_latency() * 1200;

Additionally, I'd like to see some security test like this:
/* does the measurement seem to have reasonable value ? */
if ((transition_latency > 10000000) || (transition_latency < 50000))
	transition_latency =3D 500000; /* 500us is a very high guess */

:


cu,
Eric
