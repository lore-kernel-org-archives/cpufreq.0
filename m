From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Sun, 24 Mar 2013 22:09:48 +0000 (UTC)
Message-ID: <20130324220948.F234E11FB35@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #16 from rocko <rockorequin@hotmail.com>  2013-03-24 22:09:48 ---
I just encountered this again on 3.9-rc4 but this time after a resume rather
than a reboot. All eight cores were stuck at 2.00GHz. Suspending and resuming
again made them drop back to the more normal 0.8GHz.

This bug is marked as needinfo. What more info is required?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
