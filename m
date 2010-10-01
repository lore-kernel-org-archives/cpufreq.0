From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor on
 IP35 Pro(Intel P35-ICH9R)
Date: Fri, 1 Oct 2010 15:15:55 GMT
Message-ID: <201010011515.o91FFtEO006887@demeter1.kernel.org>
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





--- Comment #9 from Thomas Renninger <trenn@suse.de>  2010-10-01 15:15:52 ---
Eh, you might want to write a tiny a patch to blacklist this machine to not use
passive cooling automatically as described in comment #5 and send it to the
acpi list. You can read out needed info from dmidecode.
If you do this, please let me know and the bug can be set fixed.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
