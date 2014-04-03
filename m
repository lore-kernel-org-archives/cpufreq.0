From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73421] intel/p_state Does not increase into Turbo Boost states
 and does not display all governors. i5-3201M
Date: Thu, 03 Apr 2014 15:37:55 +0000
Message-ID: <bug-73421-12968-7YmqxzLnn8@https.bugzilla.kernel.org/>
References: <bug-73421-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73421-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D73421

--- Comment #5 from Dirk Brandewie <dirk.brandewie@gmail.com> ---
(In reply to =C3=81lvaro Castillo from comment #4)
> This command reports:
>=20
>=20
> msr-tools-1.1.2-8.fc20.x86_64
>=20

The current version of msr-tools is v1.3 which the link above points to=
=2E

> I don't understand this.
>=20
> How can an Intel Core 2 duo more older than my Intel i5 processor It'=
s
> passed 3 generations of releases built. Be more powerful than it?
>=20

Are both systems configured the same?  memory, disk, laptop/desktop/ser=
ver?

Are you building with the same .config on both systems?

> Some conclusions:
> - 1=C2=BA: Intel is lying. I should as good citizen I am report them =
for fraud.
> - 2=C2=BA: Intel_pstate does not working correctly.

So you are getting the highest turbo frequency available when four core=
s are
active. I fail to see how this is an intel_pstate issue.

BTW you got the same results with ondemand.

--=20
You are receiving this mail because:
You are the assignee for the bug.