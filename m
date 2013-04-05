From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 15:17:33 +0000 (UTC)
Message-ID: <20130405151733.60D0011FB79@bugzilla.kernel.org>
References: <bug-56101-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-56101-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=56101


S. Kalteis <spam@kernelspace.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|                            |INVALID




--- Comment #14 from S. Kalteis <spam@kernelspace.de>  2013-04-05 15:17:33 ---
Ah, ok, I read the -i option as output update interval (like top -d <secs>).

Stressing one core indeed shows a frequency of 2.4 GHz. So it *is* a BIOS bug.

I guess IBM won't release a new BIOS revision for a machine that old. :-)

Thank you for your time & effort, case closed.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
