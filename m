From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 13:50:33 +0000
Message-ID: <bug-77201-12968-pH7CSKkpxH@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D77201

--- Comment #40 from registosites@hotmail.com ---
> Hi,
>=20
> Thanks for your efforts !!
>=20
> We couldn't get the complete picture as there are just too many print=
s
> wanting to fit on screen :)
>=20
> Can you try this to get the right set of prints for us, that way we m=
ight be
> able to focus in the right direction:
>=20
> - Remove all pr_debug() lines from powernow-k8 driver
> - And apply attached patch for cpufreq core, only reducing number of =
print
> messages. (Rebased over 3.15)

I have deleted all pr_debug() lines and recompiled with all the patches=
,
modifications and config options from previous posts.

>=20
> And then give us another screenshot..

The new screenshot is attached. After bringing the cpu online I got bac=
k to a
prompt but the machine hangs.

>=20
> Also some queries about your current logs:
> - I hope this was the last message you saw on screen and it just beca=
me
> unresponsive?
>=20
> freq_table: target index is 0, freq is:2200000 kHz
>=20

That was the last output before the machine became unresponsive.

> and the expected ones after this are:
>=20
> powernow_k8: targ: cpu 0, 2200000 kHz, min 800000, max 2200000
> powernow_k8: targ: curr fid 0x8, vid 0x15
> powernow_k8: cpu 0 transition to index 0
> powernow_k8: table matched fid 0xe, giving vid 0x12
> powernow_k8: cpu 0, changing to fid 0xe, vid 0x12
>=20
> So, it looks like the CPU did came back and something happened while =
changing
> freq to max.
>=20
> Somehow this problem is related to something special being done in yo=
ur
> driver. We don't see this problem otherwise for other platforms.
>=20
> One thing i could figure out is scheduling a *work* for changing freq=
uencies
> but I am not sure if the problem is related to that..
>=20
> I tried to have a look at what changed between 3.13.8 and 3.14, and c=
ouldn't
> figure out anything special that might end up in this issue :(
>=20
>=20
> If you couldn't get anything conclusive with above tests then there m=
ight be
> some chances that it *isn't* related to cpufreq and some other change=
s in
> kernel are responsible. The best we can try is: get only cpufreq back=
 to the
> old state, i.e. 3.13.8, by reverting commits and try again..
>=20
> few reverts were required for this and to simplify your work I have c=
reated
> a branch with all reverts required.
>=20
> git://git.linaro.org/people/viresh.kumar/mylinux.git powernow-k8-debu=
gging
>=20
> NOTE: We can still see some diff this way:
> git diff v3.13.8..powernow-k8-debugging -- drivers/cpufreq/ --
> include/linux/cpufreq.h
>=20
> But there shouldn't be any *functional* change for
> cpufreq.c/governors/freq-table.c/powernow-k8 drivers and all cpufreq =
files
> do compile.. (haven't tried compiling powernow-k8)..
>=20
> Let me know if this solves your problem or make it worst :)

I didn't manage to compile this one, it fails with:

  CC      drivers/cpuidle/sysfs.o
  CC      lib/dynamic_debug.o
  CC [M]  drivers/cpufreq/acpi-cpufreq.o
  CC      drivers/cpuidle/governors/ladder.o
drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98store_boost=E2=80=99=
:
drivers/cpufreq/acpi-cpufreq.c:160:26: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_supported=E2=80=99
  if (!acpi_cpufreq_driver.boost_supported)
                          ^
drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98show_cpb=E2=80=99:
drivers/cpufreq/acpi-cpufreq.c:180:49: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_enabled=E2=80=99
  return sprintf(buf, "%u\n", acpi_cpufreq_driver.boost_enabled);
                                                 ^
drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98boost_notify=E2=80=
=99:
drivers/cpufreq/acpi-cpufreq.c:540:37: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_enabled=E2=80=99
   boost_set_msrs(acpi_cpufreq_driver.boost_enabled, cpumask);
                                     ^
drivers/cpufreq/acpi-cpufreq.c: At top level:
drivers/cpufreq/acpi-cpufreq.c:897:2: error: unknown field =E2=80=98set=
_boost=E2=80=99
specified in initializer
  .set_boost      =3D _store_boost,
  ^
drivers/cpufreq/acpi-cpufreq.c:897:2: warning: excess elements in struc=
t
initializer
drivers/cpufreq/acpi-cpufreq.c:897:2: warning: (near initialization for
=E2=80=98acpi_cpufreq_driver=E2=80=99)
drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98acpi_cpufreq_boost=
_init=E2=80=99:
drivers/cpufreq/acpi-cpufreq.c:908:22: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_supported=E2=80=99
   acpi_cpufreq_driver.boost_supported =3D true;
                      ^
drivers/cpufreq/acpi-cpufreq.c:909:22: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_enabled=E2=80=99
   acpi_cpufreq_driver.boost_enabled =3D boost_state(0);
                      ^
drivers/cpufreq/acpi-cpufreq.c:913:37: error: =E2=80=98struct cpufreq_d=
river=E2=80=99 has no
member named =E2=80=98boost_enabled=E2=80=99
   boost_set_msrs(acpi_cpufreq_driver.boost_enabled,
                                     ^
drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98show_cpb=E2=80=99:
drivers/cpufreq/acpi-cpufreq.c:181:1: warning: control reaches end of n=
on-void
function [-Wreturn-type]
 }
 ^
scripts/Makefile.build:314: recipe for target 'drivers/cpufreq/acpi-cpu=
freq.o'
failed
make[2]: *** [drivers/cpufreq/acpi-cpufreq.o] Error 1
scripts/Makefile.build:455: recipe for target 'drivers/cpufreq' failed
make[1]: *** [drivers/cpufreq] Error 2
make[1]: *** Waiting for unfinished jobs....
  CC      drivers/cpuidle/governors/menu.o
  CC      lib/nlattr.o
  CC      net/core/rtnetlink.o
  LD      drivers/cpuidle/governors/built-in.o
  LD      drivers/cpuidle/built-in.o
Makefile:841: recipe for target 'drivers' failed
make: *** [drivers] Error 2
make: *** Waiting for unfinished jobs....
  CC      net/core/utils.o
  CC      lib/average.o
  CC      lib/cpu_rmap.o
  CC      lib/dynamic_queue_limits.o

--=20
You are receiving this mail because:
You are the assignee for the bug.