From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 60839] scaling_max_freq cannot be set to values larger than
 bios_limit
Date: Tue, 10 Sep 2013 08:28:55 +0000
Message-ID: <bug-60839-12968-nF23raoEHG@https.bugzilla.kernel.org/>
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
             Status|NEW                         |ASSIGNED
                 CC|                            |tianyu.lan@intel.com

--- Comment #1 from Lan Tianyu <tianyu.lan@intel.com> ---
(In reply to Sven K=C3=B6hler from comment #0)
> Background:
>=20
> On my Dell Latitude E6410, the following happens if the power supply =
is
> plugged in or plugged out: The value of bios_limit drops for all CPUs=
 to
> cpuinfo_min_freq. Within seconds, it is then gradually increased unti=
l
> bios_limit is equal to cpuinfo_max_freq. I assume, that this serves t=
he
> purpose of detecting the type of attached power supply. The BIOS temp=
orarely
> limits the CPU frequency in order to keep the power consumption low u=
ntil it
> is determined that the power supply is the correct one.
>=20
> Problem description:
>=20
> Assume that nobody is writing to scaling_max_freq and that
> scaling_max_freq=3Dcpuinfo_max_freq initially. Upon switching the pow=
er
> supply,  you observe that the value of scaling_max_freq decreases and=
 then
> gradually increases along with bios_limit. From this I conclude that
> (a) internally, the value for scaling_max_freq can assume values larg=
er than
> bios_limit. However, when reading scaling_max_freq through sysfs the =
value
> is clipped by bios_limit
> (b) there is no good reason, why the internal value of scaling_max_fr=
eq
> shouldn't be set to a value larger than bios_limit.
>=20
> However, any write to scaling_max_freq through sysfs will also be cli=
pped by
> bios_limit. In result, if the value of cpuinfo_max_freq is written to
> scaling_max_freq while bios_limit is low, then the internal value of
> scaling_max_freq will be set to whatever the value of bios_limit is.
>=20
> In my case, this was causing the following problems:
> laptop-mode-tools would write to scaling_max_freq shortly after the p=
ower
> supply was plugged in / unplugged. As the bios_limit would be low at =
that
> point, the internal value of scaling_max_freq would be set to a low v=
alue.
> Hence, cpufreq would never raise the frequencies of my CPUs again eve=
n after
> bios_limit increased. I solved it my disabling the cpufreq related pa=
rts of
> laptop-mode-tools.

Hi:
     This sounds like a user space issue. Bios limit will rise after
plugging/unplugging AC and laptop-mode-tools also should update
scaling_max_freq. Cpufreq core schedules freq scope according user spac=
e
configuration. If user space tool doesn't extend the scope according bi=
os limit
after plugging/unplugging AC, the scope will keep low cpufreq.


>=20
> Also note, that it isn't currently possible to determine the true val=
ue of
> scaling_max_freq as the value returned through sysfs is clipped by
> bios_limit.

--=20
You are receiving this mail because:
You are the assignee for the bug.