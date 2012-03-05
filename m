From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42858] thermal throttling doesn't seem to trigger on Thinkpad
 T420s
Date: Mon, 5 Mar 2012 07:39:54 GMT
Message-ID: <201203050739.q257dsiU011987@bugzilla.kernel.org>
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





--- Comment #1 from Pierre Ossman <pierre-bugzilla@ossman.eu>  2012-03-05 07:39:54 ---
I also noticed this in dmesg:

[ 1510.425741] thinkpad_acpi: unknown possible thermal alarm or keyboard event
received
[ 1510.425752] thinkpad_acpi: unhandled HKEY event 0x6040
[ 1510.425757] thinkpad_acpi: please report the conditions when this event
happened to ibm-acpi-devel@lists.sourceforge.net

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
