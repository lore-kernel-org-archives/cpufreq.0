From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES] cpufreq_get(), cpufreq->get()
Date: Sun, 11 Apr 2004 23:59:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040411215912.GA8160@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2072543843=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============2072543843==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear all,

The following patchset is based on the current cpufreq bitkeeper patch
and one important speedstep-centrino patch=20
[see http://www.linux.org.uk/mailman/private/cpufreq/2004-April/003499.html=
 ].

Its aim is to provide
a) better user and kernel information about current frequency,
b) handle frequency changes "behind cpufreq's back" (e.g. by BIOS)
   better, and
c) fix up suspend/resume.

I suggest that this patchset is considered for the 2.6.7 timeframe;=20
while the x86 parts seem to be quite straightforward, the arm=20
architecture might be affected more heavily: it already relied on=20
cpufreq_get(), and I can't verify my changes do even compile. Russell,=20
I hope I didn't break anything this time...

The patches described below [02, 04, 05 and 06 will also be sent to the
cpufreq list, the others are only available online] are partly based on
the suggestion by Bruno Ducrot=20
[see http://www.linux.org.uk/mailman/private/cpufreq/2004-January/003076.ht=
ml ].=20

In future, maybe even still in time for 2.6.7, verification inside=20
cpufreq_notify_transition (cpu_policy->cur !=3D freqs.old), and a call=20
to cpufreq_get() before the "lost tick detection" mechanism kicks in,=20
might be useful work on top of these patches.

The x86 patches are split up now for reviewal / bugfixing reasons now,
but could be merged into one cset for bk before merging. Same is true
for patches 05 and 06; all others are different "steps" and should stay
different csets, IMO.

WRT other architectures than arm and x86: I couldn't find an easy way
to add a hardware-based "get-frequency()" function to the sh, ppc and
sparc64 cpufreq drivers, but I didn't look all that hard... so maybe=20
the respective driver maintainers can take a look at this? Thanks.





http://www.brodo.de/patches/2004-04-11/01-export_scaling_cur_freq

Many users want to know the current cpu freqeuncy, even if not using
the userspace frequency. On ->target cpufreq drivers (if they do their
calls to cpufreq_notify_transition correctly) this just means reading
out cpufreq_policy->cur.

 drivers/cpufreq/cpufreq.c |    4 ++++
 1 files changed, 4 insertions(+)

http://www.brodo.de/patches/2004-04-11/02-cpufreq_get

Move cpufreq_get() from the userspace governor to the core. Contrary to the
previous implementation, it now calls the cpufreq driver, and reads out the
_actual_ current frequency, and not the frequency the CPUfreq core _thinks_
the CPU is running at. Most cpufreq drivers do provide such a "hw get"
function (only ACPI-io can definitely not be supported, I'm not sure
about sh, sparc64 and powermac) anyway, and it is useful for other issues
(see following patches).

 drivers/cpufreq/cpufreq.c           |   32 +++++++++++++++++++++++++++
 drivers/cpufreq/cpufreq_userspace.c |   42 ++-----------------------------=
-----
 include/linux/cpufreq.h             |    9 +++++--
 3 files changed, 41 insertions(+), 42 deletions(-)

http://www.brodo.de/patches/2004-04-11/03-cpuinfo_cur_freq

Export cpufreq_get() to userspace. As it involves calls to hardware which m=
ight
take some time, only let the super-user read out this value.

 drivers/cpufreq/cpufreq.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+)

http://www.brodo.de/patches/2004-04-11/04-out_of_sync

Sometimes we might discover during a call to cpufreq_get() that we're "out =
of sync",
meaning the actual CPU frequency changed "behind our back". If this happens=
, the
flag CPUFREQ_PANIC_OUTOFSYNC decides what can be done: if it is set, the ke=
rnel panic's,
it it is not set, the cpufreq transition notifiers are informed of this cha=
nge, and
a call to cpufreq_update_policy() is scheduled [using the default workqueue=
] so that
the user-defined values override BIOS / external interaction.

 drivers/cpufreq/cpufreq.c |   50 +++++++++++++++++++++++++++++++++++++++++=
+++++
 include/linux/cpufreq.h   |   15 +++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

http://www.brodo.de/patches/2004-04-11/05-resume

(Hopefully) fix cpufreq resume support.

Upon resuming, first CPUfreq hardware support needs to be re-enabled in cer=
atin cases
(call to cpufreq_driver->resume()).

Then, two different paths may need to be taken:
a) frequency during suspend equals frequency during resume =3D=3D> everythi=
ng is fine,

b) frequency differ =3D=3D> either we can't handle it, then panic (see flag=
=20
   CPUFREQ_PANIC_RESUME_OUTOFSYNC). Or we can handle it, then notify all
   transition notifiers of this frequency change (CPUFREQ_RESUMECHANGE so t=
hat they
   know IRQs are disabled).

At last, a call to cpufreq_update_policy() is scheduled. This asserts that
that the policy can be updated soon, in case platform limit, thermal and/or=
 other=20
issues make an adjustment necessary.

 Documentation/cpu-freq/core.txt |    4 ++
 drivers/cpufreq/cpufreq.c       |   63 ++++++++++++++++++++++++-----------=
-----
 include/linux/cpufreq.h         |    5 +++
 3 files changed, 47 insertions(+), 25 deletions(-)

http://www.brodo.de/patches/2004-04-11/06-notifieres

Handle CPUFREQ_RESUMECHANGE notifications in i386, sparc64, x86_64, sh-sci
and sa11xx-pcmcia notifiers. sa1100-framebuffer doesn't seem to be able
to handle frequency transitions behind its back well. So, sa11xx will be ma=
rked
CPUFREQ_PANIC_OUTOFSYNC | CPUFREQ_PANIC_RESUME_OUTOFSYNC in patch 19. Russe=
ll,
do you think sa1100fb will be able to handle such an out of sync situation?

 arch/i386/kernel/timers/timer_tsc.c |    3 ++-
 arch/sparc64/kernel/time.c          |    3 ++-
 arch/x86_64/kernel/time.c           |    3 ++-
 drivers/char/sh-sci.c               |    3 ++-
 drivers/pcmcia/sa11xx_core.c        |    2 ++
 drivers/serial/sh-sci.c             |    3 ++-
 6 files changed, 12 insertions(+), 5 deletions(-)

http://www.brodo.de/patches/2004-04-11/07-elanfreq-get

use elanfreq's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/elanfreq.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-11/08-gx-suspmod-get

use gx-suspmod's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-11/09-longhaul-get

Add a longhaul_get function. It was easy to add as all necessary
parts were already there...

 arch/i386/kernel/cpu/cpufreq/longhaul.c |    8 ++++++++
 1 files changed, 8 insertions(+)

http://www.brodo.de/patches/2004-04-11/10-longrun-get

Longrun users might be interested in their CPU's current frequency as
well, so use a longrun-specific cpuid-call in longrun_get().

 arch/i386/kernel/cpu/cpufreq/longrun.c |   13 +++++++++++++
 1 files changed, 13 insertions(+)

http://www.brodo.de/patches/2004-04-11/11-p4-clockmod-get

p4-clockmod is a bit more complicated as it might run on SMP, HT, and=20
the instructions need to run on the specific (physical) CPU.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   48 ++++++++++++++++++++++++=
+++--
 1 files changed, 46 insertions(+), 2 deletions(-)

http://www.brodo.de/patches/2004-04-11/12-powernow-k6-get

powernow_k6 has almost all pieces in place for its own ->get() function.
Add the rest.

 arch/i386/kernel/cpu/cpufreq/powernow-k6.c |    6 ++++++
 1 files changed, 6 insertions(+)

http://www.brodo.de/patches/2004-04-11/13-powernow-k7-get

powernow-k7 has almost all pieces necessary for ->get() in place. Add
the rest, and use it in powernow_cpu_init().

 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletion(-)

http://www.brodo.de/patches/2004-04-11/14-powernow-k8-get

Add powernowk8_get, but be careful as some code needs to run on
specified CPU only.

 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |   27 ++++++++++++++++++++++++=
+++
 1 files changed, 27 insertions(+)

http://www.brodo.de/patches/2004-04-11/15-speedstep_centrino_get

use speedstep_centrino's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

http://www.brodo.de/patches/2004-04-11/16-speedstep-ich-get

Use speedstep_lib's capabilites for ->get() in speedstep-ich.c

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    5 +++++
 1 files changed, 5 insertions(+)

http://www.brodo.de/patches/2004-04-11/17-speedstep-smi-get

Use speedstep_lib's capabilites for ->get() in speedstep-smi.c

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

http://www.brodo.de/patches/2004-04-11/18-arm-integrator-get

arm-integrator had its ->get() implementation inside=20
integratior_cpufreq_init(). Move it to an extra function,
and add it as ->get() function.

 arch/arm/mach-integrator/cpu.c |   20 ++++++++++++++------
 1 files changed, 14 insertions(+), 6 deletions(-)

http://www.brodo.de/patches/2004-04-11/19-arm-sa11xx-get

sa11x0_getspeed can be used by both cpu-sa1100.c and cpu-sa1110.c as
->get() function. Update calling conventions, and un-export it as
we fixed the handling of cpufreq_get in the cpufreq core. Also,
remove special call to userspace-governor init as it isn't needed
any longer.

 arch/arm/mach-sa1100/cpu-sa1100.c |    8 +++++---
 arch/arm/mach-sa1100/cpu-sa1110.c |    9 +++++----
 arch/arm/mach-sa1100/generic.c    |    6 ++++--
 arch/arm/mach-sa1100/generic.h    |    2 +-
 4 files changed, 15 insertions(+), 10 deletions(-)

http://www.brodo.de/patches/2004-04-11/20-arm-Kconfig

As cpufreq_get() is no longer a part of cpufreq_userspace.c, SA11x0 doesn't
need to be handled specially any longer.

 arch/arm/Kconfig |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAeb+wZ8MDCHJbN8YRApLpAJ9b7DdO+QoOrfJPtF9tPuiJTHvfYgCfWrR8
97+3txGODslHLkmEjskYcAQ=
=+8sw
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--


--===============2072543843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============2072543843==--

