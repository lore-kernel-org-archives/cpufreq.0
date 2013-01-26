From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Sat, 26 Jan 2013 13:28:17 +0000 (UTC)
Message-ID: <20130126132817.B651F11FED3@bugzilla.kernel.org>
References: <bug-48341-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-48341-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D48341





--- Comment #4 from Rafael J. Wysocki <rjw@sisk.pl>  2013-01-26 13:28:1=
6 ---
On Saturday, January 26, 2013 12:00:54 PM bugzilla-daemon@bugzilla.kern=
el.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D48341

> --- Comment #3 from =C3=81lvaro Castillo <netsys@fedoraproject.org>  =
2013-01-26 12:00:53 ---
> Does not work on A6-4440M
> powernow-k8: this CPU is not supported anymore, using acpi-cpufreq in=
stead.
>=20
> 3.7.2-204.fc18.x86_64

Can you please test the current mainline (v3.8-rc5 as of today)?

A few patches have been applied to it affecting this area.


--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.