From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Tue, 18 Jun 2013 12:10:31 +0000 (UTC)
Message-ID: <20130618121031.D802D11FB51@bugzilla.kernel.org>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D59781


Toralf F=C3=B6rster <toralf.foerster@gmx.de> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |toralf.foerster@gmx.de




--- Comment #8 from Toralf F=C3=B6rster <toralf.foerster@gmx.de>  2013-=
06-18 12:10:31 ---
/me wonders whether an issue at my system is connected to this bug repo=
rt too.

I'm using the ondemand governor at a ThinkPad T420 with a i5 (4 cores, =
2.6 GHz
max frequency, boost at 3.1 GHz). Since kernel 3.10-rcX I've to define
"intel_pstate=3Ddisable" at the kernel command line to force using the =
acpi
driver (P-State does not know anything about niced processes ...)

Now the problem:
After s2ram and wakeup I notice a higher temperatur and fan noise and r=
ealized,
that 3 of 4 cpu cores runs constantly at 2.6 GHz (cpu1-3, cpu0 were at =
the
expected 800 MHz for low load) - independend from the load. I've to exp=
licitely
set the max freq to 2.4 GHz and back to 2.6 GHz. Then the current frequ=
ency was
scaled accordingly to the load.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.