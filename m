From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Tue, 9 Nov 2010 17:38:19 GMT
Message-ID: <201011091738.oA9HcJt4021965@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #48 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-11-09 17:38:09 ---
I modified to patch like you suggested:

+    if (cpu_has(c, X86_FEATURE_APERFMPERF)) {
+        if (disable_average) {
+            printk(KERN_INFO "acpi-cpufreq: average (aperf/mperf) "
+                   "accounting disabled by user\n");
+            clear_cpu_cap(c, X86_FEATURE_APERFMPERF);
+        }
+        else
+            acpi_cpufreq_driver.getavg = cpufreq_get_measured_perf;
+    }

Will the scheduler adapt to the changed cpu features with only that single
change? Since the sched code probably gets initialized earlier, I wonder if it
will notice the change.
Anyways, the system feels a bit more responsive with the modification to the
patch, but that might be a psychologic deception since I know that I made that
change...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
