From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Mon, 3 Jul 2006 12:52:20 -0400
Message-ID: <20060703165220.GM14292@redhat.com>
References: <44A8A894.7020907@interia.pl> <20060703141148.GK14292@redhat.com>
	<44A93F07.3020905@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A93F07.3020905@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jul 03, 2006 at 06:00:07PM +0200, Rafa=C5=82 Bilski wrote:

 > > It's not unfeasible for an SMP kernel to be run on UP hardware,
 > > (and several distros are shipping SMP kernels as default)
 > > so I'm in two minds about removing the !SMP check, and making it be a
 > >=20
 > > 	if (num_online_cpus() > 1)
 > > 		return -ENODEV;
 > >=20
 > > in the init routine.
 > >=20
 > > Thoughts?
 > >=20
 > > 		Dave
 > >=20
 >=20
 > It is good idea, but I think there should be check for APIC too,=20
 > but I don't know how to make it. !X86_UP_APIC is for non SMP=20
 > kernels only. It is possible that in this case there will be=20
 > SMP kernel running on single processor with APIC enabled.=20
 > I don't know much about APIC, but as far I know we are poking=20
 > PIC registers direcly and in such case not all interrupts will
 > be disabled.

I wonder if this could be solved with something as trivial as..

	if (cpu_has_apic)
		disable_local_APIC()

	...

	if (cpu_has_apic)
		enable_local_APIC()

We should probably also avoid touching the PIC if we're in APIC mode
with something like..

    if (pic_mode =3D=3D 1) {
		...
		PIC poking goes here..
	}

(Will also need to EXPORT_SYMBOL(pic_mode) from mpparse.c)

		Dave

--=20
http://www.codemonkey.org.uk
