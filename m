From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42858] thermal throttling doesn't seem to trigger on Thinkpad
 T420s
Date: Tue, 6 Mar 2012 02:24:16 GMT
Message-ID: <201203060224.q262OGq0013509@bugzilla.kernel.org>
References: <bug-42858-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42858-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42858


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |acpi-bugzilla@lists.sourcef
                   |                            |orge.net




--- Comment #2 from Len Brown <lenb@kernel.org>  2012-03-06 02:24:16 ---
what kernel version  (uname -a)

please show either

# grep . /proc/acpi/thermal*/*/

or

# grep . /sys/class/thermal/*/*

to show us what the trip points and current temperatures are.

if you booth without the thinkpad_acpi driver,
does the system behave differently?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
