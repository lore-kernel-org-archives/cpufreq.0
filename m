From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug
 51741]=?UTF-8?Q?=20powernow=2Dk8=20calls=20for=20acpi=2Dcpufreq=20but=20doesn=E2=80=99t=20warn=20if=20it=E2=80=99s=20not=20available?=
Date: Tue, 12 Feb 2013 20:12:42 +0000 (UTC)
Message-ID: <20130212201242.4E31B11FF22@bugzilla.kernel.org>
References: <bug-51741-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-51741-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D51741


=46r=C3=A9d=C3=A9ric L. W. Meunier <others@fredlwm.net> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |others@fredlwm.net




--- Comment #3 from Fr=C3=A9d=C3=A9ric L. W. Meunier <others@fredlwm.ne=
t>  2013-02-12 20:12:41 ---
After running 'make oldconfig' from 3.7.3 to 3.7.7, it silently removed=
 the
"CONFIG_X86_POWERNOW_K8=3Dm" line from .config.

I would expect it to add the new dependencies.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.