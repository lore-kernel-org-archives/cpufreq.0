From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Fri, 27 Aug 2010 12:27:50 GMT
Message-ID: <201008271227.o7RCRoP3028994@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #8 from Peter Ganzhorn <peter.ganzhorn@googlemail.com>  2010-08-27 12:27:49 ---
Created an attachment (id=28131)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=28131)
dmesg (load test with lowered up_treshold)

I ran the same commands as before with up_treshold=53.

CPU frequency did immediately change to 2GHz when under load.

Is this still a cpufreq bug? I can't help the feeling that the load calculation
is off in some odd way...maybe you'll find something in the log that hints to
the problem.
Thanks for your quick responses by the way!

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
