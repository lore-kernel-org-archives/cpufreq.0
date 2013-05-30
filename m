From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 17:37:34 +0000 (UTC)
Message-ID: <20130530173734.5C7EF11FB8F@bugzilla.kernel.org>
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





--- Comment #15 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-05=
-30 17:37:33 ---
(In reply to comment #14)
> I totally agree with Jean-Philippe: some information is lost with the=
 3.9
> version and this information *is* useful to correctly set CPU frequen=
cies. So
> either the related_cpus field meaning should be restored or a new fie=
ld should
> be added.
>=20
> If you doubt that such information is valuable, please consider all t=
he runtime
> DVFS controllers such as beta adaptive [1], or CPU MISER [2]. Those s=
ystems, to
> be ported on current multicore processors, have to take a great care =
of the
> actually applied CPU frequency (not only that requested per core but =
the one
> actually in use). If it is impossible to determine what cores share t=
he same
> frequency, it is impossible to perform such kind of DVFS on multicore=
 CPUs in a
> portable way.
>=20

Exactly it is not possible to tell what frequency the core will run at =
unless
the same pstate is requested for all cores.  Even then it is not guaran=
teed in
the presence of thermal throttling.

You do NOT have positive control over the frequency the core runs at.  =
You
requested your desired performance level and the processor ensures that=
 you get
it.=20

The papers below reference processors that did not have this functional=
ity. the
assumptions about frequency control no longer hold (at least for curren=
t Intel
Processors).


> If you think that related_cpus is misleading (and I'd totally agree w=
ith you on
> that), then maybe a new field is required.
>=20
>=20
> [1] C.-h. Hsu and W.-c. Feng, =E2=80=9CA power-aware run-time system =
for
> high-performance computing,=E2=80=9D in Proceedings of the 2005 ACM/I=
EEE conference on
> Supercomputing.
> [2] R. Ge, X. Feng, W. chun Feng, and K. Cameron, =E2=80=9CCPU MISER:=
 A
> performance-directed, run-time system for power-aware clusters,=E2=80=
=9D in Parallel
> Processing, 2007. ICPP 2007.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.