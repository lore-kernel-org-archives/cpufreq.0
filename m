From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Add ignore_latency option
Date: Thu, 24 Aug 2006 23:09:34 +0200
Message-ID: <44EE158E.6050601@interia.pl>
References: <44DED1C4.7060108@interia.pl>
	<200608232322.19005.len.brown@intel.com>
	<44EDDF56.2060807@interia.pl>
	<200608241554.11782.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200608241554.11782.len.brown@intel.com>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk

[...]
>> So why P_BLK address is valid and have proper lenght?
>=20
> One possible scenario is that the same BIOS source runs on
> multiple hardware steppings.  If a broken stepping is found,
> the BIOS writer knows that setting the latency above the
> legal threshold is sufficient to disable the C-state in
> all known ACPI-enabled operating systems, per below.
>=20
[...]
>>
>> Why force user to recompilation of distro kernel?
>=20
> Why should a distro support this if the BIOS vendor disabled it?
> Is the fact that you have not noticed data corruption a
> sufficient test such that they can suport this?
>=20

This is only BIOS that is saying this. Other are saying that this=20
combination is C3 capable. What test would be sufficent for You?
Are You aware that don't working C3:
- isn't causing frequency transition,
- will lockup the CPU if there is bus master activity on PCI bus
during transition?

>>> But the real question is why the longhaul driver is checking
>>> for C2 and C3 support in the first place -- as they are not
>>> directly related to the availability of P-states.
>> Because Longhaul isn't using P-states.
>=20
> I guess I don't understand what longhaul.c is doing.
> Why is it using ACPI's C2 and C3 register addresses in order
> to do frequency/voltage scaling?
>=20

VIA CPU don't like any bus activity during transition (flushing=20
caches before isn't enough). If there is change on any pin during PLL=20
resync (flush caches or interrupt for example) CPU will be frozen.=20
Thanks to ACPI C3 (C2 isn't used) processor have enough time for=20
resync. Bus master activity is disabled and will not triger caches=20
flush or anything else.

> In the case there those addresses have been deemed invalid for
> the purpose of ACPI C-states, why are they still valid for longhaul?
>=20
> -Len
>=20

As I explained before this is single case. I don't know any other BIOS=20
for mainboard/motherboard with VIA CPU and VIA chipset claiming that=20
mobo don't support ACPI C3.

Rafa=B3


----------------------------------------------------------------------
Zostan Chlopakiem Lata! >>> http://link.interia.pl/f1998
