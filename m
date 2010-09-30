From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor
Date: Thu, 30 Sep 2010 12:35:50 GMT
Message-ID: <201009301235.o8UCZoG7014379@demeter1.kernel.org>
References: <bug-19262-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19262-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19262


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|cpufreq                     |Power-Thermal
         AssignedTo|trenn@suse.de               |acpi_power-thermal@kernel-b
                   |                            |ugs.osdl.org
            Product|Power Management            |ACPI




--- Comment #5 from Thomas Renninger <trenn@suse.de>  2010-09-30 12:35:45 ---
... and this is the bug, probably BIOS related:

/proc/acpi/thermal_zone/THRM/trip_points
passive:                 0 C: tc1=4 tc2=3 tsp=60 devices=CPU0

Please also attach dmesg and acpidump output.

The param to workaround this issue is:
thermal.psv = 50
to e.g. let the CPU get throttled at 50 C.

There already is a blacklist in drivers/acpi/thermal.c:
static struct dmi_system_id thermal_dmi_table[] __initdata = {
...
        {
         .callback = thermal_psv,
         .ident = "AOpen i915GMm-HFS",
         .matches = {
                DMI_MATCH(DMI_BOARD_VENDOR, "AOpen"),
                DMI_MATCH(DMI_BOARD_NAME, "i915GMm-HFS"),
                },
        },

Also attach dmidecode, if we do not find a generic kernel workaround/fix the
BIOS can get blacklisted to not use the passive trip point by default.

Reassigning to ACPI component -> this is an acpi problem.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
