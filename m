From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Sat, 26 Jan 2013 12:00:54 +0000 (UTC)
Message-ID: <20130126120054.50DF911FE9C@bugzilla.kernel.org>
References: <bug-48341-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-48341-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D48341


=C3=81lvaro Castillo <netsys@fedoraproject.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |netsys@fedoraproject.o=
rg




--- Comment #3 from =C3=81lvaro Castillo <netsys@fedoraproject.org>  20=
13-01-26 12:00:53 ---
Does not work on A6-4440M
powernow-k8: this CPU is not supported anymore, using acpi-cpufreq inst=
ead.

3.7.2-204.fc18.x86_64

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.