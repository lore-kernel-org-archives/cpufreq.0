From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Tue, 10 Sep 2013 13:15:48 +0000
Message-ID: <bug-60839-12968-s9KmFEVM8p@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60839

--- Comment #4 from Sven K=C3=B6hler <sven.koehler@gmail.com> ---
(In reply to Lan Tianyu from comment #3)
> > b) userspace should never be able to set scaling_max_freq to a valu=
e larger
> > than bios_limit
>=20
> Actually, you can set the value larger than bios_limit and it will wo=
rks
> when bios_limit raises.

That is exactly what didn't work! A write to the scaling_max_freq via s=
ysfs was
clipped by bios_limit, as far as I can tell. It never want up again, af=
ter a
write to scaling_max_freq occured. I reproduced this having a small whi=
le loop
in the bash shell, that wrote the maximum CPU frequency to scaling_max_=
freq
while bios_limit was low.

I will try to reproduce the issue again and post the bash loop code her=
e.

--=20
You are receiving this mail because:
You are the assignee for the bug.