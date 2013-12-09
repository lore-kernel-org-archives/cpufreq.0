From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 66751] [BISECTED]Does not resume from suspend (bisected)
Date: Mon, 09 Dec 2013 14:39:09 +0000
Message-ID: <bug-66751-12968-PGuJtoyaAv@https.bugzilla.kernel.org/>
References: <bug-66751-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-66751-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D66751

--- Comment #3 from Bj=C3=B8rn Mork <bjorn@mork.no> ---
Yes, this is a pretty interesting one. The bug is caused by the combina=
tion of
two commits added between -rc2 and -rc3:

 5a87182aa21d cpufreq: suspend governors on system suspend/hibernate
 2167e2399dc5 cpufreq: fix garbage kobjects on errors during suspend/re=
sume

The order these are applied is really arbitrary, and the bisect will po=
int to
the last one applied. Which happens to be 2167e2399dc5. But I will stil=
l claim
that it was commit 5a87182aa21d that caused this bug by adding even mor=
e
special handling of cpufreq suspend.  This needs to be done properly if=
 it is
done at all, including hooks for drivers and governors. Adding special =
cases
and "if suspending" tests here and there with subtle implicit dependenc=
ies
between the different code blocks is not going to fly.

Note that reverting only 5a87182aa21d will fix the problem, with simple=
r code
and no dangling sysfs files as a result.

--=20
You are receiving this mail because:
You are the assignee for the bug.