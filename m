From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: new cpufreq device driver for nForce4
Date: Thu, 17 Nov 2005 09:25:50 +0100
Message-ID: <437C3E8E.4090502@tremplin-utc.net>
References: <200511141243.12113.shaposh@isp.nsc.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200511141243.12113.shaposh@isp.nsc.ru>
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
To: Alexander Shaposhnikov <shaposh@isp.nsc.ru>
Cc: cpufreq@lists.linux.org.uk

14.11.2005 10:43, Alexander Shaposhnikov wrote/a =C3=A9crit:
> Hellow.
>=20
> I have  written  cpufreq device  driver for FSB, voltage and multiplier=20
> changing on nVidia nForce4 -based motherboards.
> It is very amateur thing in the present state, i use it primarily for=20
> overclocking  my dual dualcore Opteron system:). But it may be used for p=
ower
> saving as well.=20
Hello Alexander,

I think in general every new driver is welcome. It doesn't matter if it=20
looks amateur, a few iterations on the mailing list and it won't ;-) One=20
important thing though, how dangerous is your driver? I mean, knowing=20
you use it for overclocking, if someone use it without any knowledge of=20
his hardware, can the driver lead to burn the CPU? If so, IMHO, it=20
really requires you to insert some additional code to forbid=20
overclocking by defaulf (and authorise it only via a special module=20
parameter or a sysfs entry for example).

>=20
> If there will be some interest in this i will continue my work on it and =
make=20
> it more robust, though it already works great for me.
Actually I know only very little about cpufreq, but your driver looks=20
good, you should keep going!

>=20
> I've attached the code.
Probably the reason no one answered is that you put it in a tar.bz2 .=20
Only plain text is read! Actually, it could be even better if you attach=20
a patch, so that just with "patch -p1 < your-nforce4.patch" it could go=20
into the kernel :-) Please read Documentation/SubmittingPatches. You=20
might want to also send the small required modifications to Kconfig and=20
Makefile.

Also, it is very important you conform to the coding style, cf=20
Documentation/CodingStyle. In paticular, the names of the functions and=20
variables are in lowercase only, don't put "{" and "}" in if's and for's=20
with only one statement, put spaces around "=3D" ...

Ok, now just some very small comments:
>=20
> static int CK804_cpu_init(struct cpufreq_policy *policy)
> {
> 	struct K8_STATUS_MSR status_msr;
>=20
>=20
> 	if(!cpu_online(policy->cpu))
> 		return -ENODEV;
>=20
> 	status_msr.cpu=3Dpolicy->cpu;
> 	GET_STATUS_MSR(&status_msr);
>=20
> 	policy->cpus=3DAFFECTED_CPUS;
> =09
> 	policy->cpuinfo.min_freq =3D PLL_MIN_FSB*FID_to_MUL(K8_MIN_FID);
> 	if(ALG!=3D3)
Avoid magic numbers! Use "#define"'s to express the meaning of the=20
constants.

> 	{
> 		policy->cpuinfo.max_freq =3D PLL_MAX_FSB*FID_to_MUL(status_msr.max_fid);
> 	}
> 	else
> 	{
> 		policy->cpuinfo.max_freq =3D 0x3FF*PLL_REF_CLOCK*FID_to_MUL(status_msr.=
max_fid)/0x300;
> 	}
>=20
> 	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
Please, try to put a real value here, some value which you are _sure_=20
that will never take so much time to change of frequency. If you put=20
CPUFREQ_ETERNAL then your driver will not be compatible with the=20
ondemand and conservative governors.

:
> static struct cpufreq_driver CK804_driver =3D {
> 	.name   =3D "cpufreq_nForce4",
There is a already a driver for the nForce2 wich is called "nforce2",=20
for consistency, you might want to rename yours to "nforce4".

> 	.verify =3D CK804_verify,
> 	.target =3D CK804_target,
> 	.get    =3D CK804_get,
> 	.init   =3D CK804_cpu_init,
> 	.exit   =3D CK804_cpu_exit,
> 	.owner  =3D THIS_MODULE,
> };
>=20

c u
Eric
