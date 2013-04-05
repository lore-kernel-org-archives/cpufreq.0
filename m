From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 56101] Intel Core2 Duo E6600 reports max-frequency of just 900
 MHz instead of 2.4 GHz
Date: Fri,  5 Apr 2013 14:23:50 +0000 (UTC)
Message-ID: <20130405142350.88DBD11FB79@bugzilla.kernel.org>
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





--- Comment #12 from S. Kalteis <spam@kernelspace.de>  2013-04-05 14:23:50 ---
Sorry, msr.ko was not loaded. cpupower monitor still exits after one second.
Displaying e.g.

    |Mperf               
CPU | C0   | Cx   | Freq 
   0|  3.19| 96.81|  1595
   1|  1.56| 98.44|  1595


(typical Desktop tasks running)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
