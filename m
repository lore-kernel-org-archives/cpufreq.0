From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Tue, 10 Sep 2013 12:45:12 +0000
Message-ID: <bug-60839-12968-d2nyM5cmqn@https.bugzilla.kernel.org/>
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

Lan Tianyu <tianyu.lan@intel.com> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|REOPENED                    |ASSIGNED

--- Comment #3 from Lan Tianyu <tianyu.lan@intel.com> ---
(In reply to Sven K=C3=B6hler from comment #2)
> (In reply to Lan Tianyu from comment #1)
> > Hi:
> >      This sounds like a user space issue. Bios limit will rise afte=
r
> > plugging/unplugging AC and laptop-mode-tools also should update
> > scaling_max_freq. Cpufreq core schedules freq scope according user =
space
> > configuration. If user space tool doesn't extend the scope accordin=
g bios
> > limit after plugging/unplugging AC, the scope will keep low cpufreq=
=2E
>=20
> First of all, does the kernel provide any hook to run a script every =
time
> bios_limit changes or do you expect userspace to do polling?

When bios limit is changed, ACPI processor driver will send an ACPI eve=
nt to
user space.

>=20
> Second, you can't be serious that the sysfs interface should remain a=
s
> inconsistent as it is now.

The scaling_max/min_freq shows current policy limit. Kernel side also w=
ill
change the limit besides user space configuration and so it's inconsist=
ent with
the data set to the attribute.

> Clearly, the internal state of scaling_max_freq
> and bios_limit can be one,=20

No, actually there are some other factors that may change policy limit(=
E,G,
processor throttling controlled by thermal core).

> where scaling_max_freq is larger than bios_limit.
> This is very clear since I observed that (unless userspace tries to c=
hange
> scaling_max_freq) the value of scaling_max_freq will increase as bios=
_limit
> increases. At time when bios_limit is low, userspace cannot even find=
 out
> about the true state of scaling_max_freq (which is larger than bios_l=
imit)
> as the value obtainable via sysfs is always clipped. Obviously, knowi=
ng that
> such a state exists, it is dubious why it can't be configured.
>

Kernel will store the userspace configuration but not show. I think we =
can
introduce some new attributs to show user space configurations if neces=
sory.

> Thirdly, I'd really like know the rational behind the decision to tha=
t=20
> a) userspace should never be able to observe, that scaling_max_freq i=
s
> actually kernel internally larger than bios_limit

I think you said the user space configuration rather than current
policy(scaling_min/max_freq shows). The current policy should take the
bios_limit into account.

> b) userspace should never be able to set scaling_max_freq to a value =
larger
> than bios_limit

Actually, you can set the value larger than bios_limit and it will work=
s when
bios_limit raises.

>=20
> IMHO, both (a) and (b) are wrong, in the sense that there is no good =
reason
> in favour of (a) and (b) and many reasons against (a) and (b). A very=
 strong
> reason against (a) is the very simple fact that userspace cannot tell
> whether the current maximum CPU frequency is limited by the BIOS or t=
he
> value of scaling_max_freq.

Actually, the cpu freq may be limited by other factors besides bios lim=
it. So
new attributes may be helpful to identify whether kernel side has chang=
ed the
cpufreq scope.

--=20
You are receiving this mail because:
You are the assignee for the bug.