From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 72361] AMD APU reset infinite
Date: Sun, 11 May 2014 15:09:16 +0000
Message-ID: <bug-72361-12968-DwmAw9XEg8@https.bugzilla.kernel.org/>
References: <bug-72361-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-72361-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=72361

--- Comment #4 from Mika Hyttinen <mika.hyttinen@gmail.com> ---
Forgot to add kernel version:

Linux HTPC 3.15.0-031500rc5-generic #201405091635 SMP Fri May 9 20:36:31 UTC
2014 x86_64 x86_64 x86_64 GNU/Linux

I have tested from 3.13 -> 3.15rc5 and the issue is in all of them.

-- 
You are receiving this mail because:
You are the assignee for the bug.
