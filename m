From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12389] acpi-cpufreq doesn't detect speed limit when cold booted
 on battery
Date: Sat, 6 Nov 2010 20:04:56 GMT
Message-ID: <201011062004.oA6K4uSr024113@demeter2.kernel.org>
References: <bug-12389-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12389-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12389


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |trenn@suse.de
          Component|cpufreq                     |Config-Processors
         AssignedTo|cpufreq@vger.kernel.org     |acpi_config-processors@kern
                   |                            |el-bugs.osdl.org
            Product|Power Management            |ACPI




--- Comment #3 from Thomas Renninger <trenn@suse.de>  2010-11-06 20:04:54 ---
This should be an ACPI, not a cpufreq bug.
Some things you could check:
  - BIOS up-to-date?
  - Is the limitation done through _PPC:
cat /sys/devices/system/cpu/cpu0/cpufreq/bios_limit


The bios limit (_PPC) was not evaluated at (processor.ko) driver load time, but
only when CPU notification events where thrown. It sounds like you see this.
This got fixed by commit:
455c0d71d46e86b0b7ff2c9dcfc19bc162302ee9

Above patch could make trouble on other systems and you set "Fedora tree".
Can you double check that above commit is included in your tested kernel.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
