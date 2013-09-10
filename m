From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Tue, 10 Sep 2013 09:46:17 +0000
Message-ID: <bug-60839-12968-RDStYSFNoT@https.bugzilla.kernel.org/>
References: <bug-60839-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-60839-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60839

Sven K=C3=B6hler <sven.koehler@gmail.com> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #2 from Sven K=C3=B6hler <sven.koehler@gmail.com> ---
(In reply to Lan Tianyu from comment #1)
> Hi:
>      This sounds like a user space issue. Bios limit will rise after
> plugging/unplugging AC and laptop-mode-tools also should update
> scaling_max_freq. Cpufreq core schedules freq scope according user sp=
ace
> configuration. If user space tool doesn't extend the scope according =
bios
> limit after plugging/unplugging AC, the scope will keep low cpufreq.

=46irst of all, does the kernel provide any hook to run a script every =
time
bios_limit changes or do you expect userspace to do polling?

Second, you can't be serious that the sysfs interface should remain as
inconsistent as it is now. Clearly, the internal state of scaling_max_f=
req and
bios_limit can be one, where scaling_max_freq is larger than bios_limit=
=2E This
is very clear since I observed that (unless userspace tries to change
scaling_max_freq) the value of scaling_max_freq will increase as bios_l=
imit
increases. At time when bios_limit is low, userspace cannot even find o=
ut about
the true state of scaling_max_freq (which is larger than bios_limit) as=
 the
value obtainable via sysfs is always clipped. Obviously, knowing that s=
uch a
state exists, it is dubious why it can't be configured.

Thirdly, I'd really like know the rational behind the decision to that=20
a) userspace should never be able to observe, that scaling_max_freq is =
actually
kernel internally larger than bios_limit=20
b) userspace should never be able to set scaling_max_freq to a value la=
rger
than bios_limit

IMHO, both (a) and (b) are wrong, in the sense that there is no good re=
ason in
favour of (a) and (b) and many reasons against (a) and (b). A very stro=
ng
reason against (a) is the very simple fact that userspace cannot tell w=
hether
the current maximum CPU frequency is limited by the BIOS or the value o=
f
scaling_max_freq.

--=20
You are receiving this mail because:
You are the assignee for the bug.