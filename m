From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58761] related_cpus truncated with acpi-cpufreq driver on
 kernel 3.9.3
Date: Wed, 29 May 2013 16:09:49 +0000 (UTC)
Message-ID: <20130529160949.909F511FADB@bugzilla.kernel.org>
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





--- Comment #5 from Dirk Brandewie <dirk.brandewie@gmail.com>  2013-05-29 16:09:49 ---
So reflecting this relation up through sysfs is not particularly useful IMHO.

Showing only the logical connection is more correct IMHO.

I am not entirely understand why the change was made (not required :-) but is
more accurate from my point of view.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
