From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Mon, 03 Jul 2006 18:00:07 +0200
Message-ID: <44A93F07.3020905@interia.pl>
References: <44A8A894.7020907@interia.pl> <20060703141148.GK14292@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060703141148.GK14292@redhat.com>
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

> [...]
>=20
> It's not unfeasible for an SMP kernel to be run on UP hardware,
> (and several distros are shipping SMP kernels as default)
> so I'm in two minds about removing the !SMP check, and making it be a
>=20
> 	if (num_online_cpus() > 1)
> 		return -ENODEV;
>=20
> in the init routine.
>=20
> Thoughts?
>=20
> 		Dave
>=20

It is good idea, but I think there should be check for APIC too,=20
but I don't know how to make it. !X86_UP_APIC is for non SMP=20
kernels only. It is possible that in this case there will be=20
SMP kernel running on single processor with APIC enabled.=20
I don't know much about APIC, but as far I know we are poking=20
PIC registers direcly and in such case not all interrupts will
be disabled.

Rafa=B3


------------------------------------------------------------------------
Znajd=BC kr=F3tsz=B1 drog=EA do pracy!
http://map24.interia.pl - interaktywny planer podr=F3=BFy.
