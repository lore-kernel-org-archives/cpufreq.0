From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Wed, 11 Jun 2014 13:55:45 +0000
Message-ID: <bug-77201-12968-uEsTUIlEBu@https.bugzilla.kernel.org/>
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

--- Comment #42 from Viresh Kumar <viresh.kumar@linaro.org> ---
(In reply to registosites from comment #40)
> That was the last output before the machine became unresponsive.

Hmm, so it looks like something happened while changing
frequency and core is doing things correctly otherwise.

> I didn't manage to compile this one, it fails with:
>=20
>   CC      drivers/cpuidle/sysfs.o
>   CC      lib/dynamic_debug.o
>   CC [M]  drivers/cpufreq/acpi-cpufreq.o
>   CC      drivers/cpuidle/governors/ladder.o
> drivers/cpufreq/acpi-cpufreq.c: In function =E2=80=98store_boost=E2=80=
=99:
> drivers/cpufreq/acpi-cpufreq.c:160:26: error: =E2=80=98struct cpufreq=
_driver=E2=80=99 has no

I intentionally didn't revert unrelated drivers completely and so this.=
 But
can't you just disable acpi-cpufreq driver and test? I thought yes, and=
 so did
this. Otherwise I would update my branch for you.

--=20
You are receiving this mail because:
You are the assignee for the bug.