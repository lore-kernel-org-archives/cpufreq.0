From: Thomas Renninger <trenn@suse.de>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Sun, 21 Jan 2007 12:46:37 +0100
Message-ID: <1169379997.14625.29.camel@sublime.site>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>
	<1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
	<1052.10.10.10.3.1169375336.squirrel@www.lievin.net>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1052.10.10.10.3.1169375336.squirrel@www.lievin.net>
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
To: Romain =?ISO-8859-1?Q?Li=E9vin?= <roms@lievin.net>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Sun, 2007-01-21 at 11:28 +0100, Romain Li=C3=A9vin wrote:
> Hi,
>=20
> > It looks like the powernow-k8 driver correctly constructs
> > a two entry frequency table and verifies it, and then
> > reverifies a second frequency table with only 1 entry in
> > it.
>=20
> I feel very strange that frequency range can vary ("request for
> verification of policy") between 2 calls of cpufreq_driver->verify() on
> the same CPU (cpufreq.c: 1386 & 1400). First call returns
> 800000-1600000MHz while the second one returns 800000-800000. Moreover,
> both calls are done before calling set_policy() at line 1413.
>=20
> I think there is either a bug, either a problem with my configuration.
> Anyways, I'm investigating this by taking a look at source code.
>=20
> I decided to debug this but I can load the powernow-k8 module once. I
> can't unload it; I have to reboot which is very annoying. Why module is
> locked?

In older kernels powernow-k8 could be unloaded, not sure whether this
is still the case. Switch to performance (or userspace?) governor and
try to unload all related modules, e.g. freq_tables,
maybe it still works.

I expect the limitation comes from ACPI _PPC func, so you should add
ACPI_DEBUG to your debug kernel and a printk into:
drivers/acpi/processor_perflib.c:acpi_processor_ppc_notifier()
to be sure.

Can you open a bugzilla.kernel.org bug and attach acpidump and add me
to CC, pls.

This sounds related to:
https://bugzilla.novell.com/show_bug.cgi?id=3D231107

You should also make sure your kernel includes this one, recently
posted here by Bruno Ducrot:
http://marc.theaimsgroup.com/?l=3Dlinux-acpi&m=3D116412804022222&w=3D2

     Thomas
