From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 43284] CPU stuck at minimum frequency - HP Compaq 6715b
Date: Tue,  5 Jun 2012 04:38:37 +0000 (UTC)
Message-ID: <20120605043837.6170211FC41@bugzilla.kernel.org>
References: <bug-43284-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-43284-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43284





--- Comment #2 from Suloev Dmitry <suloevdmitry@gmail.com>  2012-06-05 04:38:37 ---
Problem in commit 9bcb8118965ab4631a65ee0726e6518f75cda6c5
After reverting of this commit all problem go away.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
