From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29522] Unable to use any kind of frequency scaling
Date: Sun, 20 Feb 2011 10:48:13 GMT
Message-ID: <201102201048.p1KAmDt1006550@demeter2.kernel.org>
References: <bug-29522-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-29522-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29522





--- Comment #1 from Rog=C3=A9rio Brito <rbrito@ime.usp.br>  2011-02-20 =
10:48:12 ---
Hi there.

Just as an extra data point, with the patch that I sent in the earlier =
package,
I can indeed (as expected) set lower frequencies with ondemand (that is=
, *it*
sets the frequency dynamically).

One benefit of this is that, when my computer is left idle, it does not=
 heat as
much as it used to, but I fear that there is no voltage being decreased=
, and,
therefore, no power economy.

Is that right? How should one implement it "the right way"? I just know=
 some C,
but I don't know how program physical devices. I can, OTOH, test as man=
y
patches as you'd like me to.


Thanks in advance for any help, Rog=C3=A9rio Brito.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.