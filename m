From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Wed, 9 Jun 2004 17:47:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040609154710.GA9482@dominikbrodowski.de>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0044235819=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <40C6517E.1090708@cern.ch>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: holbling@cpt.univ-mrs.fr
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============0044235819==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

> for 3): what you say sounds much better than my brutal hack, so i won't=
=20
> post it again. i'd definitely want to try to implement 2 cpufreq=20
> drivers, but i fear this is way beyond me at the moment and probably=20
> involves design choices i can't make.

well, somebody _does_ have to do design choices... However, I'm not yet
convinced of the necessity of supporting throttling and frequency scaling on
the same system. Even more, under normal circumstances [i.e. idling works,
which it does on most systems], I see no _technical_ reason to do
throttling, or even non-temperature related _dynamic throttling_ like other
OSes do it. For those new to this list, there's some maths in the archives
which proves that you need more energy =3D=3D battery power if you do
throttling for any given task... So it's something we need to discuss=20
during 2.7.



Now, about your patch 1):

> diff --unified --recursive --new-file linux-2.6.5/arch/i386/kernel/cpu/cp=
ufreq/speedstep-lib.c linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/sp=
eedstep-lib.c
> --- linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-07 2=
0:49:36.000000000 +0000
> +++ linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	20=
04-06-08 22:56:06.911397232 +0000
> @@ -210,8 +210,17 @@
>  		ebx =3D cpuid_ebx(0x00000001);
>  		ebx &=3D 0x000000FF;
> =20
> -		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask=
);
> +		dprintk(KERN_INFO "ebx value is %x\n", ebx);
> =20
> +		dprintk(KERN_INFO "model_id is %s\n", c->x86_model_id);
> +	=09
> +		/*
> +		 * If the x86_model_id string contais "Mobile Intel(R) Pentium(R) 4"
> +                 * omit all other checks and treat the CPU as a M-P4-M
> +		 */
> +		if (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") !=3D NULL)
> +		       return SPEEDSTEP_PROCESSOR_P4M;
> +	=09

I'm not sure I like this approach: Intel is too relaxed with regard to their
branding of mobile intel pentiums. There are pentium 3-m, mobile pentium
3-m, pentium 4-m, mobile pentium 4, and  so on. And some -- which even have
"mobile" in their name" -- do not support SpeedStep. THe CPUID [and some
msr's for p3s] have proven to be more accurate in detecting speedstep
capabilities. So I'd like to keep it that way, especially as the CPUID tends
to change if features are changed; but the model_id string may stay the same
for (future) processors which do no longer do speedstep in the way it is
currently implemented in speedstep-ich.


>  		switch (c->x86_mask) {
>  		case 4:=20
>  			/*
> @@ -248,6 +257,7 @@
>  			 * So, how to distinguish all those processors with
>  			 * ebx=3D0xf? I don't know. Sort them out, and wait
>  			 * for someone to complain.
> +			 * also, M-P4M HTs actually have ebx=3D0x8, too
>  			 */
>  			if (ebx =3D=3D 0x0e)
>  				return SPEEDSTEP_PROCESSOR_P4M;

So I'd prefer, due to the nastiness of the CPUID in the specific 0x0F29 cas=
e,
to move the strstr check to this specific case -- e.g. have

			if (ebx =3D=3D 0x0e)
				return SPEEDSTEP_PROCESSOR_P4M;
			if (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") !=3D NULL)
				return SPEEDSTEP_PROCESSOR_P4M;


Could you update your patch accordingly, please?


Now, about your patch 2) [slightly re-ordered]:

> -unsigned int speedstep_get_freqs(unsigned int processor,
> +unsigned int speedstep_get_freqs(unsigned int cpu,
> +				  unsigned int processor,
>  				  unsigned int *low_speed,
>  				  unsigned int *high_speed,
> -				  void (*set_state) (unsigned int state,
> +				  void (*set_state) (unsigned int cpu,
> +						     unsigned int state,
>  						     unsigned int notify)

This will break speedstep-smi, as it uses speedstep_get_freqs too...

> +	/* switch to physical CPU where state is to be changed*/
> +	cpus_allowed =3D current->cpus_allowed;
> +
> +	/* only run on CPU to be set, or on its sibling */
> +       affected_cpu_map =3D cpumask_of_cpu(cpu);
> +#ifdef CONFIG_X86_HT
> +	hyperthreading =3D ((cpu_has_ht) && (smp_num_siblings =3D=3D 2));
> +	if (hyperthreading) {
> +		sibling =3D cpu_sibling_map[cpu];
> +                cpu_set(sibling, affected_cpu_map);
> +	}
> +#endif
> +	set_cpus_allowed(current, affected_cpu_map);
> +        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));

Due to changes to cpu_sibling_map [it's a cpumask_t now], this won't
generate appropriate code [if it even compiles] on 2.6.7-rc3. See in
p4-clockmod.c how "easy" it becomes now.

> +       affected_cpu_map =3D cpumask_of_cpu(cpu);
> +#ifdef CONFIG_X86_HT
> +	hyperthreading =3D ((cpu_has_ht) && (smp_num_siblings =3D=3D 2));
> +	if (hyperthreading) {
> +		sibling =3D cpu_sibling_map[cpu];
> +                cpu_set(sibling, affected_cpu_map);
> +	}
> +#endif
> +	set_cpus_allowed(current, affected_cpu_map);
> +        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));

Same here.

> -	/* capability check */
> -	if (policy->cpu !=3D 0)
> -		return -ENODEV;

For the time being, this should be kept. Else you can load two different
governors, or set two different frequencies, on both siblings. Obviously,
it'll break. I'll try to fix it in the 2.6.8 timeframe...


Thanks,
	Dominik

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAxzD+Z8MDCHJbN8YRAtHYAKCDjZaxvtYYGW9Cz13sfcLPppM6zgCdFN3C
e500gTTu+JtnVrb8pDbpaAk=
=I/5Z
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--


--===============0044235819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0044235819==--

