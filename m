From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 20:00:30 +0000 (UTC)
Message-ID: <20130530200030.CF79511FB8F@bugzilla.kernel.org>
References: <bug-58761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D58761





--- Comment #16 from Benoit Pradelle <b.pradelle@gmail.com>  2013-05-30=
 20:00:30 ---
(In reply to comment #15)
> (In reply to comment #14)
> > I totally agree with Jean-Philippe: some information is lost with t=
he 3.9
> > version and this information *is* useful to correctly set CPU frequ=
encies. So
> > either the related_cpus field meaning should be restored or a new f=
ield should
> > be added.
> >=20
> > If you doubt that such information is valuable, please consider all=
 the runtime
> > DVFS controllers such as beta adaptive [1], or CPU MISER [2]. Those=
 systems, to
> > be ported on current multicore processors, have to take a great car=
e of the
> > actually applied CPU frequency (not only that requested per core bu=
t the one
> > actually in use). If it is impossible to determine what cores share=
 the same
> > frequency, it is impossible to perform such kind of DVFS on multico=
re CPUs in a
> > portable way.
> >=20
>=20
> Exactly it is not possible to tell what frequency the core will run a=
t unless
> the same pstate is requested for all cores.  Even then it is not guar=
anteed in
> the presence of thermal throttling.
>=20
> You do NOT have positive control over the frequency the core runs at.=
  You
> requested your desired performance level and the processor ensures th=
at you get
> it.
>=20
> The papers below reference processors that did not have this function=
ality. the
> assumptions about frequency control no longer hold (at least for curr=
ent Intel
> Processors).
>=20

OK I understand your point. However, even if in some cases (thermal thr=
eshold
reached, TurboBoost, ...) the processors ignores/goes beyond the users
requests, most of the time, when the user requests a frequency, it is
effectively set by the processor. So, yes, the users still have some so=
rt of
control over CPU frequency in the general case (even if it went from pr=
ecise
frequency control to performance level requests) and it matters a lot w=
hen
building and experimenting new DVFS controlers.

Going back to the topic, people are designing DVFS controlers and have =
to be
aware of the cores using the same frequency in order to achieve efficie=
nt
frequency control on multicore processors. A file was previously statin=
g that
relation so it should not be such a big deal to restore the same inform=
ation in
another file. Isn't it?

>=20
> > If you think that related_cpus is misleading (and I'd totally agree=
 with you on
> > that), then maybe a new field is required.
> >=20
> >=20
> > [1] C.-h. Hsu and W.-c. Feng, =E2=80=9CA power-aware run-time syste=
m for
> > high-performance computing,=E2=80=9D in Proceedings of the 2005 ACM=
/IEEE conference on
> > Supercomputing.
> > [2] R. Ge, X. Feng, W. chun Feng, and K. Cameron, =E2=80=9CCPU MISE=
R: A
> > performance-directed, run-time system for power-aware clusters,=E2=80=
=9D in Parallel
> > Processing, 2007. ICPP 2007.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.