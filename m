From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Wed, 29 May 2013 15:48:41 +0000 (UTC)
Message-ID: <20130529154841.9463611FADB@bugzilla.kernel.org>
References: <bug-58761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58761


Dirk Brandewie <dirk.brandewie@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dirk.brandewie@gmail.com




--- Comment #3 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-05-29 15:48:40 ---
The frequency/p-state is separate per thread, all threads non-idle threads will
run at the frequency that will satisfy all the requests.  The CPU itself
chooses the actual P-state based on all the requests. 

So all cores/threads are logically separate but do affect other cores.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
