From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 36652] New: Ondemand governor is hyperactive
Date: Sat, 4 Jun 2011 16:50:05 GMT
Message-ID: <bug-36652-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=36652

           Summary: Ondemand governor is hyperactive
           Product: Power Management
           Version: 2.5
    Kernel Version: 2.6.39
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@vger.kernel.org
        ReportedBy: timshel@rocketmail.com
        Regression: No


According to some posts Ondemand governor should be the best even in battery
mode because the cpu can sleep longer if the tasks get finished sooner.

This is probably true but at the moment it isn't because Ondemand even scales
up if the cpu doesn't has anything to do.
This might have something to do that the governor can't anticipate how long or
how much this task will need so he scales up all the time if the cpu is used
but this is bad in battery mode.

So either there is a bug in Ondemand governor which should be fixed or if this
happens purely out of performance reasons there should be an additional mode
for battery where it only scales up if the cpu can't handle this with the
lowest task.

I know that there is the conservative governor but it is too slow, for example
it takes ages to scale down.

With powersave the battery time is increased significantly (at least 1W less)
and for most tasks the lowest frequency is fine.

I mean in this idle case of the screen shot it doesn't make any sense to scale
up all the time but even if you play a video there is no need for the highest
frequency and especially not the turbo mode.

I mean why are there more than two frequencies if only they get used?

I am using openSUSE 11.4 with Kernel 2.6.37. I had the same problem with
Vanilla 2.6.39.
My processor is a Core i5 of the first generation.

If you need any additional information let me know.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
