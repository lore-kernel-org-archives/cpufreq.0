From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Add ignore_latency option
Date: Thu, 24 Aug 2006 19:18:14 +0200
Message-ID: <44EDDF56.2060807@interia.pl>
References: <44DED1C4.7060108@interia.pl>
	<200608232322.19005.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200608232322.19005.len.brown@intel.com>
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

>> Some laptops with VIA C3 processor, CLE266 chipset and
>> AMI BIOS have incorrect latency values in FADT table. These
>> laptops seems to be C3 capable, but latency values are to
>> big: 101 for C2 and 1017 for C3. This option will allow
>> user to skip C3 latency test but not C3 address test. AMI
>> BIOS is setting C3 address to correct value in DSDT table.
>=20
> This looks very fishy.

So why P_BLK address is valid and have proper lenght?

>=20
> C2 latency above 100usec and C3 latency above 1000 usec
> are the official way for the BIOS to tell the OS to NOT USE
> those C-states.  Under no conditions should Linux second
> guess those explicit instructions -- the BIOS may have put
> those values there because you get silent data corruption
> on that particular stepping of the processor or chipset
> if they are enabled.
>=20

It is disabled by default.
It is only needed for some laptops.
As far I know there is no data corruption. Chipset and processor=20
are exacly the same as on Epia M10000 so I don't expect any.

Why force user to recompilation of distro kernel?

> But the real question is why the longhaul driver is checking
> for C2 and C3 support in the first place -- as they are not
> directly related to the availability of P-states.
>=20
> -Len
>=20

Because Longhaul isn't using P-states.

Rafa=B3

----------------------------------------------------------------------
Zostan Chlopakiem Lata! >>> http://link.interia.pl/f1998
