From: "Brown, Len" <len.brown@intel.com>
Subject: RE: [SchreiberX@Altmuehlnet.de: Re: hp omnibook xe4500 hangs while
	loading acpi module]
Date: Tue, 23 Dec 2003 01:31:30 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <BF1FE1855350A0479097B3A0D2A80EE0CC894B@hdsmsx402.hd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>, Martin Schreiber <SchreiberX@Altmuehlnet.de>
Cc: cpufreq@www.linux.org.uk

This was  http://bugzilla.kernel.org/show_bug.cgi?id=3D1349
The fix is in current 2.4.24, and the latest ACPI patch for 2.6.0:

http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/patches/release/
2.6.0/

Cheers,
-Len

Ps. Sorry I didn't reply earlier, I got bounced off this list for a
spell.


> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@dominikbrodowski.de]=20
> Sent: Saturday, December 20, 2003 12:15 PM
> To: Brown, Len
> Cc: cpufreq@www.linux.org.uk
> Subject: [SchreiberX@Altmuehlnet.de: Re: hp omnibook xe4500=20
> hangs while loading acpi module]
>=20
>=20
> Hi Len,
>=20
> The patch "[ACPI] GV3 IO port is 16-bits" to the
> arch/i386/kernel/cpu/cpufreq/acpi.c file broke at least some of=20
> the GV1/2 support. Any idea on how to fix it up so that it works
> for both?
>=20
> Happy holidays,
> 	Dominik
>=20
> ----- Forwarded message from Martin Schreiber=20
> <SchreiberX@Altmuehlnet.de> -----
>=20
> Subject: Re: hp omnibook xe4500 hangs while loading acpi module
> From: Martin Schreiber <SchreiberX@Altmuehlnet.de>
> To: Dominik Brodowski <linux@dominikbrodowski.de>
> Cc: cpufreq@www.linux.org.uk
> In-Reply-To: <20031219182737.GE6909@dominikbrodowski.de>
> X-Mailer: Ximian Evolution 1.4.5=20
> Date: Sat, 20 Dec 2003 17:13:47 +0100
>=20
> the acpi cpufreq (kernel 2.6.0) works now on omnibook xe4500 with the
> attached patch.
>=20
> thanks!
>=20
>=20
>=20
> On Fri, 2003-12-19 at 19:27, Dominik Brodowski wrote:
> > Hi,
> >=20
> > Can you please try the attached patch (for 2.6.0)? It=20
> reverts a change
> > done during the time frame you mention: I assume this patch
> > "[ACPI] GV3 IO port is 16-bits (Venkatesh Pallipadi)"=20
> caused the trouble.
> > Please CC <cpufreq@www.linux.org.uk> in your reply [the=20
> cpufreq mailing=20
> > list], so that other cpufreq developers can investigate=20
> this issue as well.
> >=20
> > Thanks,
> > 	Dominik
