From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't
	enable	EnchancedSpeedStep
Date: Tue, 20 Jun 2006 14:27:19 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454192827@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C694B0.504B24D7"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Ben Kevan <ben.kevan@gmail.com>, Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, linux@brodo.de

This is a multi-part message in MIME format.

------_=_NextPart_001_01C694B0.504B24D7
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Hmmm.. Looks like BIOS is giving bogus PSS information and as there is
one valid ACPI P-state we are not falling back to hardcoded tables.
Attached patch will tell what is the PSS information that BIOS is giving
to OS.

Also, you can try disabling CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI and see
whether the hardcoded tables works for you.

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Ben Kevan
>Sent: Tuesday, June 20, 2006 1:32 PM
>To: Jeremy Fitzhardinge
>Cc: cpufreq@lists.linux.org.uk; Bruno Ducrot; linux@brodo.de
>Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't=20
>enable EnchancedSpeedStep
>
>On Tuesday 20 June 2006 11:07, Jeremy Fitzhardinge wrote:
>> Bruno Ducrot wrote:
>> > That's strange.  Even if there is no processor object=20
>declared onto ACPI
>> > tables it should work with=20
>CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE set since
>> > it's a bania.
>>
>> This message specifically means that the CPU isn't allowing EST to be
>> enabled, even though the CPU has the capability.  I think=20
>the BIOS can
>> lock this down, like VT on later processors.  Though I can't imagine
>> why, unless the machine is being sold as a cheaper/slower system than
>> the CPU they put in it...
>>
>> What does the SMM patch do?
>>
>>     J
>
>I patched my kernel with Bruno's suggestion but that did not=20
>change anything.=20
>I guess from looking at it, I should get a Kernel Error Message=20
>with "notifying SMM bios failed" message. I will check the=20
>logs (It is on a=20
>seperate HDD for this same machine (need to keep my production=20
>machine up and=20
>clean).=20
>
>I have installed 2.6.17 and compiled with the cpufreq debug,=20
>and here is the=20
>portion of dmesg I am sure you are intrested in:
>
>Netfilter messages via NETLINK v0.30.
>ip_conntrack version 2.4 (8190 buckets, 65520 max) - 224 bytes=20
>per conntrack
>ACPI: AC Adapter [ADP1] (on-line)
>ACPI: Battery Slot [BAT1] (battery present)
>ACPI: Battery Slot [BAT2] (battery absent)
>ACPI: Power Button (FF) [PWRF]
>ACPI: Power Button (CM) [PWRB]
>ACPI: Lid Switch [LID]
>toshiba_acpi: Toshiba Laptop ACPI Extras version 0.18
>toshiba_acpi:     HCI method: \_SB_.VALD.GHCI
>BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
>audit(1150830156.185:2): audit_backlog_limit=3D256 old=3D64 by=20
>auid=3D4294967295
>audit(1150830156.769:3): audit_pid=3D2432 old=3D0 by auid=3D4294967295
>IA-32 Microcode Update Driver: v1.14 <tigran@veritas.com>
>cpufreq-core: trying to register driver centrino
>cpufreq-core: adding CPU 0
>speedstep-centrino: P1 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P2 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P3 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P4 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P5 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P6 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P7 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P8 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P9 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P10 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P11 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P12 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P13 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P14 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: P15 has larger frequency (65535) than P0=20
>(600), skipping
>speedstep-centrino: adding state 0 with frequency 600000 and=20
>control value=20
>0610
>speedstep-centrino: adding state 1 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 2 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 3 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 4 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 5 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 6 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 7 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 8 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 9 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 10 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 11 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 12 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 13 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 14 with frequency 0 and=20
>control value ffff
>speedstep-centrino: adding state 15 with frequency 0 and=20
>control value ffff
>speedstep-centrino: skipping state 1
>speedstep-centrino: skipping state 2
>speedstep-centrino: skipping state 3
>speedstep-centrino: skipping state 4
>speedstep-centrino: skipping state 5
>speedstep-centrino: skipping state 6
>speedstep-centrino: skipping state 7
>speedstep-centrino: skipping state 8
>speedstep-centrino: skipping state 9
>speedstep-centrino: skipping state 10
>speedstep-centrino: skipping state 11
>speedstep-centrino: skipping state 12
>speedstep-centrino: skipping state 13
>speedstep-centrino: skipping state 14
>speedstep-centrino: skipping state 15
>speedstep-centrino: trying to enable Enhanced SpeedStep (111088)
>speedstep-centrino: couldn't enable Enhanced SpeedStep
>cpufreq-core: initialization failed
>cpufreq-core: no CPU initialized for driver centrino
>cpufreq-core: unregistering CPU 0
>acpi-cpufreq: acpi_cpufreq_init
>cpufreq-core: trying to register driver acpi-cpufreq
>cpufreq-core: adding CPU 0
>acpi-cpufreq: acpi_cpufreq_cpu_init
>cpufreq-core: initialization failed
>cpufreq-core: no CPU initialized for driver acpi-cpufreq
>cpufreq-core: unregistering CPU 0
>speedstep-lib: x86: 6, model: 9
>speedstep-ich: Intel(R) SpeedStep(TM) capable processor not found
>e1000: eth0: e1000_watchdog_task: NIC Link is Up 100 Mbps Full Duplex
>NET: Registered protocol family 17
>
>Bruno / J,=20
>
>What should I be looking for with the patched=20
>speedstep-centrino.c? Where=20
>would this message be? In my /var/log/messages or under=20
>another log file?=20
>
>Thanks for all your help?
>
>Ben
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>

------_=_NextPart_001_01C694B0.504B24D7
Content-Type: application/octet-stream;
	name="acpi_pss_debug.patch"
Content-Transfer-Encoding: base64
Content-Description: acpi_pss_debug.patch
Content-Disposition: attachment;
	filename="acpi_pss_debug.patch"

MjUzYTI1NCwyNTUKPiAJcHJpbnRrKCJGb3VuZCAlZCBwZXJmb3JtYW5jZSBzdGF0ZXNcbiIsCj4g
CQkJICBwc3MtPnBhY2thZ2UuY291bnQpOwoyNzFhMjc0Cj4gCQlwcmludGsoIkV4dHJhY3Rpbmcg
c3RhdGUgJWRcbiIsIGkpOwoyODJhMjg2LDI5Mgo+IAkJcHJpbnRrKCJTdGF0ZSBbJWRdOiBjb3Jl
X2ZyZXF1ZW5jeVslZF0gcG93ZXJbJWRdIHRyYW5zaXRpb25fbGF0ZW5jeVslZF0gYnVzX21hc3Rl
cl9sYXRlbmN5WyVkXSBjb250cm9sWzB4JXhdIHN0YXR1c1sweCV4XVxuIiwKPiAJCQkJICBpLAo+
IAkJCQkgICh1MzIpIHB4LT5jb3JlX2ZyZXF1ZW5jeSwKPiAJCQkJICAodTMyKSBweC0+cG93ZXIs
Cj4gCQkJCSAgKHUzMikgcHgtPnRyYW5zaXRpb25fbGF0ZW5jeSwKPiAJCQkJICAodTMyKSBweC0+
YnVzX21hc3Rlcl9sYXRlbmN5LAo+IAkJCQkgICh1MzIpIHB4LT5jb250cm9sLCAodTMyKSBweC0+
c3RhdHVzKTsK

------_=_NextPart_001_01C694B0.504B24D7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C694B0.504B24D7--

