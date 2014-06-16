From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 09:36:11 +0000
Message-ID: <bug-77201-12968-3DpRF1PiFb@https.bugzilla.kernel.org/>
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

--- Comment #87 from Mauro <registosites@hotmail.com> ---
(In reply to Viresh Kumar from comment #86)
> Only one of these two will work for you. Check which one, I would put=
 my 10
> cents on *-post1 branch :)

You should have bet more, *-post2 hangs, *-post1 works.

> Once, any one of the branches work for you, try doing a git bisect fo=
r that
> branch and 3.14 (Only few revert patches actually, should be easy)..=20
>=20
> And you can tell me which revert patch has *fixed* the issue for you =
and
> that's the culprit.

I had to skip the last step of the bisect as it fails to build, I'm att=
aching
the bisect log.

It fails with:
arch/x86/kernel/cpu/perf_event.c: In function =E2=80=98arch_perf_update=
_userpage=E2=80=99:
arch/x86/kernel/cpu/perf_event.c:1903:23: error: =E2=80=98CYC2NS_SCALE_=
=46ACTOR=E2=80=99
undeclared (first use in this function)
  userpg->time_shift =3D CYC2NS_SCALE_FACTOR;
                       ^
arch/x86/kernel/cpu/perf_event.c:1903:23: note: each undeclared identif=
ier is
reported only once for each function it appears in
scripts/Makefile.build:308: recipe for target
'arch/x86/kernel/cpu/perf_event.o' failed
make[3]: *** [arch/x86/kernel/cpu/perf_event.o] Error 1
make[3]: *** Waiting for unfinished jobs....
  CC      kernel/printk/printk.o
scripts/Makefile.build:455: recipe for target 'arch/x86/kernel/cpu' fai=
led
make[2]: *** [arch/x86/kernel/cpu] Error 2
scripts/Makefile.build:455: recipe for target 'arch/x86/kernel' failed
make[1]: *** [arch/x86/kernel] Error 2
Makefile:841: recipe for target 'arch/x86' failed
make: *** [arch/x86] Error 2

>=20
> Then we can follow on LKML, will put you in CC, on the original commi=
t
> threads..
>=20
> Thanks for your dedication towards fixing this up, it was really a ni=
ghtmare
> to get down to this :)

I'm just scratching my itch ;) I also have to thank you, and everyone e=
lse that
looked into this, it looks like this is not affecting many people and y=
et you
took the time and effort to track this down.

--=20
You are receiving this mail because:
You are the assignee for the bug.