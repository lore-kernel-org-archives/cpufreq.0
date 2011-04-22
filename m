From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 33742] Unable to raise CPU frequency of notebook after AC
 adapter disconnect and reconnect
Date: Fri, 22 Apr 2011 09:17:27 GMT
Message-ID: <201104220917.p3M9HRsb005158@demeter1.kernel.org>
References: <bug-33742-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-33742-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D33742


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |trenn@suse.de
          Component|cpufreq                     |BIOS
         AssignedTo|cpufreq@vger.kernel.org     |acpi_bios@kernel-bugs.=
osdl.
                   |                            |org
            Product|Power Management            |ACPI




--- Comment #5 from Thomas Renninger <trenn@suse.de>  2011-04-21 10:13:=
12 ---
> and the problems that I am seeing date back from at least version 2.6=
=2E24, from
> what I can remember.
Most likely a BIOS, _PPC issue, yes it is:
before:
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit:2001000
after:
/sys/devices/system/cpu/cpu0/cpufreq/bios_limit:800000

That means _PPC does not return 0 anymore and BIOS tells the OS to limi=
t the
frequency. This is an ACPI problem, cpufreq subsystem bevhaves fine (at=
 least
this was always the case with similar bug reports recently).
-> Re-assign to ACPI component.

> Please attach dmesg output including an AC unplug/replug cycle.
Best boot with log_buf_len=3D16777216
before you do the unplug/replug cycle copy this into a file, make it ex=
ecutable
and follow instructions:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/bash

echo 0xFFFFFFFF >/sys/module/acpi/parameters/debug_layer
echo 0xF >/sys/module/acpi/parameters/debug_level
echo 7 >/sys/module/cpufreq/parameters/debug
logger "Before unplug"
echo "It's time to unplug ..."
sleep 5
logger "AC got unplugged"
echo "It's time to re-plug"
sleep 5
echo 0x0 >/sys/module/acpi/parameters/debug_layer
echo 0 >/sys/module/cpufreq/parameters/debug
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
and then attach whole dmesg and also acpidump output.

Hm, before you should check for a BIOS upgrade and whether you find rel=
ated
BIOS settings.

--- Comment #6 from Rog=C3=A9rio Brito <rbrito@ime.usp.br>  2011-04-22 =
09:17:19 ---
Hi, Rafael, Thomas.

Thank you for your answers. Here comes my follow up.

(In reply to comment #5)
> That means _PPC does not return 0 anymore and BIOS tells the OS to li=
mit the
> frequency. This is an ACPI problem, cpufreq subsystem bevhaves fine (=
at least
> this was always the case with similar bug reports recently).
> -> Re-assign to ACPI component.

OK, sorry for assigning that to the wrong component. It is not always o=
bvious
where to file some bugs.

> > Please attach dmesg output including an AC unplug/replug cycle.
> Best boot with log_buf_len=3D16777216
> before you do the unplug/replug cycle copy this into a file, make it =
executable
> and follow instructions:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> #!/bin/bash
>=20
> echo 0xFFFFFFFF >/sys/module/acpi/parameters/debug_layer
> echo 0xF >/sys/module/acpi/parameters/debug_level
> echo 7 >/sys/module/cpufreq/parameters/debug
> logger "Before unplug"
> echo "It's time to unplug ..."
> sleep 5
> logger "AC got unplugged"
> echo "It's time to re-plug"
> sleep 5
> echo 0x0 >/sys/module/acpi/parameters/debug_layer
> echo 0 >/sys/module/cpufreq/parameters/debug
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

OK. I did all that. As the logs are very big, I am including them compr=
essed
here. Please let me know if that's not what you want.

> Hm, before you should check for a BIOS upgrade and whether you find r=
elated
> BIOS settings.

Unfortunately, I first tried to find the most recent BIOS update from t=
he
manufacturer (it's dated from 2010, IIRC) and, then, after flashing and
noticing that it wasn't working, I filed the bug.

I don't quite expect any updated version of the BIOS from MSI. Would th=
ere be
any way to circumvent the buggy BIOS? If not in a clean and generic way=
,
perhaps passing the kernel any extra option?


Thanks,

Rog=C3=A9rio Brito.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.