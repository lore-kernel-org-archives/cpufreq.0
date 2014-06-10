From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 16:47:55 +0000
Message-ID: <bug-77201-12968-RWyPf8CqaB@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=77201

--- Comment #27 from registosites@hotmail.com ---
I've tried using the crude log method, with
cat /proc/kmsg &
and then blindly typing the commands to offline/online the cpu.

The result is attached as a picture.

-- 
You are receiving this mail because:
You are the assignee for the bug.
