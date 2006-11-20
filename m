From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: ACPI P-States vs Longhaul
Date: Mon, 20 Nov 2006 20:37:25 +0100
Message-ID: <456203F5.60606@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Hello,

I know that a lot has changed since 2.6.18 in "ACPI P-States"=20
driver, but I wasn't paing attention. Just in case if this=20
issue isn't known. Reported by user.=20
System: VIA Epia SP13000 (VIA C3-2 "Nehemiah" 6.9.8)
Kernel: 2.6.18.2 custom config, apci-cpufreq=3Dm, longhaul=3Dm
Issue:
"ACPI P-States driver" is loaded (by distro) and stays loaded.=20
When user try to load "Longhaul" CPU is already owned by other=20
driver and "Longhaul" fails with -EBUSY. Of course rmmod does=20
the trick. But why acpi-cpufreq didn't failed? This processor=20
don't support P-states.
Sadly "Longhaul" don't work too. No ACPI C3 support in BIOS=20
and CN400 chipset on mainboard.

Regards
Rafa=B3


----------------------------------------------------------------------
PS. >>> http://link.interia.pl/f19a6
