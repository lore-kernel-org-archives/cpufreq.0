From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Fri, 8 Oct 2010 12:59:41 GMT
Message-ID: <201010081259.o98CxfiC003594@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO




--- Comment #3 from Thomas Renninger <trenn@suse.de>  2010-10-08 12:59:38 ---
Cpufreq info is embedded into dynamically loaded ACPI tables which you need to
dump manually. Please run:
acpidump --addr 0xAADA3918 --length 0x3FB >/tmp/CPU0IST
acpidump --addr 0xAADA2A98  --length 0x303 >/tmp/APIST
acpidump --addr 0xAADA1018 --length 0x8A9 >/tmp/CPU0CST
acpidump --addr 0xAADA0D98 --length 0x119 >/tmp/APCST
and attach (zipped?) output files. Thanks.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
