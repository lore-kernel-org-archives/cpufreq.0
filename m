From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Thu, 26 Aug 2010 14:39:09 GMT
Message-ID: <201008261439.o7QEd9dX023154@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D17001





--- Comment #3 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  201=
0-08-26 14:38:45 ---
Sorry, using the performance governor was my bad - I almost always swit=
ch to
performace manually because working on that computer with 800MHz ist ju=
st
painful.

I rebooted the machine to get some clean results and ran some CPU inten=
sive
calculations with matlab, the load was at 100% for quite some time and =
the
frequency did not change at all.
Temperature can't be the problem since the CPU temperature was reported=
 as
35=C2=B0C-40=C2=B0C (I checked), with the performance governor the temp=
erature will go
above 70=C2=B0C before the CPU slows down because of too high temperatu=
re.

I'll append the information you requested now.
Please also note the following:

# cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
2001000 0
2000000 0
1600000 0
1200000 0
800000 84859

Was done with ondemand governor enabled this time ;)

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are on the CC list for the bug.