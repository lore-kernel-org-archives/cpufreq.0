From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: ondemand and p3-m
Date: Sat, 21 Jan 2006 00:15:04 +0100
Message-ID: <43D16EF8.3070502@tremplin-utc.net>
References: <1137795365.28411.30.camel@littledragon>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1137795365.28411.30.camel@littledragon>
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
To: Niko Ehrenfeuchter <ehrenfeu@informatik.uni-freiburg.de>
Cc: cpufreq@lists.linux.org.uk

20.01.2006 23:16, Niko Ehrenfeuchter wrote/a =C3=A9crit:
> Hi all,
>=20
> I'm currently trying to get the ondemand-governor working with my PIII-M
> (1133 MHz). The system is a ThinkPad X24 using the Intel 830 chipset,
> kernel 2.6.15.1 with the corresponding (stable) acpi-patch.
>=20
> While using the speedstep-ich module works for userspace stuff, echoing
> "ondemand" into scaling_governor simply yields an invalid argument
> error. Latency issue, I assume...? Turning on cpufreq's debug mode
> doesn't tell anything why it won't use the ondemand gov.
>=20
> Looked through the archive for that issue, but I haven't been _that_
> successful, since it lacks some kind of search function... The only
> thing I've discovered was a thread in october where Eric Piel posted a
> patch for the first-generation 440BX speedstep. Is this patch included
> in the current kernel? Should it work for me too?
>=20
> Any hints?
Hi!

Which driver do you use? Is it speedstep-ich? If so, it's now available=20
in vanilla kernel since... 2.6.16-rc1, slightly too bleding edge for=20
common mortals but it means it's coming soon!

If you don't want to wait, you can just apply the 2 patches of Mattia=20
Dongili on a 2.6.15. ("Move PMBASE..." and "Measure transition latency=20
at driver initialization" _updated_)

c u
Eric
