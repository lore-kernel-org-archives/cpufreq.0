From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Tue, 10 Jun 2014 14:47:06 +0000
Message-ID: <bug-77201-12968-hq3lWDFEkU@https.bugzilla.kernel.org/>
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

--- Comment #25 from Viresh Kumar <viresh.kumar@linaro.org> ---
Probably just do

cat /proc/kmsg &

offline then online cpu

and simply copy logs from minicom ?

-- 
You are receiving this mail because:
You are the assignee for the bug.
