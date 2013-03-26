From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 54761] Variable cpu frequency causes to loose performance
Date: Tue, 26 Mar 2013 09:41:40 +0000 (UTC)
Message-ID: <20130326094140.C5A3211FB0C@bugzilla.kernel.org>
References: <bug-54761-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-54761-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=54761





--- Comment #4 from Viresh Kumar <viresh.kumar@linaro.org>  2013-03-26 09:41:40 ---
1400 MHz would always be slower than 2700 MHz. And ondemand can't simply switch
to max without much load. So, you can say it that way "Ondemand sometimes have
performance impact" :)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
