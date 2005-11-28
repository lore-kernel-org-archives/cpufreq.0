From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Tue, 29 Nov 2005 00:35:07 +0100
Message-ID: <438B942B.2090100@tremplin-utc.net>
References: <88056F38E9E48644A0F562A38C64FB600671185B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600671185B@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

28.11.2005 23:19, Pallipadi, Venkatesh wrote/a =E9crit:
>>-----Original Message-----
>>From: Mattia Dongili [mailto:malattia@linux.it]=20
>>
>>I just build speedstep-ich with transition_latency =3D 250
>>I'll let you know how it goes. Are you interested?
Actually, the ondemand governor is quite safe on this side and multiply=20
this value by 1000, so it shouldn't bring any problem anyway :-)

>>Maybe it's already been discussed, but how bad would be trying to
>>measure transition latency at runtime?
>>
>=20
>=20
>=20
> Yes. I was thinking the same thing. As this latency may be different on P=
3-M and P4-M, may be we can do with a measurement at boot time and use it, =
rather than hardcoding these values. However, I think we will have to do th=
at by using gettimeofday or some such higherlevel call instead of using pmt=
imer as pmtimer may not be available on all systems at all times. Otherwise=
, we may end up all sort of pmtimer/pit/hpet timer code in this driver.
>=20
Sounds interesting :-) Especially as speedstep-ich already does at least=20
2 frequency transitions while initialising, it should be fairly easy to=20
implement. I'm more concerned about the time measurement. What could be=20
done is to use gettimeofday() and check that the result is reasonable=20
(not too big nor too small), if it's not we just put something=20
conservative, like 500us.

Eric
