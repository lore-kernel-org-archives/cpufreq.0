From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Thu, 30 May 2013 16:51:33 +0000 (UTC)
Message-ID: <20130530165133.2FC9911FB8F@bugzilla.kernel.org>
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


Benoit Pradelle <b.pradelle@gmail.com> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |b.pradelle@gmail.com




--- Comment #14 from Benoit Pradelle <b.pradelle@gmail.com>  2013-05-30=
 16:51:31 ---
I totally agree with Jean-Philippe: some information is lost with the 3=
=2E9
version and this information *is* useful to correctly set CPU frequenci=
es. So
either the related_cpus field meaning should be restored or a new field=
 should
be added.

If you doubt that such information is valuable, please consider all the=
 runtime
DVFS controllers such as beta adaptive [1], or CPU MISER [2]. Those sys=
tems, to
be ported on current multicore processors, have to take a great care of=
 the
actually applied CPU frequency (not only that requested per core but th=
e one
actually in use). If it is impossible to determine what cores share the=
 same
frequency, it is impossible to perform such kind of DVFS on multicore C=
PUs in a
portable way.

If you think that related_cpus is misleading (and I'd totally agree wit=
h you on
that), then maybe a new field is required.


[1] C.-h. Hsu and W.-c. Feng, =E2=80=9CA power-aware run-time system fo=
r
high-performance computing,=E2=80=9D in Proceedings of the 2005 ACM/IEE=
E conference on
Supercomputing.
[2] R. Ge, X. Feng, W. chun Feng, and K. Cameron, =E2=80=9CCPU MISER: A
performance-directed, run-time system for power-aware clusters,=E2=80=9D=
 in Parallel
Processing, 2007. ICPP 2007.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.