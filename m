From: Dave Jones <davej@redhat.com>
Subject: Re: ACPI P-States vs Longhaul
Date: Mon, 20 Nov 2006 14:59:12 -0500
Message-ID: <20061120195912.GC27924@redhat.com>
References: <456203F5.60606@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <456203F5.60606@interia.pl>
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

On Mon, Nov 20, 2006 at 08:37:25PM +0100, Rafa=C5=82 Bilski wrote:
 > Hello,
 >=20
 > I know that a lot has changed since 2.6.18 in "ACPI P-States"=20
 > driver, but I wasn't paing attention. Just in case if this=20
 > issue isn't known. Reported by user.=20
 > System: VIA Epia SP13000 (VIA C3-2 "Nehemiah" 6.9.8)
 > Kernel: 2.6.18.2 custom config, apci-cpufreq=3Dm, longhaul=3Dm
 > Issue:
 > "ACPI P-States driver" is loaded (by distro) and stays loaded.=20
 > When user try to load "Longhaul" CPU is already owned by other=20
 > driver and "Longhaul" fails with -EBUSY. Of course rmmod does=20
 > the trick. But why acpi-cpufreq didn't failed? This processor=20
 > don't support P-states.
 > Sadly "Longhaul" don't work too. No ACPI C3 support in BIOS=20
 > and CN400 chipset on mainboard.
=20
Probably due to the 'sticky' bug that was fixed in 2.6.18.3

		Dave

--=20
http://www.codemonkey.org.uk
