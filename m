From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Mon, 03 Jul 2006 19:39:32 +0200
Message-ID: <44A95654.7000204@interia.pl>
References: <44A8A894.7020907@interia.pl> <20060703141148.GK14292@redhat.com>
	<44A93F07.3020905@interia.pl> <20060703165220.GM14292@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060703165220.GM14292@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

>  > It is good idea, but I think there should be check for APIC too,=20
>  > but I don't know how to make it. !X86_UP_APIC is for non SMP=20
>  > kernels only. It is possible that in this case there will be=20
>  > SMP kernel running on single processor with APIC enabled.=20
>  > I don't know much about APIC, but as far I know we are poking=20
>  > PIC registers direcly and in such case not all interrupts will
>  > be disabled.
>=20
> I wonder if this could be solved with something as trivial as..
>=20
> 	if (cpu_has_apic)
> 		disable_local_APIC()
>=20
> 	...
>=20
> 	if (cpu_has_apic)
> 		enable_local_APIC()
> [...]

Wow! But I don't see this symbols exported to modules.
There are functions lapic_suspend / lapic_resume in apic dev=20
interface, but do this functions do what we need?

> We should probably also avoid touching the PIC if we're in APIC mode
> with something like..
>=20
>     if (pic_mode =3D=3D 1) {
> 		...
> 		PIC poking goes here..
> 	}
>=20
> (Will also need to EXPORT_SYMBOL(pic_mode) from mpparse.c)
>=20
> 		Dave
>=20

We really need to touch PIC. If we can't then we can't change frequency.

Rafa=B3


------------------------------------------------------------------------
Wyje=BFd=BFasz na wakacje? Zaplanuj tras=EA z map24.=20
http://map24.interia.pl
