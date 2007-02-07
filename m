From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Speedstep centrino
Date: Tue, 6 Feb 2007 16:59:42 -0800
Message-ID: <EB12A50964762B4D8111D55B764A845401396CEE@scsmsx413.amr.corp.intel.com>
References: <736dda5d0702050238n5e6c2088lec7ba456677538ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <736dda5d0702050238n5e6c2088lec7ba456677538ac@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: David Tunkrans <david.tunkrans@gmail.com>
Cc: cpufreq@lists.linux.org.uk, Jeremy Fitzhardinge <jeremy@goop.org>

=20
Most probably BIOS is not exporting frequency information then. I have
opened a bugzilla to make sure that this does not go untracked
(http://bugme.osdl.org/show_bug.cgi?id=3D7954). We need to have a look =
at
acpidump disassembly to be sure. Will do that soon.
=20
In the mean time, can you make sure you have the latest BIOS.=20
=20
Thanks,
Venki


________________________________

	From: David Tunkrans [mailto:david.tunkrans@gmail.com]=20
	Sent: Monday, February 05, 2007 2:38 AM
	To: Pallipadi, Venkatesh
	Cc: Jeremy Fitzhardinge; cpufreq@lists.linux.org.uk
	Subject: Re: Speedstep centrino
=09
=09
	Hi,
	=20
	I have tried the acpi-cpufreq driver, no difference there. I
have read that some people have gotten the speedstep-centrino driver
working under 32-bit ubunto, however Im using the amd64 ubunto distro
and cant verify that. Also Im on my fourth custom kernel, testing
different config:s ( 2.6.19.1). Attached is the acpidump + dmesg from my
Mac Pro. If there is any more information that I can provide you with,
please let me know.
	=20
	Thanks,
	=20
	David


	=20
	On 2/2/07, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com>
wrote:=20



		>-----Original Message-----
		>From: cpufreq-bounces@lists.linux.org.uk=20
		>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf
Of
		>Jeremy Fitzhardinge
		>Sent: Friday, February 02, 2007 1:26 PM
		>To: David Tunkrans=20
		>Cc: cpufreq@lists.linux.org.uk
		>Subject: Re: Speedstep centrino
		>
		>David Tunkrans wrote:
		>> I found your email adress in the speedstep centrino
kernel=20
		>source. Ive
		>> put down a lot of time into getting ACPI and
speedstep working on my
		>> Mac Pro Ubuntu amd64 installation, with no success.
Seems like the
		>> cpufreq parameters are "missing" even though the
specification says=20
		>> that woodcrest Xeons do support speedstep. Also I
suspect that there
		>> has to be specific support for Xeon processors in
this
		>driver? I would
		>> really appreciate if you could point me in the right
direction.=20
		>
		>In general, the newer CPUs require ACPI support to get
the right
		>operating point parameters for the CPU; only the older
Banias Pentium
		>M's have support built directly into the driver.  I
don't know if Mac=20
		>Pros have ACPI; perhaps there needs to be some other
way of
		>getting that
		>info out of the BIOS, assuming its there at all.
		>
	=09
		Can you try acpi-cpufreq driver instead. If that doesn't
work, probably=20
		BIOS is not exporting needed ACPI information to support
speedstep. We
		will have to look at acpidump and see the BIOS ACPI
information.
	=09
		Thanks,
		Venki
	=09
