From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] problems with Athlon64 X2 (dual core)
Date: Sat, 12 Nov 2005 21:09:39 +0100
Message-ID: <43764C03.9030506@tremplin-utc.net>
References: <200511121833.47055.bernd.paysan@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200511121833.47055.bernd.paysan@gmx.de>
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
To: Bernd Paysan <bernd.paysan@gmx.de>
Cc: cpufreq@lists.linux.org.uk

12.11.2005 18:33, Bernd Paysan wrote/a =C3=A9crit:
> [already posted as bug report on the sourceforge page]
>=20
> Hi, =20
>  =20
> As far as I can tell, cpufreq/powersaved (of 0.10.15.1, as in=20
> SuSE 10.0) seems to have a  severe problem with the=20
> Athlon64 X2 dual core chips. If I load just one core, the=20
> CPU frequency boost is unreliable (toggles  between 1GHz=20
> and 2GHz). Loading the second core, too, sort-of-fixes that=20
> problem. =20
> =20
> The reason is obvious: The Athlon X2 has a *single* CPU =20
> frequency setting which affects *both* cores. So you can't =20
> simply use a SMP setting, treating the two CPUs as two =20
> processors with two speed settings, you have to know that =20
> it's a dual-core CPU, and that you can't independently set =20
> the CPU frequency. If one core is loaded, both must run at =20
> double frequency. =20
>  =20
> Note that the kernel does know about this fact: =20
>  =20
> /sys/devices/system/cpu/cpu0/cpufreq> cat affected_cpus  =20
> 0 1 =20
> /sys/devices/system/cpu/cpu1/cpufreq> cat affected_cpus  =20
> 0 1 =20
>  =20
> Setting powersaved to be more verbose confirms the =20
> confusion (the following is with one core loaded by an =20
> endless loop, the other core loaded lightly): =20
>  =20
Hey,

You've probably mistook with the list, it's only about the kernel=20
implementation of cpufreq.

cheers,
Eric
