From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES] cpufreq patches for 2.6.7
Date: Thu, 22 Apr 2004 19:58:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040422175831.GA7356@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0208637256=="
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


--===============0208637256==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear all,

The following patches is based on 2.6-bk-latest. Individual
patches are available at the place noted below, and I'll send them
to Dave for inclusion, too.

Included is=20
- cpufreq->get() patchset discussed previously, with following changes:
   - dropped 20-arm-Kconfig
   - better powernow-k7 ->get() [Bruno Ducrot]
   - better p4-clockmod ->get()
   - also check if freqs->old during call to cpufreq_notify_transition()
     is correct.
- before falling back to "sane" timesource in arch/i386/...tsc, verify
   CPU frequency is in sync
- fix P4 - TSC handling
- support for Pentium M (Dothan) [many thanks to Thomas Renninger]

These patches should rest in 2.6.-mm for a bit before they're pushed
to Linus, IMO.


http://www.brodo.de/patches/2004-04-22/01-export_scaling_cur_freq

Many users want to know the current cpu freqeuncy, even if not using
the userspace frequency. On ->target cpufreq drivers (if they do their
calls to cpufreq_notify_transition correctly) this just means reading
out cpufreq_policy->cur.

 drivers/cpufreq/cpufreq.c |    4 ++++
 1 files changed, 4 insertions(+)

http://www.brodo.de/patches/2004-04-22/02-cpufreq_get

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

http://www.brodo.de/patches/2004-04-22/03-cpuinfo_cur_freq

Export cpufreq_get() to userspace. As it involves calls to hardware which m=
ight
take some time, only let the super-user read out this value.

 drivers/cpufreq/cpufreq.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+)

http://www.brodo.de/patches/2004-04-22/04-out_of_sync

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

http://www.brodo.de/patches/2004-04-22/05-resume

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

http://www.brodo.de/patches/2004-04-22/06-notifieres

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

http://www.brodo.de/patches/2004-04-22/07-elanfreq-get

use elanfreq's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/elanfreq.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-22/08-gx-suspmod-get

use gx-suspmod's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-22/09-longhaul-get

Add a longhaul_get function. It was easy to do as all necessary
parts were already there...

 arch/i386/kernel/cpu/cpufreq/longhaul.c |    8 ++++++++
 1 files changed, 8 insertions(+)

http://www.brodo.de/patches/2004-04-22/10-longrun-get

Longrun users might be interested in their CPU's current frequency as
well, so use a longrun-specific cpuid-call in longrun_get().

 arch/i386/kernel/cpu/cpufreq/longrun.c |   13 +++++++++++++
 1 files changed, 13 insertions(+)

http://www.brodo.de/patches/2004-04-22/11-p4-clockmod-get

p4-clockmod is a bit more complicated as it might run on SMP, HT, and=20
the instructions need to run on the specific (physical) CPU.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   38 ++++++++++++++++++++++++=
+++++
 1 files changed, 38 insertions(+)

http://www.brodo.de/patches/2004-04-22/12-powernow-k6-get

powernow_k6 has almost all pieces in place for its own ->get() function.
Add the rest.

 arch/i386/kernel/cpu/cpufreq/powernow-k6.c |    6 ++++++
 1 files changed, 6 insertions(+)

http://www.brodo.de/patches/2004-04-22/13-powernow-k7-get

powernow-k7->get() implementation by Bruno Ducrot.

http://www.brodo.de/patches/2004-04-22/14-powernow-k8-get

Add powernowk8_get, but be careful as some code needs to run on
specified CPU only.

 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |   27 ++++++++++++++++++++++++=
+++
 1 files changed, 27 insertions(+)

http://www.brodo.de/patches/2004-04-22/15-speedstep_centrino_get

use speedstep_centrino's internal get function as ->get()

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

http://www.brodo.de/patches/2004-04-22/16-speedstep-ich-get

Use speedstep_lib's capabilites for ->get() in speedstep-ich.c

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    5 +++++
 1 files changed, 5 insertions(+)

http://www.brodo.de/patches/2004-04-22/17-speedstep-smi-get

Use speedstep_lib's capabilites for ->get() in speedstep-smi.c

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

http://www.brodo.de/patches/2004-04-22/18-arm-integrator-get

arm-integrator had its ->get() implementation inside=20
integratior_cpufreq_init(). Move it to an extra function,
and add it as ->get() function.

 arch/arm/mach-integrator/cpu.c |   20 ++++++++++++++------
 1 files changed, 14 insertions(+), 6 deletions(-)

http://www.brodo.de/patches/2004-04-22/19-arm-sa11xx-get

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

http://www.brodo.de/patches/2004-04-22/20-x86-lost-ticks

Once we detected 50 consecutive ticks with lost ticks (and this is half of=
=20
the amount needed to trigger the fallback to a "sane" timesource), verify
the CPU frequency is in sync if cpufreq is used: sometimes the CPU frequency
changes behind the user's back, and then the TSC detects lost ticks. By a
call to cpufreq_get(), the frequency the TSC driver thinks the CPU is in
is updated to the actual frequency, in case these differ. Works really nice
on my notebook -- it's never falling back to a different timesource now, ev=
en
if I plug in the power cord.

 arch/i386/kernel/timers/timer_tsc.c |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+)

http://www.brodo.de/patches/2004-04-22/21-check_on_notify

Also check whether the CPU frequency is out of sync once we get to
cpufreq_notify_transition.

 drivers/cpufreq/cpufreq.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletion(-)

http://www.brodo.de/patches/2004-04-22/22-handle-p4-scaling

Currently, the TSC cpufreq notifiers does almost nothing on P4s, as we
assumed the TSC to be constant independent of _all_ frequency transitions.
Extensive testing by Karol Kozimor has shown, though, that only _throttling_
does not affect the TSC, but _scaling_ does.

So:
- pass the CPUFREQ_CONST_LOOPS flags (to be exact, all flags) to cpufreq=20
  transition notifiers
- skip TSC value changes if this flag is set
- set this flag for P4 / P4-Ms only in p4-clockmod [On Pentium-M banias=20
  the TSC _is_ affected by p4-clockmodulation.
=20

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    5 +++++
 arch/i386/kernel/timers/timer_tsc.c        |   20 ++++++++------------
 drivers/cpufreq/cpufreq.c                  |    4 +++-
 include/linux/cpufreq.h                    |    1 +
 4 files changed, 17 insertions(+), 13 deletions(-)

http://www.brodo.de/patches/2004-04-22/23-speedstep_centrino-cpu_id

Add a new "struct cpu_id" for better handling of different Pentium M
steppings / revisions.

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   30 +++++++++++++++++=
++---
 1 files changed, 26 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-22/24-speedstep_centrino-banias_table

The built-in tables are only valid for Pentium M (Banias) processors
with CPUID 6/9/5. So, add a pointer to the proper struct cpu_id to the
cpu_model struct, and re-name _CPU/CPU to _BANIAS/BANIAS

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   72 ++++++++++++-----=
-----
 1 files changed, 40 insertions(+), 32 deletions(-)

http://www.brodo.de/patches/2004-04-22/25-speedstep_centrino-dothan_acpi

Add support for Pentium M (Dothan) processors. Until further review, only
ACPI data will get this driver to run - no built-in tables will exist.

Many thanks to Thomas Renninger for reporting the lack of, and testing=20
the support for Dothan processors.

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

http://www.brodo.de/patches/2004-04-22/26-p4-clockmod-dothan

Add support for Pentium M (Dothan) processors for p4-clockmod, but warn
loudly if anyone tries to use it -- you really should use speedstep-centrino
instead. On Dothans, the TSC is _not_ affected by TSC transitions (contrary
to Banias processors), so set the CPUFREQ_CONST_LOOPS flag.

Many thanks to Thomas Renninger for reporting the lack of, and testing=20
the support for Dothan processors.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletion(-)

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAiAfHZ8MDCHJbN8YRAqQOAKCZAB4Ib8M6y7qwrdqhSfnWASWesACeM3CZ
j97gbvLWOoJvfZ14NOLIwTk=
=84Uu
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--


--===============0208637256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0208637256==--

