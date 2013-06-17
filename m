From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 59781] intel_pstate synchronizes frequencies on wake from
 suspend
Date: Mon, 17 Jun 2013 11:37:35 +0000 (UTC)
Message-ID: <20130617113735.0E23B11FB35@bugzilla.kernel.org>
References: <bug-59781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-59781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59781





--- Comment #3 from pqwoerituytrueiwoq@gmail.com  2013-06-17 11:37:34 ---
In 3.10.0rc4 it behaved like it does after suspend at 1st boot
I don't believe intel_pstate was enabled for my cpu prior to 3.10
This is why I did not mark this as a regression
if you are asking if this happened with the older scaling driver that used
ondemand, it did not as far as I am aware

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
