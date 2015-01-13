From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Tue, 13 Jan 2015 03:01:10 +0000
Message-ID: <bug-91141-12968-p00Xwr9Ypl@https.bugzilla.kernel.org/>
References: <bug-91141-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-91141-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91141

Brett Johnson <spam@brettcave.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|CLOSED                      |NEEDINFO
         Resolution|DOCUMENTED                  |---

--- Comment #9 from Brett Johnson <spam@brettcave.net> ---
The BIOS supports it and all is enabled. As I stated above, multiple P4's
worked under the 2.6 kernels. Under p4-clockmod I can manually change the
processor frequencies as seen by cpuinfo_cur_freq. Manual changes don't help,
though. Since p4-clockmod isn't used anymore, does acpi-cpufreq support P4's?
Or is there another kernel module supposed to do this?

-- 
You are receiving this mail because:
You are the assignee for the bug.
